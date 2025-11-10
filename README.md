# 📊 Telecom Customer Churn Analysis (Python | SQL | Power BI)

This end-to-end project analyzes **customer churn behavior** in a telecom company using **Python, SQL, and Power BI**.  
It combines **machine learning analysis** with **data-driven business insights** to identify key churn drivers and help the company reduce customer attrition.

---

## 📂 Repository Structure

| File | Description |
|------|-------------|
| **Telecom data analysis.ipynb** | Jupyter Notebook detailing the entire project lifecycle — from initial data exploration and statistical analysis to model training and evaluation. |
| **telecom_churn.sql** | SQL script used for churn analysis, customer segmentation, and revenue insights. |
| **Telecom_Churn_Dashboard.pbix** | Power BI dashboard visualizing churn trends, customer demographics, and KPIs. |
| **churn-bigml-80.csv** | Dataset used for analysis. |

---

## 🛠️ Dependencies

This project uses both Python libraries and BI tools.

### 🐍 Python Libraries
- pandas  
- numpy  
- matplotlib.pyplot  
- seaborn  
- scipy.stats  
- sklearn.model_selection  
- sklearn.ensemble (RandomForestClassifier)  
- sklearn.metrics  

### 💡 BI & Database Tools
- **SQL** – For churn metric calculation, segmentation, and data aggregation.  
- **Power BI** – For interactive dashboards and visual storytelling.  

---

## 🔍 Analysis & Findings

### 🧮 Python (Jupyter Notebook)
**The `Telecom data analysis.ipynb` notebook covers:**

- **Data Quality Checks:** Confirmed 2666 observations with no missing values or duplicates.  
- **Exploratory Data Analysis (EDA):**  
  - Checked imbalance in target variable (Churn).  
  - Identified correlations between churn and factors like *International plan*, *Customer service calls*, and *Total day minutes*.  
- **Data Preprocessing:**  
  - Removed highly correlated or irrelevant columns (`Area code`, `State`, redundant charges).  
  - Encoded categorical variables (`International plan`, `Voice mail plan`).  

---

### 🤖 Predictive Modeling (Python)
- **Model Used:** RandomForestClassifier  
- **Train-Test Split:** 80% Training, 20% Testing (534 test observations)  

#### 📈 Model Performance (on Test Set)

| Metric     | No Churn (0) | Churn (1) |
|-------------|--------------|-----------|
| **Precision** | 0.93 | 0.94 |
| **Recall**    | 0.99 | 0.58 |
| **F1-Score**  | 0.96 | 0.71 |

#### 🔢 Confusion Matrix

|                     | **Predicted: No Churn** | **Predicted: Churn** |
|---------------------|--------------------------|-----------------------|
| **Actual: No Churn** | 453 (True Negatives)     | 3 (False Positives)   |
| **Actual: Churn**    | 33 (False Negatives)     | 45 (True Positives)   |

✅ The model performs *very well* at identifying non-churn customers, though recall for churn cases (1) can be further improved.

---

## 🧮 SQL Analysis

The SQL file `telecom_churn.sql` includes queries for:

- **Churn Rate Calculation**
- **Churn segmentation by international plan and voicemail plan**
- **Churn by area code and state**

**Example Queries:**
```sql
-- Overall churn KPI view
CREATE VIEW v_churn_kpis AS
SELECT
  COUNT(*) AS total_customers,
  SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(100.0 * SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_percent
FROM telecom_users;

-- Drivers: customer service calls vs churn
CREATE VIEW v_custsvc_churn AS
SELECT
  `Customer service calls`,
  COUNT(*) AS customers,
  SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(100.0 * SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate_percent
FROM telecom_users
GROUP BY `Customer service calls`
ORDER BY `Customer service calls`;

```
---

## 📊 Power BI Dashboard

The Power BI dashboard provides a visual representation of key churn metrics, enabling quick insights for decision-makers.

## Dashboard Highlights:

## KPIs: Total Customers, Churned Customers, Churn Rate (%), Revenue Lost to Churn

## Visuals:

- Churn by International Plan
- Churn Comaprision by heavy users VS normal users
- Customer Usage Patterns

## 📚 Future Improvements

Improve model recall for churn prediction using advanced models (XGBoost, GridSearchCV).

Visualize feature importance and SHAP values for model interpretability.

Deploy the model using Flask or Streamlit for live churn predictions.

Enhance Power BI dashboard with dynamic filters and forecasting visuals.

## 🙌 Acknowledgements

Dataset Source: Kaggle - Telecom Churn Dataset

## 💬 Contact
**Vaishnavi Sinha**  
Data Analyst | SQL | Power BI | Python

📧 [sinhavaishnavi020@gmail.com]  
🔗 [LinkedIn](https://www.linkedin.com/in/vaishnavi-sinha-v2005/) | [GitHub](https://github.com/Vaishnavi-020)
---


