const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const routes = require('./routes.js');
const chalk = require('chalk');

// app.use(express.static())

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({
    extended: true
}));

app.use('/', routes);

app.listen(8080, function () {
    console.log(chalk.blue('Listening on port 8080!'));
});
