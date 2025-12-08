# 🎓 PL/SQL FINAL EXAM – SUPPLIER PERFORMANCE MONITOR SYSTEM

## 👤 Identification
- **Name:** Chela Kaliza  
- **Student ID:** 27800  
- **Project Title:** Supplier Performance Monitor System  
- **Course:** INSY 8311 – Database Development with PL/SQL  
- **Academic Year:** 2024–2025  
- **Lecturer:** Eric Maniraguha (eric.maniraguha@auca.ac.rw)  

---

# 🚀 Phase I: Problem Statement & Presentation

## 📌 Objective
To identify a real-world operational problem that requires an **Oracle PL/SQL database solution**.  
The Supplier Performance Monitor system evaluates supplier delivery behavior by analyzing quality, timeliness, and accuracy.

---

# 💡 Project Summary: Supplier Performance Monitor

## 📖 Problem Definition
Many organizations struggle to maintain reliable supplier relationships because:
- Deliveries are often **late**
- Items may be **incorrect or inaccurate**
- Product **quality** is inconsistent
- There is **no automated scoring or alert mechanism**
- Monitoring happens manually, creating delays and errors  

These issues negatively affect production cycles, inventory planning, and overall supply chain efficiency.

---

## 🌍 Context
This system is useful for:
- Procurement Departments  
- Warehouses  
- Manufacturing Firms  
- Retail Distribution Centers  

It automates supplier evaluation and ensures objective, analytics-based procurement decision-making.

---

## 🎯 Target Users
- Procurement Managers  
- Warehouse Supervisors  
- Supply Chain Analysts  
- Business Executives  

---

## 🏆 Project Goals
- 📊 Evaluate supplier performance using automated scoring  
- 📨 Generate alerts for underperformers  
- 🧮 Track delivery accuracy, timeliness, and quality  
- 🔁 Maintain historical supplier ratings  
- 📘 Improve procurement decision-making via MIS  

---

# 🧩 Key Database Entities (Using Project Tables)

| Entity | Attributes |
|--------|------------|
| **Suppliers** | `supplier_id`, `supplier_name`, `contact_info` |
| **Deliveries** | `delivery_id`, `supplier_id`, `expected_date`, `delivered_date`, `quality_score`, `delivered_correct` |
| **Supplier_Ratings** | `rating_id`, `supplier_id`, `average_score`, `rating_status`, `last_updated` |
| **Supplier_Alerts** | `alert_id`, `supplier_id`, `alert_type`, `alert_details`, `alert_time` |

### 🔗 Relationships
- One **Supplier** → many **Deliveries**  
- Deliveries feed into **Supplier_Ratings**  
- Low ratings generate **Supplier_Alerts**  

---

# 💎 System Benefits
✅ Fully automated performance scoring  
✅ Removes manual evaluation errors  
✅ Real-time alerts for risk mitigation  
✅ Higher transparency and accountability  
✅ Reliable analytics for decision-making  

---

# 📊 Mermaid Diagram (Based on Your Schema)

```mermaid
flowchart TD

A[🧑 Procurement Manager<br/>Monitors Supplier Performance] -->|Registers Supplier| B[📇 Suppliers]

B -->|Makes Deliveries| C[🚚 Deliveries]

C -->|Generates Metrics| D[(📊 Supplier_Ratings)]
D -->|Evaluate Score| E{{Is Performance Acceptable?}}

E -- No --> F[⚠️ Create Alert<br/>Supplier_Alerts]
E -- Yes --> G[✅ No Action Needed]

F --> H[📩 Notify Manager]

classDef actor fill:#e3f2fd,stroke:#2196f3,stroke-width:2px;
classDef data fill:#fff3e0,stroke:#fb8c00,stroke-width:2px;
classDef system fill:#fce4ec,stroke:#d81b60,stroke-width:2px;

class A,H actor
class B,C,D data
class E,F,G system
