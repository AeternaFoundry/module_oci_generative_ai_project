variable "generative_ai_projects" {
  description = <<EOT
Map of generative_ai_projects, attributes below
Required:
    - compartment_id
Optional:
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - conversation_config (block):
        - conversations_retention_in_hours (optional)
        - responses_retention_in_hours (optional)
    - long_term_memory_config (block):
        - standard_long_term_memory_strategy (optional, block):
            - embedding_config (optional, block):
                - llm_selection (required, block):
                    - llm_selection_type (required)
                    - model_id (required)
            - extraction_config (optional, block):
                - llm_selection (required, block):
                    - llm_selection_type (required)
                    - model_id (required)
            - is_enabled (required)
    - short_term_memory_optimization_config (block):
        - condenser_config (optional, block):
            - llm_selection (required, block):
                - llm_selection_type (required)
                - model_id (required)
        - is_enabled (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    defined_tags   = optional(map(string))
    description    = optional(string)
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    conversation_config = optional(object({
      conversations_retention_in_hours = optional(number)
      responses_retention_in_hours     = optional(number)
    }))
    long_term_memory_config = optional(object({
      standard_long_term_memory_strategy = optional(object({
        embedding_config = optional(object({
          llm_selection = object({
            llm_selection_type = string
            model_id           = string
          })
        }))
        extraction_config = optional(object({
          llm_selection = object({
            llm_selection_type = string
            model_id           = string
          })
        }))
        is_enabled = bool
      }))
    }))
    short_term_memory_optimization_config = optional(object({
      condenser_config = optional(object({
        llm_selection = object({
          llm_selection_type = string
          model_id           = string
        })
      }))
      is_enabled = bool
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_projects : (
        v.long_term_memory_config == null || (v.long_term_memory_config.standard_long_term_memory_strategy == null || (v.long_term_memory_config.standard_long_term_memory_strategy.embedding_config == null || (contains([for v in ["GEN_AI_MODEL"] : lower(v)], lower(v.long_term_memory_config.standard_long_term_memory_strategy.embedding_config.llm_selection.llm_selection_type)))))
      )
    ])
    error_message = "must be one of: \"GEN_AI_MODEL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_projects : (
        v.long_term_memory_config == null || (v.long_term_memory_config.standard_long_term_memory_strategy == null || (v.long_term_memory_config.standard_long_term_memory_strategy.extraction_config == null || (contains([for v in ["GEN_AI_MODEL"] : lower(v)], lower(v.long_term_memory_config.standard_long_term_memory_strategy.extraction_config.llm_selection.llm_selection_type)))))
      )
    ])
    error_message = "must be one of: \"GEN_AI_MODEL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_projects : (
        v.short_term_memory_optimization_config == null || (v.short_term_memory_optimization_config.condenser_config == null || (contains([for v in ["GEN_AI_MODEL"] : lower(v)], lower(v.short_term_memory_optimization_config.condenser_config.llm_selection.llm_selection_type))))
      )
    ])
    error_message = "must be one of: \"GEN_AI_MODEL\""
  }
}

