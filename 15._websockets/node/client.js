import Websocket from 'ws';

const websocketClient = new Websocket('ws://localhost:8082');

websocketClient.on('open', () => {
    console.log('connected to server');
    websocketClient.send('hello from client');

    });