locals {
  index_templates = flatten([
    for group, group_details in var.datastream_groups : {
      id             = "${group}"
      name           = "tf-${group}"
      template_file  = "${group_details.index_template_filename}"
      index_alias    = lookup(group_details, "index_alias", "")
      priority       = group_details.priority
      index_patterns = jsonencode([for ds in group_details.index_patterns : "*${ds}*"])
    }
  ])

  datastreams = flatten([
    for group, group_details in var.datastream_groups : [
      for index in group_details.index_patterns : {
        name     = "${index}"
        template = "${group}"
      }
    ]
  ])

  ism_policies = flatten([
    for group, group_details in var.datastream_groups : {
      id                  = "${group}"
      name                = "tf-${group}-rollover"
      priority            = group_details.priority
      index_patterns      = jsonencode([for ds in group_details.index_patterns : "*${ds}*"])
      template_file       = "${group_details.ism_policy_filename}"
      rollover_index_age  = lookup(group_details.ism_policy_rollover_condition, "rollover_index_age", "1d")
      rollover_index_size = lookup(group_details.ism_policy_rollover_condition, "rollover_index_size", "5gb")
      cleanup_index_age   = lookup(group_details.ism_policy_rollover_condition, "cleanup_index_age", "1d")
      hot_index_age       = lookup(group_details.ism_policy_rollover_condition, "hot_index_age", "null")
    }
  ])

}
