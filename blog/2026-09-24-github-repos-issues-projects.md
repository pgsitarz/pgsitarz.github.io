---
tags:
  - github
---

# Relationship Between Repositories, Issues, and Projects in GitHub

To put it simply: **Repositories** hold your assets, **Issues** define the work, and **Projects** organize the execution.

```text
       ┌─────────────────────────────┐
       │     Repository (Where)      │
       │  Holds codebase & tracking  │
       └──────────────┬──────────────┘
                      │
                      ▼
       ┌─────────────────────────────┐
       │       Issues (What)         │
       │   Individual tasks/bugs     │
       └──────────────┬──────────────┘
                      │
                      ▼
       ┌─────────────────────────────┐
       │       Projects (When)       │
       │ Planning, priority & views  │
       └─────────────────────────────┘
```

---

## The Three Entities Explained

1. **Repository (The "Where")**  
   The container for your codebase, history, and raw data. Issues *live inside* a specific repository.

2. **Issue (The "What")**  
   The atomic unit of work inside a repository. It represents a bug, feature request, task, or discussion point bound to that specific project's code.

3. **Project (The "When & How")**  
   The management layer sitting on top. It pulls Issues and Pull Requests out of one or more Repositories and displays them as Kanban boards, Gantt chart roadmaps, or spreadsheets to track status, owners, and timelines.

---

## Structural Relationship Matrix

| Level | Relationship | Key Characteristic |
| :--- | :--- | :--- |
| **Repo ↔ Issue** | **1 to Many** | Every Issue *must* belong to exactly **one** Repository. |
| **Issue ↔ Project** | **Many to Many** | An Issue can belong to **zero, one, or multiple** Projects simultaneously. |
| **Repo ↔ Project** | **Many to Many** | A Project can aggregate Issues from **multiple Repos**, and a single Repo's Issues can be split across **multiple Projects**. |

---

## A Real-World Example

Imagine you are building an e-commerce platform:

* **Repositories:** You have two repositories: `checkout-service` (backend code) and `web-frontend` (UI code).
* **Issues:**
  * In `checkout-service`, you open **Issue #42**: *"Fix credit card processing timeout."*
  * In `web-frontend`, you open **Issue #108**: *"Redesign cart checkout button."*
* **Project:** You create a single GitHub Project board titled **"Black Friday Sprint"**. You add both **Issue #42** (from backend) and **Issue #108** (from frontend) to the same board so your engineering lead can track the entire checkout feature release in one place.