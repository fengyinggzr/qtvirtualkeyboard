# Generated from nn.pro.

#####################################################################
## nn Generic Library:
#####################################################################

qt_add_cmake_library(nn
    MODULE
    INSTALL_DIRECTORY "${INSTALL_PLUGINSDIR}/lipi_toolkit" # special case
    EXCEPTIONS
    OUTPUT_DIRECTORY "${QT_BUILD_DIR}/plugins/lipi_toolkit"
    SOURCES
        NN.cpp NN.h
        NNAdapt.cpp NNAdapt.h
        NNShapeRecognizer.cpp NNShapeRecognizer.h
    INCLUDE_DIRECTORIES
        ../../../include
        ../../../util/lib
        ../common
        ../featureextractor/common
    PUBLIC_LIBRARIES
        Qt::Core
        Qt::Gui
)
qt_disable_warnings(nn)

#### Keys ignored in scope 1:.:.:nn.pro:<TRUE>:
# LIPILIBS = "shaperecommon" "ltkcommon" "ltkutil" "featureextractorcommon"

## Scopes:
#####################################################################

qt_extend_target(nn CONDITION WIN32
    DEFINES
        NN_EXPORTS
    PUBLIC_LIBRARIES
        Advapi32.lib
)

qt_extend_target(nn CONDITION NOT LIPILIBS_ISEMPTY
    PUBLIC_LIBRARIES
        # Remove: L/lib
)

qt_autogen_tools_initial_setup(nn)
