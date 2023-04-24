#include "NegativeFilter.h"

NegativeFilter::NegativeFilter(QObject *parent)
    : QObject(parent)
{

}

NegativeFilter::~NegativeFilter()
{

}

void NegativeFilter::applyNegativeFilter(const QString &imageUrl)
{
    m_image.load(imageUrl);
    if (m_image.isNull())
        return;

    for (int x = 0; x < m_image.width(); x++) {
        for (int y = 0; y < m_image.height(); y++) {
            QColor color = m_image.pixelColor(x, y);
            int red = 255 - color.red();
            int green = 255 - color.green();
            int blue = 255 - color.blue();
            m_image.setPixelColor(x, y, QColor(red, green, blue));
        }
    }

    m_image.save("Images/Negative.png");
    emit imageReady(imageUrl);
}

