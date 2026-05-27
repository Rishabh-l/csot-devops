#!/usr/bin/env bash
TODOS="$(dirname "$0")/todos.txt"
touch "$TODOS"

case "$1" in
    add)
        id=$(wc -l < "$TODOS")
        id=$((id + 1))
        echo "$id|$2|pending" >> "$TODOS"
        echo "Added task $id: $2"
        ;;
    list)
        while IFS='|' read -r id desc status; do
            if [ "$status" = "done" ]; then
                echo "$id: [x] $desc"
            else
                echo "$id: [ ] $desc"
            fi
        done < "$TODOS"
        ;;
    done)
        sed -i "s/^$2|.*|pending/$2|$(grep "^$2|" "$TODOS" | cut -d'|' -f2)|done/" "$TODOS"
        echo "Task $2 marked as done"
        ;;
    delete)
        sed -i "/^$2|/d" "$TODOS"
        echo "Task $2 deleted"
        ;;
    *)
        echo "Usage: $0 {add|list|done|delete}"
        ;;
esac
