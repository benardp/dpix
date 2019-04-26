CONFIG += debug_and_release

CONFIG(release, debug|release) {
	DBGNAME = release
}
else {
	DBGNAME = debug
}
DESTDIR = $${DBGNAME}

win32 {
	TEMPLATE = vclib
}
else {
	TEMPLATE = lib

	macx {
		DEFINES += DARWIN
	}
	else {
		DEFINES += LINUX
                QMAKE_LFLAGS += -fopenmp
                QMAKE_CXXFLAGS += -fopenmp
	}
}

CONFIG += staticlib
QT += opengl xml

TARGET = npr

DEPENDPATH += include
INCLUDEPATH += include
DEPENDPATH += ../libcda/include
INCLUDEPATH += ../libcda/include
DEPENDPATH += ../libgq/include
INCLUDEPATH += ../libgq/include

#Input
HEADERS += include/*.h
SOURCES += libsrc/*.cc

OTHER_FILES += \
    shaders/programs.xml \
    shaders/*.vert \
    shaders/*.frag \
    shaders/*.glsl \
    shaders/*.geom
