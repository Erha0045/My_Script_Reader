import express from 'express';
const app = express();

app.use(express.json());

// Set up webhook endpoints
const endpoints = [
    { path: '/hook/receiver' },
    { path: '/hook/notification' },
    { path: '/hook/godnatbesked' }
];

//Integrator skal have en webhook, som sender beskeden til exposee
endpoints.forEach(endpoint => {
    app.post(endpoint.path, (req, res) => {
        console.log(req.body); // Call your action on the request here
        res.status(200).end(); // Responding is important
    });
});

// Start server
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});
