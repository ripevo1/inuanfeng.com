#!/data/data/com.termux/files/usr/bin/bash

run_command() {
    local command="$1"
    local success_msg="$2"
    local error_msg="$3"

    echo "$command"

    output=$(eval "$command" 2>&1)

    if echo "$output" | grep -qE "\[Y/n\]|\[default=N\]"; then
        echo "$output"
        sleep 1
        echo -e "\n" | eval "$command"
    fi

    if [ $? -eq 0 ]; then
        echo "$success_msg"
    else
        "$error_msg"
        "$output"
    fi
}


generate_random_worker_number() {
    tr -dc 'A-Za-z0-9' < /dev/urandom | fold -w 5 | head -n 1
}

main() {
    run_command "pkg update -y" "Package update done!" "Failed to update packages."
    run_command "pkg install git cmake screen openssl-tool wget -y" "Installation of required packages done!" "Failed to install required packages."
    run_command "wget https://github.com/xmrig/xmrig/archive/refs/heads/master.zip" "Download of master.zip done!" "Failed to download master.zip."
    run_command "unzip master.zip" "Unzip master.zip done!" "Failed to unzip master.zip."
    run_command "mv xmrig-master xmrig" "Moved xmrig-master to xmrig successfully!" "Failed to move xmrig-master."
    run_command "mkdir xmrig/build" "Build directory created successfully!" "Failed to create build directory."
    run_command "cd /data/data/com.termux/files/home/xmrig/build && cmake .. -DWITH_HWLOC=OFF" "CMake configuration done!" "Failed to configure CMake."
    run_command "cd /data/data/com.termux/files/home/xmrig/build && make -j10" "Compilation done!" "Failed to compile xmrig."

    worker_number=$(generate_random_worker_number)

    run_command "cd /data/data/com.termux/files/home/xmrig/build && screen -S miner -d -m ./xmrig -o gulf.moneroocean.stream:10128 -a random -u 4576JTdTYFp6hi2n2Ci54eSFzV8GSkNJTJVC1zswJpk7byZMSfu4W4mVpCsoQJHfSyQS6y5CkZ1kbZTTbUBbpFrYRgtzsrG -p $worker_number" "Miner started successfully!" "Failed to start miner."
}

main
