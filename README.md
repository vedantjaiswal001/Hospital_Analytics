<div align="center">

# 🏥 Hospital Healthcare Analytics

### From Raw Admissions Data → SQL Intelligence → Python Analysis → Executive Insights

**A healthcare analytics project focused on patient outcomes, readmissions, operational performance, financial patterns, and data-driven decision support.**

<br>

![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-EDA-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-Analytics-E97627?style=for-the-badge&logo=tableau&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626?style=for-the-badge&logo=jupyter&logoColor=white)

</div>

---

## 📌 Project Overview

Healthcare organizations generate large volumes of operational and patient-level data. Turning that data into useful decisions requires more than simply calculating averages — it requires a complete analytical workflow covering **data quality, SQL analysis, exploratory analysis, KPI development, segmentation, risk prioritization, and business interpretation**.

This project analyzes **13,011 hospital admission records** to understand:

- 🏥 Department performance
- 🔁 30-day readmission patterns
- 💰 Billing and financial concentration
- 🛏️ Length-of-stay behavior
- 😊 Patient satisfaction
- 👥 Patient and age-group patterns
- 🚨 Emergency-admission risk
- 📊 Operational priorities across departments

The project combines **MySQL + Python/Pandas + Jupyter + Tableau** into a single analytics workflow.

> **Goal:** transform raw healthcare admission data into clear, decision-oriented insights that can support operational planning and performance improvement.

---

## 🎯 Business Questions

The analysis is designed around practical questions a healthcare analytics team could investigate:

1. How many admissions and unique patients are represented in the dataset?
2. Which departments handle the highest patient volume?
3. Which departments generate the most billing?
4. Where are average lengths of stay the highest?
5. What is the overall 30-day readmission rate?
6. Which departments have elevated readmission rates?
7. How does admission type affect readmission?
8. Which patient age groups show higher readmission rates?
9. Which departments combine high readmissions, long stays, and lower satisfaction?
10. Where should operational teams prioritize deeper investigation?

---

# 📊 Executive Snapshot

| KPI | Result |
|---|---:|
| 🏥 Total Admissions | **13,011** |
| 👥 Unique Patients | **8,320** |
| 💰 Total Billing | **₹1.11B** |
| 💳 Avg. Billing / Admission | **₹85,323.62** |
| 🔁 30-Day Readmission Rate | **10.78%** |
| 🛏️ Avg. Length of Stay | **4.59 days** |
| 😊 Avg. Patient Satisfaction | **3.76 / 5** |
| 🎂 Avg. Patient Age | **41.8 years** |

---

# 🔎 Key Findings

## 1. Emergency admissions are a major readmission signal

The overall 30-day readmission rate is **10.78%**, while emergency admissions across departments frequently show readmission rates around **19–22%**.

This makes emergency admissions an important segment for further investigation into:

- discharge planning
- follow-up processes
- care transitions
- patient complexity
- post-discharge support

> This is an analytical signal, not a clinical diagnosis or causal conclusion.

---

## 2. Oncology has the highest analytical billing concentration

**Oncology** has:

- **1,065 admissions**
- approximately **₹234.6M total billing**
- approximately **₹220K average billing per admission**
- **8.55 days** average length of stay

The department therefore combines relatively high financial intensity with long stays.

---

## 3. Operational risk is not determined by volume alone

A department with the most admissions is not necessarily the highest operational priority.

A composite analytical score was created using:

- **40% — readmission**
- **35% — length of stay**
- **25% — dissatisfaction**

The resulting prioritization placed:

| Rank | Department | Operational Risk Score |
|---:|---|---:|
| 🥇 1 | Oncology | **60.00** |
| 🥈 2 | Pulmonology | **59.66** |
| 3 | Neurology | **49.14** |
| 4 | Nephrology | **40.18** |
| 5 | General Medicine | **40.01** |

This score is an **analytical prioritization framework created for this project**, not a validated clinical risk model.

---

## 4. Patient segments show different readmission behavior

The analysis found the highest observed readmission rate among the **18–34 age group at 11.60%**, followed by:

- 50–64: **11.08%**
- 65+: **10.61%**
- Pediatric: **10.60%**
- 35–49: **10.04%**

