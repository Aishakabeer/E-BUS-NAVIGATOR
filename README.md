# 🚍 E-Bus Navigator - Real-Time Bus Tracking System

![Python](https://img.shields.io/badge/Python-3.9+-blue.svg)
![Flask](https://img.shields.io/badge/Flask-2.3-green.svg)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange.svg)
![Real-time](https://img.shields.io/badge/Real--time-Updates-brightgreen.svg)

## 🌟 Overview
A web-based application that provides real-time bus tracking and schedule information to:
- Reduce passenger waiting times by up to 40%
- Improve public transportation efficiency
- Enhance commuter experience through accurate arrival predictions

## 🚀 Key Features

### 👨‍💻 Admin Panel
- Approve/block buses and drivers
- Manage routes and schedules
- View and analyze passenger feedback
- Generate operational reports

### 🚌 Driver Portal
- Update real-time bus locations
- Modify routes during disruptions
- View passenger feedback
- Manage daily schedules

### 👥 Passenger Features
- Real-time bus tracking on interactive maps
- Accurate arrival time predictions
- Route planning and saved favorites
- Feedback submission system

## 📸 Screenshots
<img width="1350" height="689" alt="image" src="https://github.com/user-attachments/assets/0ad11423-c232-4d3d-89f0-ceb6ca6ea2d1" />
<img width="1350" height="675" alt="image" src="https://github.com/user-attachments/assets/5fe6f7f5-c325-4c81-9c5a-ad797da0d815" />
<img width="1350" height="675" alt="image" src="https://github.com/user-attachments/assets/90702149-65de-4308-9cf9-77ba69ae7c83" />
<img width="1350" height="682" alt="image" src="https://github.com/user-attachments/assets/db1cb394-6813-4bf5-b25a-bbfd787fc342" />


## 💻 Technology Stack

**Frontend:**
- HTML5, CSS3, JavaScript
- Bootstrap 5
- Leaflet.js for maps

**Backend:**
- Python Flask
- Flask-SQLAlchemy
- Flask-Login

**Database:**
- MySQL 8.0

**DevOps:**
- Git for version control
- VS Code IDE

## � System Architecture

```mermaid
graph LR
    A[Web Browser] --> B[Flask Server]
    B --> C[MySQL Database]
    B --> D[GPS API]
    D --> E[Bus Tracking Devices]
    C --> B
    E --> D
