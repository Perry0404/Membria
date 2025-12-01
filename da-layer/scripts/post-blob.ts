import axios from 'axios';

const CELESTIA_RPC = process.env.CELESTIA_RPC || 'http://localhost:26658';

async function postBlob(data: string, namespace: string) {
  const response = await axios.post(`${CELESTIA_RPC}/blob/submit`, {
    data: Buffer.from(data).toString('base64'),
    namespace,
  });
  
  console.log('Blob submitted:', response.data);
  return response.data.height;
}

postBlob('test data', 'dual-layer-evm').catch(console.error);
