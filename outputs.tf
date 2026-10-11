output "generative_ai_projects_id" {
  description = "Map of id values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no id are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.id if v.id != null && length(v.id) > 0 }
}
output "generative_ai_projects_compartment_id" {
  description = "Map of compartment_id values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no compartment_id are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "generative_ai_projects_conversation_config" {
  description = "Map of conversation_config values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no conversation_config are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => one(v.conversation_config) if v.conversation_config != null && length(v.conversation_config) > 0 }
}
output "generative_ai_projects_defined_tags" {
  description = "Map of defined_tags values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no defined_tags are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "generative_ai_projects_description" {
  description = "Map of description values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no description are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.description if v.description != null && length(v.description) > 0 }
}
output "generative_ai_projects_display_name" {
  description = "Map of display_name values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no display_name are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "generative_ai_projects_freeform_tags" {
  description = "Map of freeform_tags values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "generative_ai_projects_lifecycle_details" {
  description = "Map of lifecycle_details values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "generative_ai_projects_long_term_memory_config" {
  description = "Map of long_term_memory_config values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no long_term_memory_config are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => one(v.long_term_memory_config) if v.long_term_memory_config != null && length(v.long_term_memory_config) > 0 }
}
output "generative_ai_projects_short_term_memory_optimization_config" {
  description = "Map of short_term_memory_optimization_config values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no short_term_memory_optimization_config are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => one(v.short_term_memory_optimization_config) if v.short_term_memory_optimization_config != null && length(v.short_term_memory_optimization_config) > 0 }
}
output "generative_ai_projects_state" {
  description = "Map of state values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no state are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.state if v.state != null && length(v.state) > 0 }
}
output "generative_ai_projects_system_tags" {
  description = "Map of system_tags values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no system_tags are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "generative_ai_projects_time_created" {
  description = "Map of time_created values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no time_created are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "generative_ai_projects_time_updated" {
  description = "Map of time_updated values across all generative_ai_projects, keyed the same as var.generative_ai_projects except keys with no time_updated are omitted"
  value       = { for k, v in oci_generative_ai_project.generative_ai_projects : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}

