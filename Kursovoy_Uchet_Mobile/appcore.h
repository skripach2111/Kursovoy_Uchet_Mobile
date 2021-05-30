#ifndef APPCORE_H
#define APPCORE_H

#include <QObject>

#include "connectioncontroller.h"

class AppCore : public QObject
{
    Q_OBJECT

public:
    explicit AppCore(QObject *parent = 0);
};

#endif // APPCORE_H
