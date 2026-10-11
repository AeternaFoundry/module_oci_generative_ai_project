resource "oci_generative_ai_project" "generative_ai_projects" {
  for_each = var.generative_ai_projects

  compartment_id = each.value.compartment_id
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags

  dynamic "conversation_config" {
    for_each = each.value.conversation_config != null ? [each.value.conversation_config] : []
    content {
      conversations_retention_in_hours = conversation_config.value.conversations_retention_in_hours
      responses_retention_in_hours     = conversation_config.value.responses_retention_in_hours
    }
  }

  dynamic "long_term_memory_config" {
    for_each = each.value.long_term_memory_config != null ? [each.value.long_term_memory_config] : []
    content {
      dynamic "standard_long_term_memory_strategy" {
        for_each = long_term_memory_config.value.standard_long_term_memory_strategy != null ? [long_term_memory_config.value.standard_long_term_memory_strategy] : []
        content {
          dynamic "embedding_config" {
            for_each = standard_long_term_memory_strategy.value.embedding_config != null ? [standard_long_term_memory_strategy.value.embedding_config] : []
            content {
              llm_selection {
                llm_selection_type = embedding_config.value.llm_selection.llm_selection_type
                model_id           = embedding_config.value.llm_selection.model_id
              }
            }
          }
          dynamic "extraction_config" {
            for_each = standard_long_term_memory_strategy.value.extraction_config != null ? [standard_long_term_memory_strategy.value.extraction_config] : []
            content {
              llm_selection {
                llm_selection_type = extraction_config.value.llm_selection.llm_selection_type
                model_id           = extraction_config.value.llm_selection.model_id
              }
            }
          }
          is_enabled = standard_long_term_memory_strategy.value.is_enabled
        }
      }
    }
  }

  dynamic "short_term_memory_optimization_config" {
    for_each = each.value.short_term_memory_optimization_config != null ? [each.value.short_term_memory_optimization_config] : []
    content {
      dynamic "condenser_config" {
        for_each = short_term_memory_optimization_config.value.condenser_config != null ? [short_term_memory_optimization_config.value.condenser_config] : []
        content {
          llm_selection {
            llm_selection_type = condenser_config.value.llm_selection.llm_selection_type
            model_id           = condenser_config.value.llm_selection.model_id
          }
        }
      }
      is_enabled = short_term_memory_optimization_config.value.is_enabled
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

