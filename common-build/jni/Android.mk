# THANKS for INITIAL GUIDANCE:
# https://code.tutsplus.com/tutorials/advanced-android-getting-started-with-the-ndk--mobile-2152
# original location:
# http://mobile.tutsplus.com/tutorials/android/ndk-tutorial/

LOCAL_PATH := $(call my-dir)

ROOT_PATH := $(LOCAL_PATH)/../..
SRC_PATH := ../../native

include $(CLEAR_VARS)  

LOCAL_LDLIBS := -llog

LOCAL_MODULE    := sqlc-evcore-native-driver

LOCAL_C_INCLUDES := $(ROOT_PATH)/sqlite-amalgamation

# extbuild only:
# LOCAL_C_INCLUDES += ...

LOCAL_CFLAGS += -DSQLITE_TEMP_STORE=2 -DSQLITE_THREADSAFE=2
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_RTREE

# extbuild only:
# LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS5
# LOCAL_CFLAGS += -DSQLITE_ENABLE_JSON1

# additional flags:
LOCAL_CFLAGS += -DSQLITE_DEFAULT_PAGE_SIZE=4096
LOCAL_CFLAGS += -DSQLITE_DEFAULT_CACHE_SIZE=-2000

LOCAL_SRC_FILES := $(SRC_PATH)/sqlc_all.c

include $(BUILD_SHARED_LIBRARY)