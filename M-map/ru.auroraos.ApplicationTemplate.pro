

TARGET = ru.auroraos.ApplicationTemplate

CONFIG += \
    auroraapp \

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    icons/main/subway.png \
    qml/pages/InfoPage.qml \
    qml/pages/NewsPage.qml \
    rpm/ru.auroraos.ApplicationTemplate.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.auroraos.ApplicationTemplate.ts \
    translations/ru.auroraos.ApplicationTemplate-ru.ts \
