{
  "policy": {
    "description": "TF - Rollover by IndexSize & IndexAge",
    "default_state": "hot",
    "states": [
      {
        "name": "hot",
        "actions": [
          {
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
            },
            "allocation": {
              "require": {
                "temp": "hot"
              },
              "wait_for": false
            }
          },
          {
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
            },
            "rollover": {
              "min_index_age": "${rollover_index_age}",
              "min_primary_shard_size": "${rollover_index_size}",
              "copy_alias": false
            }
          }
        ],
        "transitions": [
          {
            "state_name": "cold",
            "conditions": {
              "min_index_age": "${hot_index_age}"
            }
          }
        ]
      },
      {
        "name": "cold",
        "actions": [
          {
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
            },
            "replica_count": {
              "number_of_replicas": 0
            }
          },
          {
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
            },
            "allocation": {
              "require": {
                "temp": "cold"
              },
              "wait_for": false
            }
          },
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