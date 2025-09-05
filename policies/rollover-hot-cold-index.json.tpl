{
  "policy": {
    "description": "TF - Rollover by IndexSize & IndexAge",
    "default_state": "hot",
    "states": [
      {
        "name": "hot",
        "actions": [
          {
            "allocation": {
              "require": {
                "temp": "hot"
              },
              "exclude": {},
              "include": {},
              "wait_for": false
            },
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
            }
          },
          {
            "rollover": {
              "min_index_age": "${rollover_index_age}",
              "min_primary_shard_size": "${rollover_index_size}",
              "copy_alias": false
            },
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
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
            "replica_count": {
              "number_of_replicas": 0
            },
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
            }
          },
          {
            "allocation": {
              "require": {
                "temp": "cold"
              },
              "exclude": {},
              "include": {},
              "wait_for": false
            },
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
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
            "delete": {},
            "retry": {
              "count": 3,
              "backoff": "exponential",
              "delay": "1m"
            }
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