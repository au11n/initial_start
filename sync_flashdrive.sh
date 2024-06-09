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

# Синхронизация папок и файлов с исключением служебных папок в 'cod'
rsync -avu --delete --progress --exclude 'excluded_folder/' "$SOURCE_DIR/Documents/" "$DOCUMENTS_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/Music/" "$MUSIC_DIR/"
rsync -avu --delete --progress --exclude 'venv/' --exclude '.git/' --exclude '.ipynb_checkpoints/' --exclude 'lib/' --exclude 'hist_data/' "$SOURCE_DIR/cod/" "$COD_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/Pictures/" "$PICTURES_DIR/"

rsync -avu --delete --progress "$SOURCE_DIR/.ssh/config" "$CONFIG_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/.bash_aliases" "$CONFIG_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/.bash_history" "$CONFIG_DIR/"
rsync -avu --delete --progress "$SOURCE_DIR/.bashrc" "$CONFIG_DIR/"

# Синхронизация файла sync_flashdrive.sh
rsync -avu --progress "$SOURCE_DIR/cod/initial_start/sync_flashdrive.sh" "$TARGET_DIR/"

echo "Синхронизация завершена."
