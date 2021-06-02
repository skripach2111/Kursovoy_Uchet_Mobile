#include "connectioncontroller.h"

ConnectionController::ConnectionController(QObject *parent) : QObject(parent)
{
    blockSize = 0;
}

void ConnectionController::connect(QString host, int port)
{
    tcpSocket = new QTcpSocket();
    blockSize = 0;

    QObject::connect(tcpSocket, SIGNAL(readyRead()), this, SLOT(slotReadyRead()));
    QObject::connect(tcpSocket, SIGNAL(connected()), this, SLOT(slotConnected()));
    QObject::connect(tcpSocket, SIGNAL(disconnected()), this, SLOT(slotDisconnected()));
    QObject::connect(tcpSocket, SIGNAL(error(QAbstractSocket::SocketError)),this, SLOT(slotError(QAbstractSocket::SocketError)));

    this->host = host;
    this->port = port;

    tcpSocket->connectToHost(this->host, this->port);
}


void ConnectionController::slotConnected()
{
    emit connected();
}

void ConnectionController::slotError(QAbstractSocket::SocketError err)
{
    QString strError =
            "Error: " + (err == QAbstractSocket::HostNotFoundError ?
                             "The host was not found." :
                             err == QAbstractSocket::RemoteHostClosedError ?
                                 "The remote host is closed." :
                                 err == QAbstractSocket::ConnectionRefusedError ?
                                     "The connection was refused." :
                                     QString(tcpSocket->errorString())
                                     );

    emit errorConnection(strError);
}

void ConnectionController::disconnect()
{
    tcpSocket->disconnectFromHost();
    emit disconnected();
}

void ConnectionController::slotDisconnected()
{
    disconnect();
}

void ConnectionController::send(QString message)
{
    if(message.size() != 0)
    {
        QByteArray block;
        QDataStream out(&block, QIODevice::WriteOnly);

        out << (quint16)0 << MESSAGE << message;

        out.device()->seek(0);

        out << (quint16)(block.size() - sizeof(quint16));
        tcpSocket->write(block);
    }
}

void ConnectionController::slotReadyRead()
{

}
