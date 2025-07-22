#####
opensearch_api = "https://opsi.lumigame.com"

datastream_groups = {
  short-term-local = {
    priority = 1000

    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-haproxy-ing-unknown-local",
      "logstash-haproxy-unknown",
      "logstash-unknown",
    ]

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "1d"
    }
  }


  haproxy-ingress-local = {
    priority = 1001

    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-haproxy-ing-lumprod",
      "logstash-haproxy-sc-local",
    ]

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "3d"
    }
  }


  vault-services = {
    priority = 1002

    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-vault-lumi-local",
    ]

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "7d"
    }
  }


  # kubernetes-components = {
  #   priority = 1003

  #   index_template_filename = "index-one-shard.json.tpl"
  #   index_patterns = [
  #     "logstash-container-nexops",
  #   ]

  #   # Template ISM Policy file stay on policies directory
  #   ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
  #   ism_policy_rollover_condition = {
  #     rollover_index_age  = "1d"
  #     rollover_index_size = "5gb"
  #     cleanup_index_age   = "3d"
  #   }
  # }

  haproxy-ingress-eks = {
    priority = 1004

    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-haproxy-ing-eksprod",
      "logstash-haproxy-gw-eksprod",
      "logstash-haproxy-ing-eksuat",
      "logstash-haproxy-gw-eksuat",
    ]

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "7d"
    }
  }

  eks-controller-components = {
    priority                = 1005
    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      # EKS-LOCAL
      # "logstash-eks-cloud-controller-manager-ekslocal",
      # "logstash-eks-kube-controller-manager-ekslocal",
      # "logstash-eks-kube-scheduler-ekslocal",
      # "logstash-dataplane-ekslocal",
      # "logstash-container-logs-ekslocal",
      # "logstash-worker-node-logs-ekslocal",

      # EKS-UAT
      "logstash-eks-cloud-controller-manager-eksuat",
      "logstash-eks-kube-controller-manager-eksuat",
      "logstash-eks-kube-scheduler-eksuat",
      "logstash-dataplane-eksuat",
      "logstash-container-logs-eksuat",
      "logstash-worker-node-logs-eksuat",

      # EKS-PROD
      "logstash-eks-cloud-controller-manager-eksprod",
      "logstash-eks-kube-controller-manager-eksprod",
      "logstash-eks-kube-scheduler-eksprod",
      "logstash-dataplane-eksprod",
      "logstash-container-logs-eksprod",
      "logstash-worker-node-logs-eksprod",

      "logstash-unknown-eksprod",
    ]

    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "7d"
    }
  }


  aws-components = {
    priority                = 1006
    index_template_filename = "index-one-shard.json.tpl"
    index_patterns = [
      "logstash-cloudtrail-awslocal",
      "logstash-cloudtrail-awskbt",
    ]
    # Template ISM Policy file stay on policies directory
    ism_policy_filename = "rollover-by-indexsize-indexage.json.tpl"
    ism_policy_rollover_condition = {
      rollover_index_size = "5gb"
      cleanup_index_age   = "14d"
    }
  }

}

# REQUIRED VARIABLE SET [opensearch_cred]
vault_secrets = {
  opensearch_cred = {
    mount = "nexops"
    path  = "automation/Opensearch/datastream-management/lumi/creds"
  }
}
