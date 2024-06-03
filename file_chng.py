import os
import pickle
from datetime import datetime

STATE_FILE = "file_state.pkl"

def get_file_info(root_dir):
    file_info = {}
    for root, dirs, files in os.walk(root_dir):
        for file in files:
            file_path = os.path.join(root, file)
            try:
                file_stat = os.stat(file_path)
                file_info[file_path] = file_stat.st_mtime
            except Exception as e:
                print(f"Error processing file {file_path}: {e}")
    return file_info

def load_previous_state():
    if os.path.exists(STATE_FILE):
        with open(STATE_FILE, 'rb') as f:
            return pickle.load(f)
    return {}

def save_current_state(file_info):
    with open(STATE_FILE, 'wb') as f:
        pickle.dump(file_info, f)

def compare_states(prev_state, curr_state):
    changes = []
    all_files = set(prev_state.keys()).union(curr_state.keys())

    for file in all_files:
        if file not in prev_state:
            changes.append((file, "Добавлено"))
        elif file not in curr_state:
            changes.append((file, "Удалено"))
        elif prev_state[file] != curr_state[file]:
            changes.append((file, "Изменено"))

    return changes

def main():
    root_dir = "."  # текущая директория, можно изменить на любую другую
    prev_state = load_previous_state()
    curr_state = get_file_info(root_dir)

    changes = compare_states(prev_state, curr_state)
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    if changes:
        print(f"Changes detected at {now}:")
        for file, change in changes:
            print(f"{file}, {change}")
    else:
        print(f"No changes detected at {now}.")

    save_current_state(curr_state)

if __name__ == "__main__":
    main()
