import { keccak256, encodeAbiParameters } from 'viem';

export function calculateMerkleRoot(leaves: string[]): string {
  if (leaves.length === 0) return '0x0000000000000000000000000000000000000000000000000000000000000000';
  if (leaves.length === 1) return leaves[0];
  
  const nextLevel: string[] = [];
  for (let i = 0; i < leaves.length; i += 2) {
    const left = leaves[i];
    const right = i + 1 < leaves.length ? leaves[i + 1] : left;
    const combined = keccak256(encodeAbiParameters(
      [{ type: 'bytes32' }, { type: 'bytes32' }],
      [left as `0x${string}`, right as `0x${string}`]
    ));
    nextLevel.push(combined);
  }
  
  return calculateMerkleRoot(nextLevel);
}
