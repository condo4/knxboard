#!/bin/sh

openocd -f $2 -c init -c "reset halt" -c "flash write_image erase $1" -c "reset halt" &
OPENOCD_PID=$!
echo "OPENOCD_PID = $OPENOCD_PID"

sleep 2
gdb-multiarch -ex 'target remote localhost:3333' $1 || true

kill $OPENOCD_PID
