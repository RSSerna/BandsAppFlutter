const path = require('path');
const express = require('express');

const app = express();

//Path Publico
const publicPath = path.resolve(__dirname, 'public');

app.use(express.static(publicPath));

app.listen(3000, (err) => {
    if (err) throw new Error(err);
    console.log('Servidor corriendo en puerto', 3000);
});