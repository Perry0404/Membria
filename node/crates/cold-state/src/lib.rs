use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StateCommitment {
    pub block_number: u64,
    pub state_root: [u8; 32],
    pub timestamp: u64,
}

pub struct ColdStateStore {
    index: BTreeMap<u64, StateCommitment>,
}

impl ColdStateStore {
    pub fn new() -> Self {
        Self {
            index: BTreeMap::new(),
        }
    }

    pub fn commit(&mut self, commitment: StateCommitment) {
        self.index.insert(commitment.block_number, commitment);
    }

    pub fn get_state_root(&self, block_number: u64) -> Option<[u8; 32]> {
        self.index.get(&block_number).map(|c| c.state_root)
    }
}
