#ifndef NEGATIVEFILTER_H
#define NEGATIVEFILTER_H


#include <QImage>
#include <QObject>
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlComponent>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickView>

class NegativeFilter : public QObject
{
    Q_OBJECT
private:
    QImage m_image;
public:
    NegativeFilter(QObject *parent = 0);
    ~NegativeFilter();
    Q_INVOKABLE void applyNegativeFilter(const QString &imageUrl);

signals:
    void imageReady(const QString &imageUrl);

//public slots:
//    void applyFilter(QQuickItem* image);
};

#endif // NEGATIVEFILTER_H
