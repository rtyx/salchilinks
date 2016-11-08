const chalk = require('chalk');
const db = require('./db.js');
// const hash = require('./hash.js');

module.exports = {
    getLinks: function (count) {
        console.log(chalk.blue("Getting links..."));
        return db.usedb('SELECT * FROM links ORDER BY creation_date DESC LIMIT $1;', [count]);
    },
    insertLink: function (user_id, url, title) {
        console.log(chalk.blue("Getting links..."));
        return db.usedb('INSERT INTO links (user_id, url, title) VALUES ($1, $2, $3) RETURNING id;', [user_id, url, title]);
    },
    registerUser: function(user, email, password) {
        // hash.hashPassword(password).then
        console.log(chalk.blue("Registering user..."));
        ////
    },
    logInUser: function(email, password) {
        console.log(chalk.blue("Logging " + email + " in..."));
        ////
    },
    getProfile: function(id) {
        console.log(chalk.blue("Getting " + user + " profile..."));
        return db.usedb('SELECT * FROM users WHERE user_id = $1;', [id]);
    },
    getComments: function(id) {
        console.log(chalk.blue("Getting comments from the server..."));
        return db.usedb('SELECT * FROM comments WHERE link_id = $1 ORDER BY creation_date DESC LIMIT 6;', [id]);
    },
    postComment: function(link_id, author, comment) {
        console.log(chalk.blue("Saving comment..."));
        return db.usedb('INSERT INTO comments (link_id, user_id, comment) VALUES ($1, $2, $3) RETURNING id;', [link_id, author, comment]);
    },
    deleteComment: function(id) {
        console.log(chalk.blue("Deleting comment " + id + "..."));
        return db.usedb('DELETE * FROM comments WHERE id = $1;', [id]);
    },
    deleteAllComments: function(link_id) {
        console.log(chalk.blue("Deleting comments in image (" + link_id + ") from the server..."));
        return db.usedb('DELETE FROM comments WHERE imageid = $1;', [link_id]);
    },
};
