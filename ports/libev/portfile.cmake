vcpkg_download_distfile(ARCHIVE
    URLS "http://dist.schmorp.de/libev/Attic/libev-4.33.tar.gz"
    FILENAME "libev-4.33.tar.gz"
    SHA512 c662a65360115e0b2598e3e8824cf7b33360c43a96ac9233f6b6ea2873a10102551773cad0e89e738541e75af9fd4f3e3c11cd2f251c5703aa24f193128b896b
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

file(COPY
    "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt"
    "${CMAKE_CURRENT_LIST_DIR}/config.h"
    DESTINATION "${SOURCE_PATH}"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

file(
    INSTALL "${SOURCE_PATH}/LICENSE"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
    RENAME copyright
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
