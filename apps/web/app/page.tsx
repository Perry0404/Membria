export default function Home() {
  return (
    <main className=\"min-h-screen p-8\">
      <h1 className=\"text-4xl font-bold mb-4\">Dual-Layer EVM</h1>
      <p className=\"text-lg mb-8\">Hot (RAM) and Cold (ROM) state architecture</p>
      <div className=\"grid grid-cols-2 gap-8\">
        <div className=\"border rounded-lg p-6 bg-orange-50\">
          <h2 className=\"text-2xl font-bold mb-4\">🔥 Hot Layer</h2>
          <p>Volatile, ultra-fast state (10,000+ TPS)</p>
        </div>
        <div className=\"border rounded-lg p-6 bg-blue-50\">
          <h2 className=\"text-2xl font-bold mb-4\">❄️ Cold Layer</h2>
          <p>Immutable, finalized state</p>
        </div>
      </div>
    </main>
  );
}
