#!/bin/sh

TARGET=${1:-$TARGET}
MESSAGE=${2:-$MESSAGE}

if [ -z "$TARGET" ] || [ -z "$MESSAGE" ]; then
    echo "Usage: docker run sender <target-ip> <message>"
    exit 1
fi

echo "Sending '$MESSAGE' to $TARGET..."
hping3 --udp -p 9 -d 100 --sign "$MESSAGE" "$TARGET"