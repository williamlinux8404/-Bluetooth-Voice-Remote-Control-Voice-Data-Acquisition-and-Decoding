# 蓝牙语音遥控器语音数据获取与解码 / Bluetooth Voice Remote Control Voice Data Acquisition and Decoding

## 项目概述 / Project Overview
此项目旨在通过Android平台获取蓝牙语音遥控器的语音数据。主要功能包括：
This project aims to acquire voice data from a Bluetooth voice remote control on the Android platform. The main functionalities include:
- 从HID节点获取蓝牙语音遥控器的语音数据。
  Acquiring voice data from the HID nodes of the Bluetooth voice remote control.
- 对获取的语音数据进行解码处理。
  Decoding the acquired voice data.
- 使用Android标准接口Audio Recorder获取并处理语音数据。
  Using the Android standard interface Audio Recorder to retrieve and process voice data.

## 功能 / Features
- **蓝牙通信**：连接并从蓝牙语音遥控器获取数据。
  **Bluetooth Communication**: Connecting to and acquiring data from the Bluetooth voice remote control.
- **HID节点处理**：解析HID节点中的语音数据。
  **HID Node Processing**: Parsing voice data from the HID nodes.
- **音频处理**：通过Audio Recorder接口获取和处理语音数据。
  **Audio Processing**: Retrieving and processing voice data via the Audio Recorder interface.

## 应用场景 / Application Scenarios
- 智能家居控制 / Smart Home Control
- 语音指令识别 / Voice Command Recognition
- 多媒体设备控制 / Multimedia Device Control

## 项目目录 / Project Directory
- `HidToPcm_A11`：针对Android 11的代码
- `HidToPcm_A8`：针对Android 8的代码
- `HidToPcm_A9`：针对Android 9的代码

## 文件说明 / File Description
- `audio_hw.cpp`：Android的音频硬件部分代码。
  **audio_hw.cpp**: The audio hardware part of the Android code.
- `ADPCMDecoder.cpp`：ADPCM解码器实现文件。
  **ADPCMDecoder.cpp**: Implementation file for the ADPCM decoder.
- `ADPCMDecoder.h`：ADPCM解码器头文件。
  **ADPCMDecoder.h**: Header file for the ADPCM decoder.
- `Android.mk`：编译配置文件。
  **Android.mk**: Build configuration file.
- `audio_policy.conf`：音频配置文件，用于配置语音通道。
  **audio_policy.conf**: Audio configuration file used to configure the voice channel.
- `hidraw.patch`：Linux内核补丁，用于绑定hidraw设备节点为hidraw0。
  **hidraw.patch**: Linux kernel patch to bind the hidraw device node as hidraw0 based on the remote control's PID and VID.
- `keymiss.patch`：用于修复Android蓝牙协议栈（Bluedroid）中的一个bug。
  **keymiss.patch**: Patch to fix a bug in the Android Bluetooth stack (Bluedroid) where the host does not delete pairing information when a key miss occurs.


## 安装 / Installation

### 前提条件 / Prerequisites
- Android源码树
- 已配置NDK和环境变量
- JDK 8或更高版本 / JDK 8 or higher
- Linux内核源码树（用于应用`hidraw.patch`） / Linux kernel source tree (for applying `hidraw.patch`)

### 步骤 / Steps

1. 克隆仓库 / Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git

2. 将项目目录中对应的版本文件复制到Android源码树中的相应位置：
Copy the corresponding version files from the project directory to the appropriate location in the Android source tree:
    cp -r HidToPcm_A11/ <path-to-your-android-source-tree>/hardware/libhardware/modules/audio/

3. 根据遥控器的编码格式修改 ADPCMDecoder.cpp 和 ADPCMDecoder.h 文件以支持所需的编解码。
Modify the ADPCMDecoder.cpp and ADPCMDecoder.h files according to the encoding format of the remote control to support the required codec.

4. 编译Android源码树。
Compile the Android source tree:

source build/envsetup.sh
lunch <your_target>
mmm hardware/libhardware/modules/audio/HidToPcm_A11/

5. 编译成功后，将生成的 .so 文件复制到目标设备的 /vendor/lib/hw 目录。
After a successful build, copy the generated .so file to the /vendor/lib/hw directory on the target device.

