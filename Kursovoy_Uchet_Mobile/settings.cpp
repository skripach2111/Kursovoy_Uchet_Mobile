#include "settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{
    settings = new QSettings("settings.conf", QSettings::NativeFormat, this);
    scanPreview = settings->value("scanPreview", true).toBool();
}

Settings::~Settings()
{
    save();
    delete settings;
}

void Settings::save()
{
    settings->sync();
}

bool Settings::getScanPreview()
{
    return scanPreview;
}

void Settings::setScanPreview(bool flag)
{
    scanPreview = flag;
    settings->setValue("scanPreview", scanPreview);
}
