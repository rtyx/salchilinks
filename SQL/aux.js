const chalk = require('chalk');
const error = chalk.bold.red;
const db = require('./db.js');
const hash = require('./hash.js');
const parser = require('./parser.js');


module.exports = {
    getLinks: function (count) {
        console.log(chalk.blue("Getting links..."));
        return db.usedb('SELECT * FROM links ORDER BY creation_date DESC LIMIT $1;', [count]);
    },
    insertLink: function (user_id, url, title) {
        console.log(chalk.blue("Inserting links..."));
        return parser.parseUrl(url).then(function(og) {
            return db.usedb('SELECT * FROM links WHERE url = $1;', [url]).then(function(data) {
                console.log("Checking if URL already exists...");
                if (data.rows[0]) {
                    console.log(error("It already exists!"));
                    throw new Error("Duplicated URL");
                } else {
                    console.log("Checking if title already exists...");
                    return db.usedb('SELECT * FROM links WHERE title = $1;', [og.title]).then(function(data) {
                        if (data.rows[0]) {
                            console.log(error("It already exists!"));
                            throw new Error("Duplicated title");
                        } else {
                            console.log("Looks new!");
                            return db.usedb('INSERT INTO links (user_id, url, title, ogtitle, ogdescription, ogimage) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;', [user_id, url, title, og.title, og.description, og.image]);
                        }
                    });
                }
            });
        });
    },
    registerUser: function (user_name, email, password) {
        return hash.hashPassword(password).then(function(hashedPassword){
            console.log(chalk.blue("Registering user..."));
            db.usedb('INSERT INTO users (user_name, email, password) VALUES ($1, $2, $3);', [user_name, email, hashedPassword]);
        });
    },
    logInUser: function(email, password) {
        console.log(chalk.blue("Logging " + email + " in..."));
        db.usedb('SELECT * FROM users WHERE email = $1;', [email]).then(function(userInfo){
            hash.checkPassword(password, userInfo.rows[0].password).then(function(passMatch){
                if(passMatch){
                    console.log('matched');
                } else {
                    console.log('did not match');
                }
            });
        });
    },
    getProfile: function(id) {
        console.log(chalk.blue("Getting " + id + " profile..."));
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
