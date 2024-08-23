curl -X POST \
  -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  -H "Content-Type: application/json" \
  -d '{
    "displayName": "bp-job",
    "model": "projects/our-hull-433320-g2/locations/us-central1/models/gemini-1.5-pro-001",
    "inputConfig": {
      "instancesFormat": "bigquery",
      "bigquerySource": {
        "inputUri": "bq://our-hull-433320-g2.batch.requests"
      }
    },
    "outputConfig": {
      "predictionsFormat": "bigquery",
      "bigqueryDestination": {
        "outputUri": "bq://our-hull-433320-g2.batch.predictions"
      }
    }
  }' \
  "https://us-central1-aiplatform.googleapis.com/v1/projects/our-hull-433320-g2/locations/us-central1/batchPredictionJobs"
