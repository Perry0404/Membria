use dashmap::DashMap;
use std::sync::Arc;

pub struct HotStateTrie {
    storage: Arc<DashMap<[u8; 32], [u8; 32]>>,
    ttl: u64,
}

impl HotStateTrie {
    pub fn new(ttl: u64) -> Self {
        Self {
            storage: Arc::new(DashMap::new()),
            ttl,
        }
    }

    pub fn write(&self, key: [u8; 32], value: [u8; 32]) {
        self.storage.insert(key, value);
    }

    pub fn read(&self, key: &[u8; 32]) -> Option<[u8; 32]> {
        self.storage.get(key).map(|v| *v)
    }

    pub fn clear(&self) {
        self.storage.clear();
    }
}
