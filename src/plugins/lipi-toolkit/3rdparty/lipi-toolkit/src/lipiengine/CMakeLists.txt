# Generated from lipiengine.pro.

#####################################################################
## lipiengine Generic Library:
#####################################################################

qt_add_cmake_library(lipiengine
    MODULE
    INSTALL_DIRECTORY "${INSTALL_PLUGINSDIR}/lipi_toolkit" # special case
    EXCEPTIONS
    OUTPUT_DIRECTORY "${QT_BUILD_DIR}/plugins/lipi_toolkit"
    SOURCES
        LipiEngineModule.cpp LipiEngineModule.h
        lipiengine.cpp lipiengine.h
    INCLUDE_DIRECTORIES
        ../include
        ../util/lib
    PUBLIC_LIBRARIES
        Qt::Core
        Qt::Gui
)
qt_disable_warnings(lipiengine)

#### Keys ignored in scope 1:.:.:lipiengine.pro:<TRUE>:
# LIPILIBS = "shaperecommon" "ltkcommon" "ltkutil" "wordreccommon"

## Scopes:
#####################################################################

qt_extend_target(lipiengine CONDITION WIN32
    DEFINES
        LIPIENGINE_EXPORTS
    PUBLIC_LIBRARIES
        Advapi32.lib
)

qt_extend_target(lipiengine CONDITION NOT LIPILIBS_ISEMPTY
    PUBLIC_LIBRARIES
        # Remove: L/lib
)

qt_autogen_tools_initial_setup(lipiengine)
