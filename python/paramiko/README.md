## Script to automate commands on external router with no API

## Requirement
- You will need to, install the `paramiko` library

## Notes
- To accelerate the process of backing-up multiple routers at the same time, I used multi-threading `import threading`
- you can easily change the commands used in the script, you just need to call the function `send_command`

