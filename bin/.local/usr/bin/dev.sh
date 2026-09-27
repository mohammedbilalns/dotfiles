#!/bin/bash

FRONTEND_DIR="/home/bilalnsmuhammed/my_projects/upstride/frontend"
BACKEND_DIR="/home/bilalnsmuhammed/my_projects/upstride/backend"

# launch frontend
niri msg action spawn-sh -- \
"foot bash -c 'cd \"$FRONTEND_DIR\" && npm run dev'"

sleep 0.5

# launch backend
niri msg action spawn-sh -- \
"foot bash -c 'cd \"$BACKEND_DIR\" && docker compose -f docker-compose.dev.yml up'"

sleep 0.5

# stack columns vertically
niri msg action consume-or-expel-window-left
