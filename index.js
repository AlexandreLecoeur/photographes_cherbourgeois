require('dotenv').config()

const express = require('express');
const app = express();

app.set('views', './views');
app.set('view engine', 'ejs')

const year = new Date().getFullYear(); // permet de récupérer l'année courante
app.locals.currentYear = year; // transfère l'année à toutes les vues, automatiquement.

app.listen(3000, () => {
    console.log(`Example app listening at http://localhost:3000`);
});