{
  "policy": {
    "description": "TF - Rollover by IndexSize & IndexAge",
    "default_state": "hot",
    "states": [
      {
        "name": "hot",
        "actions": [
          {
            "timeout": "1h",
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "10m"
            },
            "rollover": {
              "min_primary_shard_size": "${rollover_index_size}",
              "copy_alias": false
            }
          }
        ],
        "transitions": [
          {
            "state_name": "delete",
            "conditions": {
              "min_index_age": "${cleanup_index_age}"
            }
          }
        ]
      },
      {
        "name": "delete",
        "actions": [
          {
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
            },
            "delete": {}
          }
        ],
        "transitions": []
      }
    ],
    "ism_template": [
      {
        "index_patterns": ${index_patterns},
        "priority": ${priority}
      }
    ]
  }
}