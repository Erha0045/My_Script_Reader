import express from 'express';
const app = express();//minder om fastapi

app.get('/', (req, res) => {
    res.send({message: 'Hello World!'});
});

app.get('/newroute', (req, res) => {
    res.send({message: 'second route!'});
});

app.listen(8080, () => console.log('Server started on port', 8080));