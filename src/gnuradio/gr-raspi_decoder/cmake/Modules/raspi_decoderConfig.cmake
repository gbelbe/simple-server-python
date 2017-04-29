INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_RASPI_DECODER raspi_decoder)

FIND_PATH(
    RASPI_DECODER_INCLUDE_DIRS
    NAMES raspi_decoder/api.h
    HINTS $ENV{RASPI_DECODER_DIR}/include
        ${PC_RASPI_DECODER_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    RASPI_DECODER_LIBRARIES
    NAMES gnuradio-raspi_decoder
    HINTS $ENV{RASPI_DECODER_DIR}/lib
        ${PC_RASPI_DECODER_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(RASPI_DECODER DEFAULT_MSG RASPI_DECODER_LIBRARIES RASPI_DECODER_INCLUDE_DIRS)
MARK_AS_ADVANCED(RASPI_DECODER_LIBRARIES RASPI_DECODER_INCLUDE_DIRS)

