'use client';

import { useState, useEffect } from 'react';

export default function ColdStateViewer() {
  const [blockNumber, setBlockNumber] = useState<number>(0);
  const [stateRoot, setStateRoot] = useState<string>('');

  useEffect(() => {
    // Fetch latest committed state
    setStateRoot('0x0000000000000000000000000000000000000000000000000000000000000000');
  }, [blockNumber]);

  return (
    <div className="border rounded-lg p-6">
      <h2 className="text-2xl font-bold mb-4">❄️ Cold State</h2>
      <div className="space-y-4">
        <input
          type="number"
          placeholder="Block Number"
          value={blockNumber}
          onChange={(e) => setBlockNumber(parseInt(e.target.value))}
          className="w-full border rounded px-3 py-2"
        />
        <div>
          <p className="text-sm font-semibold">State Root:</p>
          <p className="text-xs font-mono break-all">{stateRoot}</p>
        </div>
      </div>
    </div>
  );
}
