cmake_minimum_required(VERSION 3.16)

project(basic-ciphers)
set(APP_NAME ${PROJECT_NAME})

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT USE_QT5)
    find_package(Qt6 COMPONENTS Core Gui Qml QuickControls2 QmlImportScanner)
endif()
if(NOT Qt6_FOUND)
    find_package(Qt5 5.15 COMPONENTS Core Gui Qml QuickControls2 QmlImportScanner REQUIRED)
endif()

get_target_property(QMAKE Qt::qmake IMPORTED_LOCATION)

find_package(Corrosion QUIET)
if(NOT Corrosion_FOUND)
    include(FetchContent)
    FetchContent_Declare(
        Corrosion
	GIT_REPOSITORY https://github.com/corrosion-rs/corrosion.git
	GIT_TAG v0.3.0
    )

    FetchContent_MakeAvailable(Corrosion)
endif()

set(CRATE basic-ciphers-cxxqt)
corrosion_import_crate(MANIFEST_PATH rust/Cargo.toml CRATES ${CRATE})

set(CXXQT_EXPORT_DIR "${CMAKE_CURRENT_BINARY_DIR}/cxxqt")
corrosion_set_env_vars(${CRATE}
	"CXXQT_EXPORT_DIR=${CXXQT_EXPORT_DIR}"
	"QMAKE=${QMAKE}"
)

target_include_directories(${CRATE} INTERFACE "${CXXQT_EXPORT_DIR}/${CRATE}")

target_link_libraries(${CRATE} INTERFACE
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::QuickControls2
)

add_executable(${APP_NAME} cpp/main.cpp qml/qml.qrc)

target_link_libraries(${APP_NAME} PRIVATE ${CRATE})

qt_import_qml_plugins(${APP_NAME})
