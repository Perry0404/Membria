use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Blob {
    pub data: Vec<u8>,
    pub namespace: String,
}

pub struct CelestiaClient {
    endpoint: String,
}

impl CelestiaClient {
    pub fn new(endpoint: String) -> Self {
        Self { endpoint }
    }

    pub async fn submit_blob(&self, blob: Blob) -> Result<String, String> {
        // Submit to Celestia
        Ok("blob_id".to_string())
    }

    pub async fn get_blob(&self, blob_id: &str) -> Result<Blob, String> {
        // Retrieve from Celestia
        Err("Not implemented".to_string())
    }
}
