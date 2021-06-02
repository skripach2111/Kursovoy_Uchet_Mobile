#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT

    bool scanPreview;
    QSettings* settings;

    Q_PROPERTY(bool scanPreview
               READ getScanPreview
               WRITE setScanPreview);
public:
    explicit Settings(QObject *parent = nullptr);
    ~Settings();

    bool getScanPreview();
    void setScanPreview(bool flag);

signals:

public slots:
    void save();
};

#endif // SETTINGS_H
