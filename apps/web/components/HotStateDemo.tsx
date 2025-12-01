'use client';

import { useState } from 'react';

export default function HotStateDemo() {
  const [key, setKey] = useState('');
  const [value, setValue] = useState('');
  const [result, setResult] = useState('');

  const handleWrite = async () => {
    // Write to hot state
    setResult(`Writing ${value} to ${key}...`);
  };

  const handleRead = async () => {
    // Read from hot state
    setResult(`Reading from ${key}...`);
  };

  return (
    <div className="border rounded-lg p-6">
      <h2 className="text-2xl font-bold mb-4">🔥 Hot State</h2>
      <div className="space-y-4">
        <input
          type="text"
          placeholder="Key"
          value={key}
          onChange={(e) => setKey(e.target.value)}
          className="w-full border rounded px-3 py-2"
        />
        <input
          type="text"
          placeholder="Value"
          value={value}
          onChange={(e) => setValue(e.target.value)}
          className="w-full border rounded px-3 py-2"
        />
        <div className="flex gap-2">
          <button onClick={handleWrite} className="bg-orange-500 text-white px-4 py-2 rounded">
            Write
          </button>
          <button onClick={handleRead} className="bg-blue-500 text-white px-4 py-2 rounded">
            Read
          </button>
        </div>
        {result && <p className="text-sm text-gray-600">{result}</p>}
      </div>
    </div>
  );
}
