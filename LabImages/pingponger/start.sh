#!/bin/sh
sleep 1

if [ -n "$TARGET" ] && [ -n "$MESSAGE" ]; then
    /send.sh "$TARGET" "$MESSAGE" &
fi

exec tail -f /dev/null