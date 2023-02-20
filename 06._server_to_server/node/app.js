import express from 'express';
const app = express();

app.get('/date', (req, res) => {
    res.send(new Date());
});

//for at de to services kan kommunikere
app.get('/datefromfastapi', async(req, res) => {
    /*task get date from fastapi. Complete the folowing:*/
    fetch('http://localhost:8000/date')

});

const PORT = 8080;
app.listen(PORT,() => console.log("Server runnig on port 8080", PORT));

