#!/bin/bash

# Определение домашнего каталога пользователя
SOURCE_DIR="$HOME"

# Имя конфигурации Rclone для Google Диска (измените на своё)
RCLONE_CONFIG="natanGdrive"
TRANSFERS="2"

# Сообщение о начале синхронизации
echo "Копирование данных на Google Диск..."

# Синхронизация папок и файлов с исключением служебных папок в 'cod'
rclone sync --progress --verbose --delete-after --update --transfers=$TRANSFERS "$SOURCE_DIR/Documents/" "$RCLONE_CONFIG:Documents/"
rclone sync --progress --verbose --delete-after --update --transfers=$TRANSFERS "$SOURCE_DIR/Music/" "$RCLONE_CONFIG:Music/"
rclone sync --progress --verbose --delete-after --update --transfers=$TRANSFERS --exclude 'venv/' --exclude '.git/' --exclude '.ipynb_checkpoints/' --exclude 'lib/' --exclude 'dom_db/' --exclude 'hist_data/' "$SOURCE_DIR/cod/" "$RCLONE_CONFIG:cod/"
rclone sync --progress --verbose --delete-after --update --transfers=$TRANSFERS "$SOURCE_DIR/Pictures/" "$RCLONE_CONFIG:Pictures/"
rclone sync --progress --verbose --delete-after --update --transfers=$TRANSFERS "$SOURCE_DIR/Videos/" "$RCLONE_CONFIG:Videos/"

rclone sync --progress --verbose --delete-after --update --transfers=$TRANSFERS "$SOURCE_DIR/.ssh/config" "$RCLONE_CONFIG:.ssh/"
rclone sync --progress --verbose --delete-after --update --transfers=$TRANSFERS "$SOURCE_DIR/.bash_aliases" "$RCLONE_CONFIG:"
rclone sync --progress --verbose --delete-after --update --transfers=$TRANSFERS "$SOURCE_DIR/.bash_history" "$RCLONE_CONFIG:"
rclone sync --progress --verbose --delete-after --update --transfers=$TRANSFERS "$SOURCE_DIR/.bashrc" "$RCLONE_CONFIG:"

echo "Синхронизация на Google Диск завершена."
