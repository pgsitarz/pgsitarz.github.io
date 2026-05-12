---
title: Disable Tier Upgrade for Azure Cognitive Services
description: A step-by-step guide to disable automatic tier upgrades for Azure Cognitive Services using a batch script.
tags: [azure, tier upgrade]
---

To disable automatic tier upgrades for Azure Cognitive Services, follow the steps below:

1. Open browser DevTools
2. Go to portal.azure.com
3. Open the Network tab
4. Find the filter field and type batch
5. Find the Name of the request that starts with batch?api-version=
6. Go to headers and get the bearer token from the Authorization header

```
curl -X PATCH "https://management.azure.com/subscriptions/<subscription-id>/providers/Microsoft.CognitiveServices/quotaTiers/default?api-version=2025-10-01-preview" -H "Authorization: Bearer <bearer-token>" -H "Content-Type: application/json" -d "{\"properties\": {\"tierUpgradePolicy\": \"NoAutoUpgrade\"}}"
```

The response should be:

```
{"properties":{"currentTierName":"Free Tier","assignmentDate":"2026-05-10T19:22:45.4574655Z","tierUpgradePolicy":"NoAutoUpgrade"},"id":"/subscriptions/<subscription-id>/providers/Microsoft.CognitiveServices/quotaTiers/default","name":"default","type":"Microsoft.CognitiveServices/quotaTiers"}
```