import pandas as pd
import os
import logging
from Shared.PythonScripts.logging_config import setup_logger


# Set up the logger for this script
logger = setup_logger('PandasTransformations', 'Project1_ClaimsDataAnalysis/Logs/Python/pandas_transformations.log')

def transform_claims_data(claims_csv, claim_status_csv):
    try:
        logger.info("Starting transformation process...")

        # Load CSV files
        claims = pd.read_csv(claims_csv)
        claim_status = pd.read_csv(claim_status_csv)
        logger.info("Loaded CSV files successfully.")

        # Merge claims with claim status
        merged_data = pd.merge(claims, claim_status, on="StatusID", how="left")
        logger.info(f"Merged data successfully. Records merged: {len(merged_data)}")

        # Transformation: Calculate processing duration
        merged_data['ProcessingDuration'] = (pd.to_datetime(merged_data['ProcessedDate']) - 
                                             pd.to_datetime(merged_data['SubmissionDate'])).dt.days
        logger.info("Calculated ProcessingDuration.")

        # Filter valid claims (e.g., Approved status)
        valid_claims = merged_data[merged_data['StatusName'] == 'Approved']
        logger.info(f"Filtered valid claims. Records retained: {len(valid_claims)}")

        # Clean up missing values
        valid_claims.fillna({
            'ProcessingDuration': -1,  # Assign -1 for missing durations
            'Amount': 0  # Assign 0 for missing amounts
        }, inplace=True)
        logger.info("Handled missing values.")

        # Output transformed data
        valid_claims.to_csv('Project1_ClaimsDataAnalysis/Output/Transformed_Claims.csv', index=False)
        logger.info("Transformed data saved to 'Output/Transformed_Claims.csv'.")

        logger.info("Transformation process completed successfully.")

    except Exception as e:
        logger.error(f"Error during transformation: {e}")

# Example usage
if __name__ == "__main__":
    transform_claims_data(
        claims_csv='Project1_ClaimsDataAnalysis/SampleCSV/claim_data.csv',
        claim_status_csv='Project1_ClaimsDataAnalysis/SampleCSV/ClaimStatus.csv'
    )
