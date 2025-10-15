const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('🧠 Wisecow is running on Kubernetes with TLS!');
});

app.listen(port, () => {
  console.log(`Wisecow app listening at http://localhost:${port}`);
});