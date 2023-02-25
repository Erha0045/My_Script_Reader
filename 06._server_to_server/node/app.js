import express from 'express';
const app = express();

app.get('/date', (req, res) => {
    res.send(new Date());
    // res.send({message: 'Hello  from node!'});
});
//For at kunne sende dato og tekst samtidig
app.get('/dateAndtext', (req, res) => {
    const mydate = new Date();
    const myText = "Hello from nodejs";
    const combined = myText + " " + mydate;
    res.send(combined);
});

//This code is defining a route in a Node.js server that retrieves the current date 
//from a FastAPI server and sends it back to the client making the request.
app.get('/datefromfastapi', async(req, res) => {
/*task get date from fastapi. Complete the folowing:*/
    const response = await fetch('http://127.0.0.1:8000/date');
    const date = await response.json();
    res.send(date);
});



const PORT = 8081;
app.listen(PORT,() => console.log("Server runnig on port ", PORT));


