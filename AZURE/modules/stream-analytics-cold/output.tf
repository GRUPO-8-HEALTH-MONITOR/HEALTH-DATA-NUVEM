output "job_name" {
  description = "Name of the Stream Analytics cold path job"
  value       = azurerm_stream_analytics_job.this.name
}

output "job_id" {
  description = "Resource ID of the Stream Analytics cold path job"
  value       = azurerm_stream_analytics_job.this.id
}
