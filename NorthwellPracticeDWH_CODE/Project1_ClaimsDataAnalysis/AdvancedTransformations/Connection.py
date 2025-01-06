from sqlalchemy import create_engine
from sqlalchemy.exc import SQLAlchemyError
import logging
import pyodbc
from Shared.PythonScripts.logging_config import setup_logger

# Set up the logger for database connections
logger = setup_logger('DBConnection', 'Project1_ClaimsDataAnalysis/Logs/Python/database_connection.log')

def get_db_connection():
    try:
        connection = pyodbc.connect(
            "DRIVER={SQL Server};"
            "SERVER=localhost;"
            "DATABASE=NorthwellPracticeDWH;"
            "Trusted_Connection=yes;"
        )
        logger.info("Database connection established successfully.")
        return connection
    except Exception as e:
        logger.error(f"Error connecting to the database: {e}")
        raise

if __name__ == "__main__":
    conn = get_db_connection()
    conn.close()
    logger.info("Database connection closed.")
