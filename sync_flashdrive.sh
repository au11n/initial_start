#!/bin/bash
# Определение путей (относительно текущего скрипта)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET_DIR="$SCRIPT_DIR" # Целевой каталог на флешке (текущая директория)
CONFIG_DIR="$TARGET_DIR/backup_config/system_configs" # Папка для хранения конфигурационных файлов
DOCUMENTS_DIR="$TARGET_DIR/Documents" # Папка для хранения документов
MUSIC_DIR="$TARGET_DIR/Music"
COD_DIR="$TARGET_DIR/cod"
PICTURES_DIR="$TARGET_DIR/Pictures"
VIDEOS_DIR="$TARGET_DIR/Videos"
SOFT_DIR="$TARGET_DIR/soft"
ARCHIVE_DIR="$TARGET_DIR/archive"
BOOKS_DIR="$TARGET_DIR/books"

# Создание необходимых папок на флешке
mkdir -p "$CONFIG_DIR" "$DOCUMENTS_DIR" "$COD_DIR" "$MUSIC_DIR" "$PICTURES_DIR" "$VIDEOS_DIR" "$SOFT_DIR" "$ARCHIVE_DIR" "$BOOKS_DIR"

# Определение домашнего каталога пользователя
SOURCE_DIR="$HOME"
BACKUP_CONFIG_DIR="$SOURCE_DIR/backup_config/system_configs"
mkdir -p "$BACKUP_CONFIG_DIR"

# Запуск Python-скрипта перед запросом выбора варианта копирования
python3 "$SOURCE_DIR/cod/initial_start/file_chng.py"

# Запрос направления копирования
echo "Выберите направление копирования:"
echo "1. Копировать из домашней директории на внешний диск"
echo "0. Копировать с внешнего диска в домашнюю директорию"
read -p "Введите 1 или 0: " DIRECTION

# Проверка направления копирования и выполнение соответствующей синхронизации
if [ "$DIRECTION" == "1" ]; then
    # Синхронизация папок и файлов с исключением служебных папок в 'cod'
    rsync -avu --delete --progress "$SOURCE_DIR/Documents/" "$DOCUMENTS_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/Music/" "$MUSIC_DIR/"
    rsync -avu --delete --progress --exclude 'venv/' --exclude '.git/' --exclude '.ipynb_checkpoints/' --exclude 'lib/' --exclude 'dom_db/' --exclude 'hist_data/' "$SOURCE_DIR/cod/" "$COD_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/Pictures/" "$PICTURES_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/Videos/" "$VIDEOS_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/archive/" "$ARCHIVE_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/books/" "$BOOKS_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/soft/" "$SOFT_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/.ssh/config" "$CONFIG_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/.bash_aliases" "$CONFIG_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/.bash_history" "$CONFIG_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/.bashrc" "$CONFIG_DIR/"

    rsync -avu --delete --progress "$SOURCE_DIR/.ssh/config" "$BACKUP_CONFIG_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/.bash_aliases" "$BACKUP_CONFIG_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/.bash_history" "$BACKUP_CONFIG_DIR/"
    rsync -avu --delete --progress "$SOURCE_DIR/.bashrc" "$BACKUP_CONFIG_DIR/"

    # Синхронизация файла sync_flashdrive.sh
    rsync -avu --progress "$SOURCE_DIR/cod/initial_start/sync_flashdrive.sh" "$TARGET_DIR/"
    echo "Синхронизация из домашней директории на внешний диск завершена."
elif [ "$DIRECTION" == "0" ]; then
    # Создание необходимых папок в домашней директории, если они не существуют
    mkdir -p "$SOURCE_DIR/Documents" "$SOURCE_DIR/Music" "$SOURCE_DIR/cod" "$SOURCE_DIR/Pictures" "$SOURCE_DIR/Videos" "$SOURCE_DIR/.ssh" "$SOURCE_DIR/soft" "$SOURCE_DIR/archive" "$SOURCE_DIR/books"
    
    # Синхронизация папок и файлов с внешнего диска в домашнюю директорию
    rsync -avu --delete --progress "$DOCUMENTS_DIR/" "$SOURCE_DIR/Documents/"
    rsync -avu --delete --progress "$MUSIC_DIR/" "$SOURCE_DIR/Music/"
    rsync -avu --delete --progress "$COD_DIR/" "$SOURCE_DIR/cod/"
    rsync -avu --delete --progress "$PICTURES_DIR/" "$SOURCE_DIR/Pictures/"
    rsync -avu --delete --progress "$VIDEOS_DIR/" "$SOURCE_DIR/Videos/"
    rsync -avu --delete --progress "$SOFT_DIR/" "$SOURCE_DIR/soft/"
    rsync -avu --delete --progress "$ARCHIVE_DIR/" "$SOURCE_DIR/archive/"
    rsync -avu --delete --progress "$BOOKS_DIR/" "$SOURCE_DIR/books/"
    rsync -avu --delete --progress "$CONFIG_DIR/config" "$SOURCE_DIR/.ssh/"
    rsync -avu --delete --progress "$CONFIG_DIR/.bash_aliases" "$SOURCE_DIR/"
    rsync -avu --delete --progress "$CONFIG_DIR/.bash_history" "$SOURCE_DIR/"
    rsync -avu --delete --progress "$CONFIG_DIR/.bashrc" "$SOURCE_DIR/"
    echo "Синхронизация с внешнего диска в домашнюю директорию завершена."
else
    echo "Неверный ввод. Пожалуйста, введите 1 или 0."
fi