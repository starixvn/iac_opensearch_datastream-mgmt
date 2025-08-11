# Create datasource Index Template
resource "opensearch_composable_index_template" "index_templates" {
  for_each = { for entry in local.index_templates : "${entry.id}" => entry }
  name     = each.value.name
  body = templatefile("${path.module}/templates/${each.value.template_file}", {
    index_patterns = each.value.index_patterns
    priority       = each.value.priority
    index_alias    = each.value.index_alias
  })
}

# Create datastream 
resource "opensearch_data_stream" "datastreams" {
  for_each   = { for entry in local.datastreams : "${entry.name}" => entry }
  name       = each.key
  depends_on = [opensearch_composable_index_template.index_templates]
}

# Create ISM policies
resource "opensearch_ism_policy" "ism_policies" {
  for_each  = { for entry in local.ism_policies : "${entry.id}" => entry }
  policy_id = each.value.name
  body = templatefile("${path.module}/policies/${each.value.template_file}", {
    rollover_index_age  = each.value.rollover_index_age
    rollover_index_size = each.value.rollover_index_size
    cleanup_index_age   = each.value.cleanup_index_age
    hot_index_age       = each.value.hot_index_age
    index_patterns      = each.value.index_patterns
    priority            = each.value.priority
  })
}
