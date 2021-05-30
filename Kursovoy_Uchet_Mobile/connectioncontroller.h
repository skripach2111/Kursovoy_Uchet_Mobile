#ifndef CONNECTIONCONTROLLER_H
#define CONNECTIONCONTROLLER_H

#include <QObject>
#include <QtNetwork>

class ConnectionController : public QObject
{
    Q_OBJECT

    QTcpSocket *tcpSocket;
    quint16 blockSize;

public:
    ConnectionController(QObject *parent = 0);
};

#endif // CONNECTIONCONTROLLER_H
