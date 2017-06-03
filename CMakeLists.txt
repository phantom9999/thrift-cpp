cmake_minimum_required(VERSION 2.8)


set(CMAKE_CXX_FLAGS "-DHAVE_CONFIG_H -D__STDC_LIMIT_MACROS -Wall -Wextra -g -O2 -std=c++11")
include_directories(src)

aux_source_directory(src/thrift/async ASYNC)
# aux_source_directory(src/thrift/concurrency CONCURRENCY)

# BoostMonitor.cpp
# BoostMutex.cpp
# BoostThreadFactory.cpp
# BoostThreadFactory.h
# StdMonitor.cpp
# StdMutex.cpp
# StdThreadFactory.cpp
# StdThreadFactory.h

set(CONCURRENCY
        src/thrift/concurrency/Monitor.cpp
        src/thrift/concurrency/Mutex.cpp
        src/thrift/concurrency/PosixThreadFactory.cpp
        src/thrift/concurrency/PosixThreadFactory.h
        src/thrift/concurrency/Monitor.h
        src/thrift/concurrency/FunctionRunner.h
        src/thrift/concurrency/PlatformThreadFactory.h
        src/thrift/concurrency/TimerManager.cpp
        src/thrift/concurrency/TimerManager.h
        src/thrift/concurrency/Thread.h
        src/thrift/concurrency/Util.cpp
        src/thrift/concurrency/ThreadManager.cpp
        src/thrift/concurrency/Util.h
        src/thrift/concurrency/Exception.h
        src/thrift/concurrency/Mutex.h
        src/thrift/concurrency/ThreadManager.h
        )


aux_source_directory(src/thrift/processor PROCESSOR)
aux_source_directory(src/thrift/protocol PROTOCOL)
aux_source_directory(src/thrift/server SERVER)
aux_source_directory(src/thrift/transport TRANSPORT)
aux_source_directory(src/thrift THRIFT)


include(${PROJECT_SOURCE_DIR}/cmake/FindLibevent.cmake)

set(Boost_USE_STATIC_LIBS        ON)
set(Boost_USE_MULTITHREADED      ON)
set(Boost_USE_STATIC_RUNTIME     ON)
find_package(
        Boost COMPONENTS
        thread
)




include_directories(${Boost_INCLUDE_DIRS})



#set(LIBEVENT_ROOT /usr/local/Cellar/libevent/2.0.22)
#find_package(Libevent REQUIRED)
#include_directories(${LIBEVENT_INCLUDE_DIRS})


add_library(
        thriftpp
        ${ASYNC}
        ${CONCURRENCY}
        ${PROCESSOR}
        ${PROTOCOL}
        ${SERVER}
        ${TRANSPORT}
        ${THRIFT}
)

target_link_libraries(
        thriftpp
        -levent
        -lz
        -lssl -lcrypto
        ${Boost_LIBRARIES}
        ${OPENSSL_LIBRARIES}

)





