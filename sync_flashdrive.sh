#!/bin/bash

# Определение путей (относительно текущего скрипта)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET_DIR="$SCRIPT_DIR"  # Целевой каталог на флешке (текущая директория)
CONFIG_DIR="$TARGET_DIR/backup_config"  # Папка для хранения конфигурационных файлов
DOCUMENTS_DIR="$TARGET_DIR/Documents"  # Папка для хранения документов
MUSIC_DIR="$TARGET_DIR/Music"
COD_DIR="$TARGET_DIR/cod"
PICTURES_DIR="$TARGET_DIR/Pictures"

# Создание необходимых папок на флешке
mkdir -p "$CONFIG_DIR" "$DOCUMENTS_DIR" "$COD_DIR" "$MUSIC_DIR" "$PICTURES_DIR"

# Определение домашнего каталога пользователя
SOURCE_DIR="$HOME"

# Синхронизация папок и файлов
rsync -avu --delete --progress "$SOURCE_DIR/Documents/" "$DOCUMENTS_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/Music/" "$MUSIC_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/cod/" "$COD_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/Pictures/" "$PICTURES_DIR/"

rsync -avu --delete --progress "$SOURCE_DIR/.ssh/config" "$CONFIG_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/.bash_aliases" "$CONFIG_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/.bash_history" "$CONFIG_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/.bashrc" "$CONFIG_DIR/"

echo "Синхронизация завершена."
