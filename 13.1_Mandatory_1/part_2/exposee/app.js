import express from 'express';
import http from 'http';

const app = express();
const PORT = 8080;

app.use(express.json());

//Postdata er body af hooket som sendes til integratoren,
//Det er den der kan være "Købet er udført", altså den besked som integratoren ønsker f.eks. en gang om ugen
const postData = JSON.stringify({
    'msg': 'Hello World!',
});

app.post('/hook/sender', (req, res) => {
    let options = req.body
    console.log(req.body)
    hook(options);
    res.status(200).end()
});

//Det her er frameworket for webhooken, som integratoren skal bruge 
function hook(options) {
    const req = http.request(options, (res) => {
        console.log(`STATUS: ${res.statusCode}`);
        console.log(`HEADERS: ${JSON.stringify(res.headers)}`);
        res.setEncoding('utf8');
        res.on('data', (chunk) => {
            console.log(`BODY: ${chunk}`);
        });
        res.on('end', () => {
            console.log('No more data in response.');
        });
    });

    req.on('error', (e) => {
        console.error(`Problem with request: ${e.message}`);
    });

    // Write data to request body
    req.write(postData);

    req.end();
}


app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
