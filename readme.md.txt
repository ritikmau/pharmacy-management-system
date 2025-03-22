#PHARMACY MANAGEMENT SYSTEM

This project uses MySQL to implement a pharmacy management system. Analytical queries, sample data, a fully normalized database schema (3NF), and an automated backup and recovery plan are all included. Furthermore, cron jobs are used to schedule backups and user-based access control is put into place. This project exhibits expertise in query optimization, database design, and efficient backup techniques.

## Table of Contents

- Project Synopsis
- Project Structure
- Prerequisites
- Setup Instructions
  - 1. Database Schema & Seed Data
  - 2. Running Analytical Queries
  - 3. Backup & Restore Scripts
  - 4. User-Based Access Control
  - 5. Automating Backups with Cron](#5-automating-backups-with-cron)
- Testing & Verification](#testing--verification)
- GitHub Submission
- Discussion Points

## Project Synopsis

The goal of this project is to use automated backup and recovery procedures to manage a pharmacy's data and guarantee its integrity. Tables for categories, suppliers, users, medications (products), orders, order items, and payments are among the database schema's primary features.
A seed script was used to insert the sample data.
Analytical queries are used to determine the inventory turnover rate, find repeat customers, and retrieve the best-selling medications by region.
- Backup and Recovery: `mysqldump` is used for automated backups, and restore scripts are used to simulate disaster recovery.
Role-based permissions are used in user-based access control to protect sensitive information.
Automation: Cron jobs enable recovery speed testing and schedule daily backups.

## Project Structure

pharmacy_project/
- README.md           # Project overview and setup instructions
- schema.sql          # SQL script to create the pharmacy_db and its tables
- seed.sql            # SQL script to insert sample data into the database
- queries.sql         # SQL file containing analytical queries (with EXPLAIN ANALYZE)
- backup.sh           # Bash script to automate database backups using mysqldump
- restore.sh          # Bash script to restore the latest backup (simulate disaster recovery)

## Prerequisites

- MySQL installed (open-source version)
- WSL (Windows Subsystem for Linux) if using Windows
- Basic knowledge of the command line and Git

## Setup Instructions

 1. Database Schema & Seed Data

 -Run Schema Script:
  bash:
  mysql -u root -p < /mnt/c/Users/VIVEK/OneDrive/Desktop/medix/schema.sql

 -Run speed script:
  bash:
  mysql -u root -p < /mnt/c/Users/VIVEK/OneDrive/Desktop/medix/seed.sql

 2. Running Analytical Queries

 -Execute Queries:
  bash:
  mysql -u root -p < /mnt/c/Users/VIVEK/OneDrive/Desktop/medix/queries.sql

 3. Backup & Restore Scripts

 -Backup Script:
  bash:
  bash /mnt/c/backups/backup.sh

 -Restore Script:
  bash:
  bash /mnt/c/backups/restore.sh


 4. User-Based Access Control

  Setup user roles in mysql as follows:
	
	mysql:

	CREATE USER 'pharmacist'@'localhost' IDENTIFIED BY 'pharma123';
	GRANT SELECT, INSERT, UPDATE ON pharmacy_db.* TO 'pharmacist'@'localhost';

	CREATE USER 'customer'@'localhost' IDENTIFIED BY 'cust123';
	GRANT SELECT ON pharmacy_db.medicines TO 'customer'@'localhost';
	
	FLUSH PRIVILEGES;
  

 5. Automating Backups with Cron

  Schedule Daily Backups: Open crontab:
  bash:
  crontab -e

	replace the code that looked like 02 * * * /mnt/...
	with
	0 2 * * * /mnt/c/backups/backup.sh >> /mnt/c/backups/backup.log 2>&1

##Tesgting and Verification

 -Examine the tables and sample records to confirm the schema and seed data.
 -Execute analytical queries and evaluate their results.
 -Check the functionality of the backup and restore.
 -To verify access control, log in as various users.
 -To calculate backup and restore times, use time commands.


