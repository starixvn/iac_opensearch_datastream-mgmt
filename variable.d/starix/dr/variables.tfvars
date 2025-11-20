###
opensearch_api = "https://opsi.dr.starixplay.com"

datastream_groups = {
  short-term = {
    priority                = 1000
    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-unknown",
      "logstash-debug"
    ]
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "1d"
    }
  }

  haproxy-st-prod = {
    priority                = 1001
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-haproxy-st-t2prod",
      "logstash-haproxy-st-alp-t2prod",
      "logstash-haproxy-st-was-t2prod",
    ]
    index_alias = "alias-haproxy-st-prod"
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-hot-cold-index.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "10gb"
      hot_index_age       = "5d"
      cleanup_index_age   = "12d"
    }
  }

  haproxy-sc-prod = {
    priority                = 1002
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-haproxy-sc-t2prod",
      "logstash-haproxy-sc-t1prod",
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

  haproxy-operation = {
    priority                = 1003
    index_template_filename = "index-2reps-hot.json.tpl"
    index_patterns = [
      "logstash-haproxy-st-k3sdr",
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
      "logstash-kubescape-sc-t2prod",
      "logstash-kubescape-st-t2prod",
      "logstash-kubescape-st-alp-t2prod",
      "logstash-alpha-apiext-prod",
      "logstash-pioneers-prod-default",
      "logstash-pioneers-prod-haproxy-nexcel",
      "logstash-subarashi-aff-landing-page",
      "logstash-subarashi-deposit-api-prod",
      "logstash-subarashi-prod-default",
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
      "logstash-vault-audit-st-prod",
    ]
    index_alias = "alias-vault-st-prod"
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
      "logstash-kube-audit",
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
