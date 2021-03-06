include(InstallRequiredSystemLibraries)
set(CPACK_PACKAGE_CONTACT Vitasman98@yandex.ru)
set(CPACK_PACKAGE_VERSION_MAJOR ${VECTOR_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${VECTOR_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${VECTOR_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION_TWEAK ${VECTOR_VERSION_TWEAK})
set(CPACK_PACKAGE_VERSION ${VECTOR_VERSION})
set(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_CURRENT_SOURCE_DIR}/DESCRIPTION)
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "vector, c++ library")

set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE)
set(CPACK_RESOURCE_FILE_README ${CMAKE_CURRENT_SOURCE_DIR}/README.md)

set(CPACK_RPM_PACKAGE_NAME "vector-devel")
set(CPACK_RPM_PACKAGE_LICENSE "MIT")
set(CPACK_RPM_PACKAGE_GROUP "vector")
set(CPACK_RPM_PACKAGE_URL "https://github.com/Spardoks/vector")
set(CPACK_RPM_CHANGELOG_FILE ${CMAKE_CURRENT_SOURCE_DIR}/ChangeLog.md)
set(CPACK_RPM_PACKAGE_RELEASE 1)

set(CPACK_DEBIAN_PACKAGE_NAME "libvector-dev")
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "https://Spardoks.github.io/vector")
set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake >= 3.0")
set(CPACK_DEBIAN_PACKAGE_RELEASE 1)

include(CPack)
