# PiMoEye
Raspberry Pi MotionEye deployment on Raspbian Lite

Usage:
bash deploy.sh <new_hostname>

The following then happens:
- Timezone and local time are set to Europe/London (you can edit this)
- Hostname is set to the passed parameter
- bcm2835-v4l2 is added to /etc/modules for using a CSI connected camera
- Camera interface is enabled
- GPU memory is assigned as 128mb
- Camera LED is disabled
- FFMPEG is installed
- Python requirements are installed
- Motion daemon is installed
- MotionEye is installed
- Directories and service for MotionEye are setup
