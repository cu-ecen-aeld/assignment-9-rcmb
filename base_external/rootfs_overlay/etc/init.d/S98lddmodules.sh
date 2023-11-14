#!/bin/sh

MODULE_LOAD_EXEC=/sbin/modprobe
MODULE_UNLOAD_EXEC=/sbin/rmmod

# Check if the executables exist
if [ ! -x "$MODULE_LOAD_EXEC" ] || [ ! -x "$MODULE_UNLOAD_EXEC" ]; then
    echo "Module-related executables not found at $MODULE_LOAD_EXEC or $MODULE_UNLOAD_EXEC"
    exit 1
fi

# Function to start the modules
start_modules() {
    echo "Loading scull and faulty modules"
    $MODULE_LOAD_EXEC faulty
    #scull_load
    /usr/bin/aesdchar_load   
    $MODULE_LOAD_EXEC hello
}

# Function to stop the modules
stop_modules() {
    echo "Unloading scull and faulty modules"
    $MODULE_UNLOAD_EXEC faulty
    #scull_unload
    /usr/bin/aesdchar_unload  
    $MODULE_UNLOAD_EXEC hello
}

# Check for the start or stop command
case "$1" in
    start)
        start_modules
        ;;
    stop)
        stop_modules
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac

exit 0



