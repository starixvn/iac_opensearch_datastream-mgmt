{
  "index_patterns": ${index_patterns},
  "template": {
    "settings": {
      "index": {
        "number_of_shards": "1",
        "number_of_replicas": "1",
        "refresh_interval": "5s",
        "routing": {
          "allocation": {
            "require": {
              "temp": "hot"
            }
          }
        }
      }
    },
    "mappings": {
      "properties": {
        "status_code": { "type": "integer" },
        "geoip": {
          "type": "object",
          "properties": {
            "city_name": {
              "type": "keyword"
            },
            "country_name": {
              "type": "keyword"
            },
            "location": {
              "type": "geo_point"
            },
            "country_iso": {
              "type": "keyword"
            }
          }
        }
      }
    }%{ if index_alias != "" },
    "aliases": {
      "${index_alias}": {}
    }%{ endif }
  },
  "priority": ${priority},
  "_meta": {
    "flow": "simple"
  },
  "data_stream": {
    "timestamp_field": {
      "name": "@timestamp"
    }
  }
}