---
title: "Postfix Queue"
dat e: 2024-03-12T16:27:54+07:00
tags: ["mail", "postfix", "queue"]
author: "Widya"
draft: false
---

## View queued mail 
```
postqueue -p
```
### View content of queue mail
```
postcat -q [message id]
```

## Flush queued mail 

This command will attempt to redeliver all queued mail.
```
postqueue -f
```

## Purge queued mail 
To purge the mail queue, we'll use the postsuper -d command. This command has 2 execution options: 
### Option 1
To purge a single email from the queue, use the postsuper -d [message id] command.
### Option 2
To purge all email from the queue, use the postsuper -d ALL command.

## Referensi:
* bismillaah
