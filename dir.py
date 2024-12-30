import os

# Define your new directory structure
structure = {
    "NorthwellPracticeDWH_CODE": {
        "Project1_ClaimsDataAnalysis": {
            "CreateTables": ["StagingTables.sql", "FactTables.sql", "DimensionTables.sql"],
            "PopulateData": {
                "SSIS": ["LoadClaims.dtsx"],
                "SampleCSV": ["Claims.csv", "ClaimStatus.csv"],
                "": ["LoadClaims.sql"],
            },
            "Transformation": ["TransformToFactAndDim.sql", "Views.sql", "StoredProcedures.sql"],
            "AdvancedTransformations": ["pandas_transformations.py", "Connection.py"],
            "Visualizations": ["PowerBI.pbix"],
            "Documentation": ["Readme.md", "WorkflowDiagram.png"],
        },
        "Project2_SalesDataAnalysis": {
            "CreateTables": [],
            "PopulateData": {"SSIS": [], "SampleCSV": [], "": []},
            "Transformation": [],
            "AdvancedTransformations": [],
            "Visualizations": [],
            "Documentation": [],
        },
        "Shared": {
            "CommonScripts": ["CreateDatabase.sql", "CommonViews.sql", "CleanupScripts.sql"],
            "SSIS": ["SharedConnectionManagers.dtsConfig", "Logging.dtsx"],
            "PythonScripts": ["CommonTransformations.py"],
        },
    }
}

# Function to create directories and files
def create_structure(base_path, structure):
    for folder, contents in structure.items():
        folder_path = os.path.join(base_path, folder)
        os.makedirs(folder_path, exist_ok=True)
        if isinstance(contents, dict):
            create_structure(folder_path, contents)
        else:
            for file in contents:
                if file:
                    open(os.path.join(folder_path, file), 'w').close()

# Create the structure in the current directory
create_structure(".", structure)
