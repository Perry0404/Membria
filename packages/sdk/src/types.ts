export interface StateCommitment {
  blockNumber: bigint;
  stateRoot: string;
  hotStateRoot: string;
  timestamp: bigint;
}

export interface HotStateEntry {
  key: string;
  value: string;
  blockNumber: bigint;
}

export interface Transaction {
  from: string;
  to: string;
  data: string;
  value: bigint;
}
