# 📂 Repository Structure
**Telecom data analysis.ipynb:** The primary Jupyter Notebook detailing the entire project lifecycle, from initial data exploration and statistical analysis to model training and evaluation.

**churn-bigml-80.csv:** The dataset utilized for this analysis.

---

# 🛠️ Dependencies
This project requires the following Python libraries:

- pandas

- numpy

- matplotlib.pyplot

- seaborn

- scipy.stats (for statistical testing)

- sklearn.model_selection

- sklearn.ensemble (RandomForestClassifier)

- sklearn.metrics

---

# 🔍 Analysis & Findings
**The Telecom data analysis.ipynb notebook covers:**

- Data Quality Checks: Confirmed 2666 observations with no missing values or duplicates.

- Exploratory Data Analysis (EDA):

- Imbalance Check: Visualizing the distribution of the target variable (Churn).

- Key Drivers: Identified significant correlation between churn and features like International plan, Customer service calls, and high usage columns (e.g., Total day minutes).

---

**Data Preprocessing:**

- Feature selection involved dropping highly correlated and irrelevant columns (Area code, State, and redundant charge columns).

- Categorical features (International plan, Voice mail plan) were numerically encoded.

---

**🤖 Predictive Modeling**
- Model: RandomForestClassifier

- Data Split: 80% Training, 20% Testing (534 total test observations).

---

# 📊 Model Performance (on Test Set)

| Metric     | No Churn (0) | Churn (1) |
|-------------|--------------|-----------|
| **Precision** | 0.93 | 0.94 |
| **Recall**    | 0.99 | 0.58 |
| **F1-Score**  | 0.96 | 0.71 |

---

# 🔢 Confusion Matrix

|                     | **Predicted: No Churn** | **Predicted: Churn** |
|---------------------|--------------------------|-----------------------|
| **Actual: No Churn** | 453 (True Negatives)     | 3 (False Positives)   |
| **Actual: Churn**    | 33 (False Negatives)     | 45 (True Positives)   |

---

### ✅ Notes
- The model performs **very well** on predicting *No Churn* (high recall: 0.99).
- However, recall for *Churn (1)* is lower (0.58), meaning some churn cases are missed.

---

## 📚 Future Improvements
- Improve model recall for Churn prediction  
- Add hyperparameter tuning and feature importance visualization  
- Deploy the model using Flask or Streamlit for live predictions  

---

## 🙌 Acknowledgements
- Dataset source: [Kaggle - Telecom Churn Dataset](https://www.kaggle.com/)

---

## 💬 Contact
If you liked this project or have suggestions, feel free to reach out!

**Vaishnavi Sinha**  
📧 [sinhavaishnavi020@gmail.com]  
🔗 [LinkedIn](https://www.linkedin.com/in/vaishnavi-sinha-v2005/) | [GitHub](https://github.com/Vaishnavi-020)
---


