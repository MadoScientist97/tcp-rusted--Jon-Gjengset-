!#/bin/bash

TARGET_DIR="/home/kakulookia/codingStuff/clonedRepos/tcp-rusted-based-on-Jon-Gjengset/target/release"
cargo b --release
sudo setcap cap_net_admin=eip ${TARGET_DIR}/tcp-rusted
${TARGET_DIR}/tcp-rusted &
pid=$!
sudo ip addr add 10.0.2.25/24 dev tun0
sudo ip link set dev tun0 up
wait $pid
