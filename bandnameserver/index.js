const path = require('path');
const express = require('express');
require('dotenv').config();

//App de Express
const app = express();

//Node Server
const server = require('http').createServer(app);
const io = require('socket.io')(server);

//Mensajes por Sockets
io.on('connection', client => {
    console.log('Cliente Conectado');
    client.on('disconnect', () => { console.log('Cliente desconectado'); });
});


//Path Publico
const publicPath = path.resolve(__dirname, 'public');
app.use(express.static(publicPath));


server.listen(process.env.PORT, (err) => {
    if (err) throw new Error(err);
    console.log('Servidor corriendo en puerto', process.env.PORT);
});