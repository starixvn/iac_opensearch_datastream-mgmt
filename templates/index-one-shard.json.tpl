{
  "index_patterns": ${index_patterns},
  "template": {
    "settings": {
      "index": {
        "number_of_shards": "1",
        "number_of_replicas": "0",
        "refresh_interval": "5s"
      }
    },
    "mappings": {
      "properties": {
        "Tr": { "type": "integer" },
        "Tt": { "type": "integer" },
        "sc-status": { "type": "integer" },
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