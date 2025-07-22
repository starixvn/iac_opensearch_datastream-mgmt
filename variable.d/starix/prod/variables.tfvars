###
opensearch_api = "https://127.0.0.1:9200"

datastream_groups = {
  short-term = {
    priority = 1000

    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-haproxy-swarm-unknown-prod",
      "logstash-haproxy-ing-unknown-prod",
      "logstash-unknown",
      "logstash-debug",
    ]

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "1d"
    }

  }

  haproxy-prod = {
    priority = 1001

    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-haproxy-swarm-alphaprod-prod",
      "logstash-haproxy-swarm-starixprod-prod"
    ]
    index_alias = "alias-haproxy-prod"

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "3d"
    }
  }

  haproxy-longterm = {
    priority = 1002

    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-haproxy-gw-prod",
      "logstash-haproxy-ing-devops-prod",
    ]

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "7d"
    }
  }


  vault-services = {
    priority = 1003

    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-vault-audit-starix-prod",
      "logstash-vault-audit-starix-uat",
    ]

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_age  = "1d"
      rollover_index_size = "5gb"
      cleanup_index_age   = "7d"
    }
  }



  kubernetes-components = {
    priority = 1004

    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-container-nexops",
    ]

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "7d"
    }
  }

}

# REQUIRED VARIABLE SET [opensearch_cred]
vault_secrets = {
  opensearch_cred = {
    mount = "nexops"
    path  = "automation/Opensearch/datastream-management/starix/creds"
  }
}