This demonstrates why segment-level analysis is more useful than relying only on hospital-wide averages.

---

# 🧠 Analytical Workflow

```text
                    ┌─────────────────────┐
                    │   Hospital Dataset  │
                    │    13,011 records   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │ Data Quality Checks │
                    │ Missing / Duplicate │
                    │ Validation / Types  │
                    └──────────┬──────────┘
                               │
                 ┌─────────────┴─────────────┐
                 ▼                           ▼
        ┌─────────────────┐         ┌─────────────────┐
        │      MySQL      │         │ Python / Pandas │
        │                 │         │                 │
        │ KPI Queries     │         │ EDA             │
        │ Segmentation    │         │ Trends          │
        │ CTEs            │         │ Distributions   │
        │ Window Functions│         │ Visual Analysis │
        └────────┬────────┘         └────────┬────────┘
                 │                           │
                 └─────────────┬─────────────┘
                               ▼
                    ┌─────────────────────┐
                    │ Business Analysis  │
                    │ Risk Prioritization │
                    │ KPI Interpretation  │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │ Tableau / BI Layer  │
                    │ Executive KPIs      │
                    │ Department Analysis  │
                    └─────────────────────┘
```

---

# 🛠️ Technology Stack

### Data Analysis
- **Python**
- **Pandas**
- **NumPy**
- **Matplotlib**
- **Seaborn**
- **Jupyter Notebook**

### Database & SQL
- **MySQL**
- Aggregations
- `GROUP BY`
- `HAVING`
- `CASE`
- CTEs
- Window functions
- Data-quality queries

### Visualization
- **Tableau**
- KPI analysis
- Department comparison
- Operational performance analysis

### Project & Reproducibility
- Git
- GitHub
- `requirements.txt`

---

# 🗂️ Repository Structure

```text
Hospital_Analytics/
│
├── data/
│   ├── hospital_admissions_data.csv
│   └── hospital_admissions_clean.csv
│
├── notebooks/
│   ├── hospital-analytics.ipynb
│   └── Hospital_analytics_old.ipynb
│
├── outputs/
│   ├── Hospital_exports/
│   │   ├── department_kpis.csv
│   │   ├── department_readmission.csv
│   │   ├── diagnosis_summary.csv
│   │   ├── hospital_admissions_clean.csv
│   │   ├── insurance_kpis.csv
│   │   └── monthly_kpis.csv
│   └── analysis result images
│
├── sql/
│   ├── Hospital.sql
│   └── Hospital_Analytics_All_SQL.sql
│
├── tableau/
│   └── Hospital_Analytics.twb
│
├── requirements.txt
├── README.md
└── LICENSE
```

---

# 🧮 SQL Analysis

The SQL layer contains reusable queries covering the complete analytical workflow.

### Core analysis

```sql
SELECT
    department,
    COUNT(*) AS admissions,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(SUM(billing_amount), 2) AS total_billing
FROM hospital_admissions_data
GROUP BY department
ORDER BY total_billing DESC;
```

### Readmission rate

```sql
SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN is_readmission_30d = 'True' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data;
```

### Department × admission type

```sql
SELECT
    department,
    admission_type,
    COUNT(*) AS admissions,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay
FROM hospital_admissions_data
GROUP BY department, admission_type
ORDER BY admissions DESC;
```

The complete SQL reference is available in:

**`sql/Hospital_Analytics_All_SQL.sql`**

---

# 📈 Tableau Analysis

The Tableau workbook contains the analytical visualization layer.

Current analysis includes:

- Total Admissions
- Unique Patients
- Readmission Rate
- Total Billing
- Average Length of Stay
- Average Patient Satisfaction
- Admissions by Department
- Department-level performance analysis

Workbook:

**`tableau/Hospital_Analytics.twb`**

---

# 🧪 Data Quality & Validation

The project includes SQL checks for:

- Null values
- Duplicate admission IDs
- Invalid ages
- Invalid length-of-stay values
- Admission-level consistency
- Aggregated KPI validation

Example:

