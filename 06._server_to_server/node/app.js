import express from 'express';
const app = express();

app.get('/date', (req, res) => {
    res.send(new Date());
});

//for at de to services kan kommunikere
app.get('/datefromfastapi', async(req, res) => {
/*task get date from fastapi. Complete the folowing:*/
    const response = await fetch('http://127.0.0.1:8000/date');
    const date = await response.json();
    res.send(date);
});

//for at kunne tilgå ngrok
app.get('/test', (req, res) => {
    res.send("Hello from erhan");
});

const PORT = 8080;
app.listen(PORT,() => console.log("Server runnig on port ", PORT));


