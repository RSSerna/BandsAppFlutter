const path = require('path');
const express = require('express');
require('dotenv').config();

const app = express();

//Path Publico
const publicPath = path.resolve(__dirname, 'public');

app.use(express.static(publicPath));

app.listen(process.env.PORT, (err) => {
    if (err) throw new Error(err);
    console.log('Servidor corriendo en puerto', process.env.PORT);
});