const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('¡Hola desde Docker! 🐳');
});

app.listen(port, () => {
  console.log(`App corriendo en http://localhost:${port}`);
});
