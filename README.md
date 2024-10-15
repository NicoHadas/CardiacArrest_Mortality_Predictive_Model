## Overview  
This repository provides code, documentation, and resources for building a **predictive model** to assess in-hospital mortality risk for ICU patients with cardiac arrest (CA). The model leverages data from **MIMIC-IV**, **Phecodes**, and **MDClone** to identify key predictors, support clinical decision-making, and enhance patient outcomes.

Our approach compares multiple machine learning models to **logistic regression** and the **National Early Warning Score 2 (NEWS 2)**. The goal is to develop a robust model that offers better predictive performance, accurately handles non-linear relationships, and provides effective risk stratification. 

---

## Data Sources  
- **MIMIC-IV**:  
  A large, open-access electronic health record database containing ICU patient data from 2008–2019. MIMIC-IV includes demographics, vital signs, lab tests, diagnoses, and clinical outcomes, making it a valuable resource for predictive modeling.  
- **Phecodes**:  
  A curated collection of ICD code groupings used to consolidate clinically relevant diagnoses. In this project, Phecodes will help identify CA-related phenotypes by mapping ICD-10 codes from MIMIC-IV into more meaningful clusters.  
- **MDClone**:  
  Provides synthetic patient data for external validation. MDClone contains diagnoses, procedures, lab results, and vital signs from healthcare facilities, ensuring the model is tested on data beyond MIMIC-IV.

---

## Objectives  
- **Model Development**: Train multiple machine learning models to predict in-hospital mortality for ICU patients with CA.  
- **Comparative Evaluation**: Benchmark model performance against traditional methods, including **logistic regression** and **NEWS 2**.  
- **Risk Stratification**: Identify the most significant predictors of in-hospital mortality to improve decision-making.  
- **External Validation**: Use **MDClone** data to validate model performance beyond the MIMIC-IV dataset.

---

## Key Deliverables  
- Code for model training, testing, and evaluation  
- Comparative performance metrics across different models  
- Documentation detailing data preprocessing, feature engineering, and model evaluation  
- Insights into significant predictors and their clinical relevance  
