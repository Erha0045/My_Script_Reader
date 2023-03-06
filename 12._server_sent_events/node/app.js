import express from 'express';
const app = express();

app.use(express.static('public'));

app.get('/synchronize-time', (req, res) => {
    res.writeHead(200, {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        'Connection': 'keep-alive'
    });

    setInterval(() => sendTimeTimeToClient(res), 1000);
});

function sendTimeTimeToClient(res) {
    const time = new Date().toTimeString();
    res.write(`data: ${time}\n\n`);
}


const PORT = 8080;
app.listen(PORT, () => console.log('Server started on port', 8080));