import express from 'express';
const app = express();

app.use(express.json());

import swaggerUi from 'swagger-ui-express';
import swaggerJsdoc from 'swagger-jsdoc';

const swaggerDefinition = {
    openapi: '3.0.0',
    info: {
        title: 'Users API',
        version: '1.0.0',
        description: 'This is a simple CRUD API application made with Express and documented with Swagger',
    },
};
const options = {
    swaggerDefinition,
    apis: ['./router/*.js'],
};
app.use("/docs", swaggerUi.serve, swaggerUi.setup(swaggerJsdoc(options)));


import usersRouter from './router/usersRouter.js';
app.use("/users", usersRouter);



app.listen(8080, () => console.log("server is running on port", 8080));
