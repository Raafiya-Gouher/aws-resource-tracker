## AWS Resource Tracker with Cron Job

This project provides a **Bash shell script** that automatically tracks AWS resources such as **EC2 Instances, S3 Buckets, IAM Users, and Lambda Functions**.  
The script generates daily logs of AWS resources and stores them in a `logs/` directory. It also includes **log rotation** to keep only the last 7 days of logs.

---

## 🚀 Features
- Track **EC2 Instances** (ID, type, state, AZ)
- List all **S3 Buckets**
- List all **IAM Users** (username, creation date)
- Track all **Lambda Functions** (name, runtime, last modified date)
- Automatic **Log Rotation** (keeps only 7 days)
- Easy to schedule with **cron jobs**

---

## 📂 Project Structure
