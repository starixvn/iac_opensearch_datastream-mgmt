##
opensearch_api = "https://opsi-klp.starixplay.com"

datastream_groups = {
  short-term = {
    priority                = 1000
    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-vault-unknown",
      "logstash-haproxy-swarm-unknown-klprod",
      "logstash-haproxy-ing-unknown-prod",
      "logstash-haproxy-unknown",
      "logstash-debug",
      "logstash-unknown",
    ]
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "1d"
    }
  }

  haproxy-prod = {
    priority                = 1001
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-haproxy-swarm-starix-alphaklprod",
      "logstash-haproxy-swarm-starix-klprod",
      "logstash-haproxy-swarm-fpsklprod-klprod",
    ]
    index_alias = "alias-haproxy-klprod"
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "10gb"
      hot_index_age       = "5d"
      cleanup_index_age   = "12d"
    }
  }
  haproxy-uat = {
    priority                = 1011
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-haproxy-swarm-starix-stuat",
    ]
    index_alias = "alias-haproxy-uat"
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "10gb"
      hot_index_age       = "5d"
      cleanup_index_age   = "7d"
    }
  }

  haproxy-sc-prod = {
    priority                = 1002
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-haproxy-ing-sc-klprod",
    ]
    index_alias = "alias-haproxy-sc-prod"
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "10gb"
      hot_index_age       = "5d"
      cleanup_index_age   = "12d"
    }
  }
  haproxy-sc-uat = {
    priority                = 1012
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-haproxy-ing-sc-uat",
    ]
    index_alias = "alias-haproxy-sc-uat"
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "10gb"
      hot_index_age       = "5d"
      cleanup_index_age   = "7d"
    }
  }

  haproxy-operation = {
    priority                = 1003
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-haproxy-ing-k3sprod-prod",
      "logstash-haproxy-ing-k3suat-uat",
    ]
    index_alias = "alias-haproxy-ops"
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      hot_index_age       = "5d"
      cleanup_index_age   = "12d"
    }
  }

  common-app-dev = {
    priority                = 1005
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-alpha-apiext-klprod",
      "logstash-alpha-apiext-uat",
      "logstash-pioneers-klprod-default",
      "logstash-pioneers-klprod-haproxy-nexcel",
      "logstash-pioneers-uat-haproxy-nexcel",
      "logstash-subarashi-deposit-api-klprod",
      "logstash-subarashi-deposit-api-uat",
      "logstash-subarashi-klprod-default",
      "logstash-subarashi-uat-default",

    ]
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      hot_index_age       = "7d"
      cleanup_index_age   = "14d"
    }
  }


  vault-services = {
    priority                = 1006
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-vault-audit-starix-klprod",
      "logstash-vault-audit-starix-uat",
    ]
    index_alias = "alias-vault-klprod"
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      hot_index_age       = "7d"
      cleanup_index_age   = "14d"
    }
  }



  kubernetes-components = {
    priority                = 1010
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-kubesystem-systemd",
      "logstash-kubesystem-container-log",
    ]
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      hot_index_age       = "3d"
      cleanup_index_age   = "7d"
    }
  }

  system-syslog = {
    priority                = 1013
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-system-journal-uat",
      "logstash-system-journal-prod",
    ]
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      hot_index_age       = "3d"
      cleanup_index_age   = "3d"
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
