#!/bin/sh

# 1. Remount the target filesystem as Read/Write
sudo mount -o remount,rw /root_bypass_ramdisks

# 2. Bind the proc filesystem so the chroot has access to system processes
sudo mount --bind /proc /root_bypass_ramdisks/proc 

# 3. Execute commands inside the chroot environment
sudo chroot /root_bypass_ramdisks /bin/bash <<EOF
cd /home/pi/tm20
apt update
apt install -y build-essential cmake libcups2-dev libcupsimage2-dev
mkdir -p build && cd build
cmake ../
cmake --build .
make install
exit
EOF

# 4. Finalize and Reboot
echo "Build complete. Shutdown..."
sudo shutdown now
