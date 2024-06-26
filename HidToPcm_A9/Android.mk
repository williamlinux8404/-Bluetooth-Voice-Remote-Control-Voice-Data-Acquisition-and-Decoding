# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := audio.LSDAudio.default
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SRC_FILES := \
	audio_hw.cpp \
	ADPCMDecoder.cpp
LOCAL_C_INCLUDES += \
	frameworks/av/include/ \
	frameworks/native/include \
	external/tinyalsa/include \
	external/expat/lib \
    hardware/libhardware/include \
	system/media/audio_utils/include \
	system/media/audio_effects/include
	

LOCAL_SHARED_LIBRARIES := liblog libcutils libtinyalsa libaudioutils libexpat libdl
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
#LOCAL_MULTILIB := 32
LOCAL_CFLAGS += -Wno-error=unused-variable -Wno-error=unused-function -Wno-error=unused-label -Wno-error=unused-value -Wno-error=unused-parameter -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -Wno-error=format
include $(BUILD_SHARED_LIBRARY)

