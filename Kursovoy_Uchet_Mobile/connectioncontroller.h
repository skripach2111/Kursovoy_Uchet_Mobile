#ifndef CONNECTIONCONTROLLER_H
#define CONNECTIONCONTROLLER_H

#include <QObject>
#include <QtNetwork>

enum COMMAND { PING = 1, MESSAGE = 2 };

class ConnectionController : public QObject
{
    Q_OBJECT

    QTcpSocket *tcpSocket;
    quint16 blockSize;
    QHostAddress host;
    short unsigned int port;

public:
    ConnectionController(QObject *parent = 0);

signals:
    void disconnected();
    void connected();
    void errorConnection(QString message);

public slots:
    void connect(QString host, int port);
    void disconnect();
    void send(QString message);

    void slotReadyRead();
    void slotDisconnected();
    void slotConnected();
    void slotError(QAbstractSocket::SocketError);
};

#endif // CONNECTIONCONTROLLER_H
