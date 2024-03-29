const path = require('path');
const express = require('express');
require('dotenv').config();

//App de Express
const app = express();

//Node Server
const server = require('http').createServer(app);
module.exports.io = require('socket.io')(server);

//Inicializar socket desde el archivo
require('./sockets/socket');

//Path Publico
const publicPath = path.resolve(__dirname, 'public');
app.use(express.static(publicPath));


server.listen(process.env.PORT, (err) => {
    if (err) throw new Error(err);
    console.log('Servidor corriendo en puerto', process.env.PORT);
});