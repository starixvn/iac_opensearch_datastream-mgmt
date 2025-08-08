####
opensearch_api = "https://opsi.nexdev.net"

datastream_groups = {
  short-term-local = {
    priority                = 1000
    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-haproxy-ing-unknown-local",
      "logstash-syslog-unknown-local",
      "logstash-debug-local",
      "logstash-unknown-local",
      "logstash-falco-local",
    ]
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "1d"
    }
  }


  haproxy-ingress-local = {
    priority                = 1001
    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-haproxy-ing-nexprod",
      "logstash-haproxy-ing-starix-local",
      "logstash-haproxy-gw-local",
    ]
    index_alias = "alias-haproxy"
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "3d"
    }
  }


  vault-services = {
    priority                = 1002
    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-vault-audit-local",
      "logstash-vault-audit-dev",
    ]
    index_alias = "alias-vault"
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "7d"
    }
  }


  kubernetes-components = {
    priority                = 1003
    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-container-nexops",
    ]
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "3d"
    }
  }


  common-app-dev = {
    priority                = 1005
    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      # SUBARASHI
      "logstash-subarashi-deposit-api-local",
      "logstash-subarashi-local-default",

      # FPS
      "logstash-wabisabi-fingerprint-attribute",
      "logstash-wabisabi-login-trans7",
    ]
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
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
