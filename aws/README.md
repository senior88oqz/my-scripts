## CloudWatch Insights

* **Get logs of lambda that errored**
```
filter @message like /(?i)(Exception|error|fail)/| fields @timestamp, @message, @logStream | sort @timestamp desc | limit 100
```