output "servicebus_namespace_id" {
  description = "ID do Service Bus Namespace"
  value       = azurerm_servicebus_namespace.sb.id
}

output "queue_id" {
  description = "ID da fila do Service Bus"
  value       = azurerm_servicebus_queue.queue.id
}
