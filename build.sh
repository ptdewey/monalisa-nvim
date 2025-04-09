#!/usr/bin/env bash

export LUA_PATH=./lush_theme/monalisa.lua

nvim --headless +Shipwright +qa

echo "MonaLisa build complete"
