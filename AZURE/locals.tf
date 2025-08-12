locals {
  logic_app_cold_definition = {
    "$schema" = "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#"
    "contentVersion" = "1.0.0.0"
    "parameters"     = {}
    "triggers" = {
      "When_a_blob_is_added_or_modified" = {
        "type" = "ApiConnection"
        "inputs" = {
          "host" = {
            "connection" = {
              "name" = "@parameters('$connections')['azureblob']['connectionId']"
            }
          }
          "method" = "get"
          "path"   = "/datasets/default/triggers/onupdatedfile"
          "queries" = {
            "folderId" = "/"
          }
        }
        "recurrence" = {
          "frequency" = "Minute"
          "interval"  = 1
        }
      }
    }
    "actions" = {
      "Send_HTTP_Request_to_AWS" = {
        "type" = "Http"
        "inputs" = {
          "method" = "POST"
          "uri"    = var.aws_api_gateway_url
          "headers" = {
            "Content-Type" = "application/json"
          }
          "body" = {
            "blobName" = "@triggerBody()?['Name']"
            "timestamp" = "@utcNow()"
          }
        }
        "runAfter" = {
          "When_a_blob_is_added_or_modified" = [ "Succeeded" ]
        }
      }
    }
    "outputs" = {}
  }
}
