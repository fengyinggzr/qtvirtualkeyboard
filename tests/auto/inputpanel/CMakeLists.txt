# Generated from inputpanel.pro.

#####################################################################
## tst_inputpanel Test:
#####################################################################

# Collect test data
file(GLOB_RECURSE test_data_glob
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/data/*)
list(APPEND test_data ${test_data_glob})

qt_add_test(tst_inputpanel
    QMLTEST
    SOURCES
        tst_inputpanel.cpp
    PUBLIC_LIBRARIES
        Qt::Gui
    TESTDATA ${test_data}
)

#### Keys ignored in scope 1:.:.:inputpanel.pro:<TRUE>:
# OTHER_FILES = "$$PWD/data/inputpanel/inputpanel.qml" "$$PWD/data/inputpanel/handwritinginputpanel.qml" "$$PWD/data/tst_inputpanel.qml"
# TEMPLATE = "app"

## Scopes:
#####################################################################

qt_extend_target(tst_inputpanel CONDITION NOT QT_BUILD_SHARED_LIBS
    PUBLIC_LIBRARIES
        Qt::Svg
)

#### Keys ignored in scope 2:.:.:inputpanel.pro:NOT QT_BUILD_SHARED_LIBS:
# QTPLUGIN = "qtvirtualkeyboardplugin"