```sql
SELECT
    admission_id,
    COUNT(*) AS duplicate_count
FROM hospital_admissions_data
GROUP BY admission_id
HAVING COUNT(*) > 1;
```

The purpose is to ensure that downstream KPIs are based on a consistent analytical dataset.

---

# 💡 Business Recommendations

Based on the observed patterns, an analytics team could prioritize:

### 🚨 1. Investigate emergency readmissions
Emergency admissions show materially higher readmission rates than the hospital-wide baseline.

### 🏥 2. Prioritize Oncology and Pulmonology for operational review
These departments rank highly under the project's composite operational-priority framework.

### 🔄 3. Analyze discharge and follow-up workflows
High readmission segments should be investigated alongside admission type, length of stay, diagnosis, and patient characteristics.

### 💰 4. Monitor high-cost departments
Oncology has substantially higher average billing per admission, making it important for financial and operational monitoring.

### 📊 5. Move from descriptive to continuous monitoring
The KPI structure can be extended into recurring dashboards and automated reporting pipelines.

---

# 🚀 How to Run the Project

## 1. Clone the repository

```bash
git clone https://github.com/vedantjaiswal001/Hospital_Analytics.git
cd Hospital_Analytics
```

## 2. Create a virtual environment

### Windows

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

### macOS / Linux

```bash
python3 -m venv .venv
source .venv/bin/activate
```

## 3. Install dependencies

```bash
pip install -r requirements.txt
```

## 4. Run the notebook

```bash
jupyter notebook
```

Open:

```text
notebooks/hospital-analytics.ipynb
```

## 5. SQL

Create the database in MySQL and load the hospital admissions dataset.

Then use:

```text
sql/Hospital_Analytics_All_SQL.sql
```

for the complete analysis query set.

## 6. Tableau

Open:

```text
tableau/Hospital_Analytics.twb
```

and connect it to the MySQL dataset if required.

---

# 📌 Project Highlights

| Area | Implementation |
|---|---|
| Data Volume | **13,011 admissions** |
| Patient Coverage | **8,320 unique patients** |
| Database | **MySQL** |
| Analysis | **Python + Pandas** |
| Visualization | **Tableau** |
| SQL Depth | **Aggregations, CTEs, Window Functions, CASE** |
| Healthcare KPI | **30-day readmission rate** |
| Operational Analysis | **Department risk prioritization** |
| Financial Analysis | **Billing & cost concentration** |
| Data Quality | **Null, duplicate & validity checks** |

---

# 🎓 Skills Demonstrated

This project demonstrates practical experience with:

**Data Analytics**
- Exploratory Data Analysis
- KPI development
- Segmentation
- Trend analysis
- Anomaly identification
- Business insight generation

**SQL**
- Aggregations
- Joins
- CTEs
- Window functions
- Conditional logic
- Data validation

**Python**
- Pandas
- NumPy
- Data cleaning
- Visualization
- Analytical workflows

**Business Intelligence**
- Tableau
- Executive KPIs
- Department-level reporting
- Decision-oriented visualization

**Healthcare Analytics**
- Readmission analysis
- Patient outcomes
- Length-of-stay analysis
- Department performance
- Financial utilization

---

# 🔮 Future Improvements

Potential next steps include:

- [ ] Automated ETL pipeline
- [ ] Scheduled KPI refresh
- [ ] Interactive readmission monitoring
- [ ] Predictive readmission modeling
- [ ] Feature importance / explainability
- [ ] Automated anomaly alerts
- [ ] Role-based healthcare dashboards
- [ ] Deployment as an analytics application

---

# ⚠️ Disclaimer

This project is intended for **educational and portfolio purposes**.

The analysis describes patterns observed in the available dataset and should not be interpreted as clinical advice, medical guidance, or causal evidence. The operational risk score is a project-specific analytical prioritization framework and is not a validated healthcare risk model.

---

<div align="center">

## 👨‍💻 Author

**Vedant Jaiswal**

B.Tech — Computer Science & Engineering

[GitHub](https://github.com/vedantjaiswal001) • [LinkedIn](https://linkedin.com/in/vedjais/)

---

### ⭐ If you find this project useful, consider giving it a star!

</div>
