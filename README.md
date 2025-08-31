## AWS Resource Tracker with Cron Job

This project provides a **Bash shell script** that automatically tracks AWS resources such as **EC2 Instances, S3 Buckets, IAM Users, and Lambda Functions**.  
The script generates daily logs of AWS resources and stores them in a `logs/` directory. It also includes **log rotation** to keep only the last 7 days of logs.

---

### 🚀 Features
- Track **EC2 Instances** (ID, type, state, AZ)
- List all **S3 Buckets**
- List all **IAM Users** (username, creation date)
- Track all **Lambda Functions** (name, runtime, last modified date)
- Automatic **Log Rotation** (keeps only 7 days)
- Easy to schedule with **cron jobs**

---

### 📂 Project Structure

aws-resource-tracker/ <br>
│── aws-resource-tracker.sh # Main script<br>
│── README.md # Documentation<br>
│── .gitignore # Git ignore rules<br>
│── logs/ # Log files (ignored in Git)<br>


---

### ⚙️ Prerequisites
1. Install **AWS CLI**  
   [Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)  

2. Configure AWS credentials:
   ```bash
   aws configure 
   ```

Provide:<br>

AWS Access Key ID<br>
AWS Secret Access Key<br>
Default region (e.g., us-east-1)<br>
Output format (recommended: table)<br>
Ensure Bash is available:<br>
On Linux / Mac → already available.<br>
On Windows → use Git Bash or WSL.<br>

### ▶️ Usage

Make the script executable:
```chmod +x aws-resource-tracker.sh```

Run the script:
```./aws-resource-tracker.sh```

Logs will be saved in:

```logs/aws_resource_tracker_YYYY-MM-DD.log```

### ⏲ Automating with Cron

To run the script daily at 9 AM:
```crontab -e```

Add this line:
```0 9 * * * /path/to/aws-resource-tracker/aws-resource-tracker.sh```

### 📝 Git Ignore Policy

The ```logs/``` directory is ignored from version control using ```.gitignore```.
This ensures only the script and documentation are pushed to GitHub, while logs remain local.

📌 Example Output (log file)
======================================
 AWS Resource Tracker - Mon Aug 31 09:00:01 UTC 2025
======================================

EC2 Instances:
-------------------------------------------------------------
|     ID       |   Type   |   State   |     AZ             |
-------------------------------------------------------------
|  i-12345678  | t2.micro |  running  |  us-east-1a        |
-------------------------------------------------------------

S3 Buckets:
2025-08-30 12:00:00 my-s3-bucket
2025-08-28 15:30:00 project-logs-bucket

IAM Users:
---------------------------------------------------
|  UserName     |       CreateDate                |
---------------------------------------------------
|  admin-user   | 2025-07-01T12:45:00Z            |
|  dev-user     | 2025-08-05T09:30:00Z            |
---------------------------------------------------

Lambda Functions:
--------------------------------------------------------------
|  FunctionName    |   Runtime    |   LastModified           |
--------------------------------------------------------------
|  processEvents   |  python3.9   |  2025-08-20T12:15:00+0000|
|  resizeImages    |  nodejs18.x  |  2025-08-25T08:45:00+0000|
--------------------------------------------------------------