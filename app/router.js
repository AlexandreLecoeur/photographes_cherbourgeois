const express = require('express');
const app = express();

app.get('/', (req, res) => {
    response.send('Hello World!');
});

app.get('/photographer', (req,res) => {
    response.send('Bientôt la liste des photographes!');
});

app.get('/photographer/:id', (req,res) => { 
    response.send("Notice individuelle d'un photographe!");
});