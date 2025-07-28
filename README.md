# Predictive Model for ICU Cardiac Arrest Mortality

## Overview
This repository provides code, documentation, and resources for building a **predictive model** to assess in-hospital mortality risk for ICU patients with cardiac arrest (CA). The model uses data from **MIMIC-IV** and **Phecodes** to identify key predictors, support clinical decision-making, and enhance patient outcomes.

---

## Data Sources
- **MIMIC-IV**:
  A large, open-access electronic health record database containing ICU patient data from 2008–2019. MIMIC-IV includes demographics, vital signs, lab tests, diagnoses, and clinical outcomes, making it a valuable resource for predictive modeling.
  *Access to MIMIC-IV is restricted and requires credentialing via PhysioNet. Users must complete the CITI "Data or Specimens Only Research" course and sign a data use agreement. More information can be found [here](https://physionet.org/content/mimiciv/).*
- **Phecodes**:
  A curated collection of ICD code groupings used to consolidate clinically relevant diagnoses. In this project, Phecodes will help identify CA-related phenotypes by mapping ICD-10 codes from MIMIC-IV into more meaningful clusters.

---

## Key Deliverables and Repository Navigation
- Code for model training, testing, and evaluation
- Documentation detailing data preprocessing, feature engineering, and model evaluation
- Insights into significant predictors and their clinical relevance

### `/Initial_Data_Analysis`
- Contains Jupyter notebooks for exploratory and descriptive analysis of the MIMIC-IV and Phecode tables used for cohort selection and feature consideration. This includes an initial look at data distributions, missing values, and potential data quality issues.

### `/Feature_Engineering_and_Preprocessing`
- Provides Jupyter notebooks detailing the cohort selection process, extraction of 27 features, data cleaning (outlier removal, handling of missing values), and final dataset preparation for modeling. This section covers the transformation of raw data into a model-ready format.

### `/Modelling`
- Includes the Jupyter notebook for training and evaluating the hypertuned XGBoost model. This covers data splitting, hyperparameter tuning via grid search, and performance assessment.

---

## Methods Summary

This project developed a predictive model for in-hospital mortality in ICU patients with cardiac arrest (CA).

1.  **Cohort Selection**: The initial MIMIC-IV cohort (299,712 patients) was filtered to identify ICU patients with a cardiac arrest diagnosis using Phecode 427.42. Only the first ICU admission was considered, resulting in 1,917 unique patients. The `hospital_expire_flag` from the `admissions` table served as the binary outcome variable.
2.  **Feature Engineering**:
    * **Comorbidities**: COPD (Phecode 496), hypertension (Phecode 401.1), and diabetes mellitus (Phecode 250.2) were extracted.
    * **Demographics**: Age and gender were included.
    * **Clinical Scores**: SAPS II, SOFA (24-hour), and GCS scores were incorporated from the MIMIC-IV derived schema.
    * **Labs and Vitals (First 12 Hours of ICU Stay)**: Mean values for 18 parameters (BMI, Heart Rate, Respiratory Rate, O2 Saturation, Anion Gap, Temperature, Hemoglobin, Prothrombin Time, Systolic & Diastolic Blood Pressure, Hematocrit, Platelet Count, Glucose, Potassium, Chloride, Sodium, Creatinine, WBC) were extracted from `chartevents`.
3.  **Data Preprocessing**: Utilized PostgreSQL for initial data loading and Python (pandas) for processing. Six outliers identified via boxplots were removed. Patients with more than two missing features (>7.5% of total features) were also excluded, yielding a final analytical cohort of 1,805 patients.
4.  **Modeling**:
    * An XGBoost (Extreme Gradient Boosting) classifier was employed.
    * The dataset was split into 70% training and 30% testing sets.
    * Hyperparameters (n\_estimators, max\_depth, learning\_rate, subsample, colsample\_bytree) were optimized using a grid search with 3-fold cross-validation.
5.  **Evaluation**: Model performance was assessed via accuracy, precision, recall, F1-score, a confusion matrix, and the Area Under the Receiver Operating Characteristic Curve (AUC). Feature importance was determined using XGBoost's F-score and SHAP (SHapley Additive exPlanations) values.

---

## Results Summary

The hypertuned XGBoost model demonstrated moderate-to-good performance in predicting in-hospital mortality.

* **Key Performance Metrics (Test Set)**:
    * Accuracy: 0.679
    * Precision (for mortality): 0.66
    * Recall (for mortality): 0.62
    * F1-score (for mortality): 0.66 
    * Area Under ROC Curve (AUC): 0.77
* **Confusion Matrix Highlights (Test Set)**:
    * Correctly Predicted Mortality (True Positives): 168
    * Correctly Predicted Survival (True Negatives): 200
    * Incorrectly Predicted Mortality (False Positives): 101
    * Incorrectly Predicted Survival (False Negatives): 73
* **Significant Predictors**:
    * **SHAP Analysis**: SAPS II (higher scores strongly associated with mortality), lower Temperature, and higher Prothrombin time were identified as the most impactful features.
    * **XGBoost F-score**: Temperature, BMI, and Prothrombin time were among the top-ranked features by importance.

The model, with an AUC of 0.77, shows a good capability in discriminating between patients who will survive and those who will not, and highlights clinically relevant factors associated with mortality in ICU cardiac arrest patients.

---
