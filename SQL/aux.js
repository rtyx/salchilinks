const chalk = require('chalk');
const db = require('./db.js');
const hash = require('./hash.js');

module.exports = {
    getLinks: function () {
        console.log(chalk.blue("Getting links..."));
        return db.usedb('INSERT INTO links (url, author, title, description, hashtags) VALUES ($1, $2, $3, $4, $5) RETURNING id;', [data.url, data.author, data.title, data.description, data.hashtags]);
    },
    registerUser: function(user, email, password) {
        hash.hashPassword(password).then
        console.log(chalk.blue("Registering user..."));
        ////
    },
    logInUser: function(email, password) {
        console.log(chalk.blue("Logging " + email + " in..."));
        ////
    },
    getProfile: function(user) {
        console.log(chalk.blue("Getting " + user + " profile..."));
        /////
    }
};
