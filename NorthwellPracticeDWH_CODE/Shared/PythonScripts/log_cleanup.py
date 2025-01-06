import os
import time
from datetime import datetime, timedelta

def cleanup_logs(log_dir, retention_days=30):
    """
    Removes log files older than retention_days from the specified log directory.
    """
    now = datetime.now()
    cutoff = now - timedelta(days=retention_days)

    for root, dirs, files in os.walk(log_dir):
        for file in files:
            file_path = os.path.join(root, file)
            file_modified_time = datetime.fromtimestamp(os.path.getmtime(file_path))

            if file_modified_time < cutoff:
                os.remove(file_path)
                print(f"Deleted old log file: {file_path}")

if __name__ == "__main__":
    log_directory = "Project1_ClaimsDataAnalysis/Logs"
    retention_period = 30  # Retain logs for 30 days
    cleanup_logs(log_directory, retention_period)
