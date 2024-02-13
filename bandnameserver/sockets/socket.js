const { io } = require('../index');
const Band = require('../models/band');
const Bands = require('../models/bands');

const bands = new Bands();

bands.addBand(new Band('Queen'));
bands.addBand(new Band('AC/DC'));
bands.addBand(new Band('Metallica'));
bands.addBand(new Band('Linkedin Park'));


//Mensajes por Sockets
io.on('connection', client => {
    console.log('Cliente Conectado');
    client.emit('active-bands', bands.getBands());
    client.on('disconnect', () => { console.log('Cliente desconectado'); });
    client.on('mensaje', (payload) => {
        console.log('Mensaje: ', payload);
        io.emit('mensaje', { admin: 'Nuevo Mensaje' });
    });
    client.on('emitir-mensaje', (payload) => {
        console.log('Mensaje Recivido: ', payload);
        client.broadcast.emit('nuevo-mensaje', payload);
    });

    client.on('vote-band', (payload) => {
        console.log('Vote Band: ', payload);
        bands.voteBand(payload.id);
        io.emit('active-bands', bands.getBands());
    });
    client.on('add-band', (payload) => {
        console.log('Add Band: ', payload);
        bands.addBand(new Band(payload.name));
        io.emit('active-bands', bands.getBands());
    });
    client.on('delete-band', (payload) => {
        console.log('Delete Band: ', payload);
        bands.deleteBand(payload.id);
        io.emit('active-bands', bands.getBands());
    });
});