{
  "index_patterns": ${index_patterns},
  "template": {
    "settings": {
      "index": {
        "number_of_shards": "1",
        "number_of_replicas": "0",
        "refresh_interval": "5s"
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