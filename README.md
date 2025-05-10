## Overview  
This repository provides code, documentation, and resources for building a **predictive model** to assess in-hospital mortality risk for ICU patients with cardiac arrest (CA). The model leverages data from **MIMIC-IV** and **Phecodes** to identify key predictors, support clinical decision-making, and enhance patient outcomes.

---

## Data Sources  
- **MIMIC-IV**:  
  A large, open-access electronic health record database containing ICU patient data from 2008–2019. MIMIC-IV includes demographics, vital signs, lab tests, diagnoses, and clinical outcomes, making it a valuable resource for predictive modeling.  
- **Phecodes**:  
  A curated collection of ICD code groupings used to consolidate clinically relevant diagnoses. In this project, Phecodes will help identify CA-related phenotypes by mapping ICD-10 codes from MIMIC-IV into more meaningful clusters.  

---

## Key Deliverables  
- Code for model training, testing, and evaluation  
- Documentation detailing data preprocessing, feature engineering, and model evaluation  
- Insights into significant predictors and their clinical relevance

### Initial_Data_Analysis
- Includes exploratory and descriptive analysis of the ICU MIMIC-IV data that will be used for modelling.

### Feature_Engineering_and_Preprocessing
- Details the extraction and engineering for 27 features that will be used to predict CA mortality

### Modelling
- Hypertuned XGBoost model to predict CA mortality ibn ICU patients
