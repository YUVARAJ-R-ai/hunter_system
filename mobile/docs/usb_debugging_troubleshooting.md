# USB Debugging Troubleshooting Guide

This document records the diagnostics and resolution steps taken to troubleshoot the USB debugging issue on the NixOS system when deploying to a physical Android device.

---

## 1. Diagnostics Run

To pinpoint the issue, we ran a series of commands to check the connection at different layers:

### A. Device Detection via Flutter & ADB
We started by checking if Flutter or Android Debug Bridge (ADB) could detect the device:
```bash
adb devices
flutter devices
```
* **Result**: `adb devices` returned an empty list, and `flutter devices` only listed the local Linux Desktop environment.

### B. Environment Check
We ran Flutter doctor to verify Android SDK and toolchain setup:
```bash
flutter doctor
```
* **Result**: The Android SDK (v35.0.0) was present and correctly set up, though some licenses were pending acceptance. This confirmed that the SDK was not the issue.

### C. USB Hardware Check (Kernel Level)
We verified if the physical connection was working at the OS kernel level using `lsusb`:
```bash
lsusb
```
* **Result**: The device was successfully detected on the USB bus:
  `Bus 003 Device 011: ID 18d1:4ee9 motorola moto g96 5G`
  This confirmed that the USB cable and hardware connection were fully functional.

---

## 2. Root Cause Analysis

Since the USB hardware was connected but ADB could not communicate, we restarted the ADB daemon to force a clean handshake:
```bash
adb kill-server
adb devices
```
* **New Output**:
  ```
  List of devices attached
  ZD222TTN33      unauthorized
  ```

### **Root Cause**:
The device was detected by ADB, but the host machine was **unauthorized** on the phone. This happens when the RSA key handshake between the computer and the Android device has not been approved on the phone screen.

---

## 3. Resolution Steps

To transition the device from `unauthorized` to `device`, follow these steps on your phone:

1. **Authorize the Connection**:
   - Unlock your phone.
   - You should see a prompt: **"Allow USB debugging?"**
   - Check the box **"Always allow from this computer"** and tap **Allow**.

2. **If the prompt does not appear**:
   - Unplug the USB cable and plug it back in.
   - Go to your phone's **Settings > Developer Options**.
   - Tap **Revoke USB debugging authorizations**, then reconnect the USB cable to prompt a fresh authorization dialog.

3. **Verify Connection**:
   - Run the command:
     ```bash
     adb devices
     ```
   - It should now output:
     ```
     List of devices attached
     ZD222TTN33      device
     ```
