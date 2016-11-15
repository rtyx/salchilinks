const chalk = require('chalk');
const error = chalk.bold.red;
const db = require('./db.js');
const hash = require('./hash.js');
const parser = require('./parser.js');


module.exports = {
    getLinks: function (count) {
        console.log(chalk.blue("Getting links..."));
        return db.usedb('SELECT links.id, links.user_id, links.url, links.title, links.comments, links.favs, links.creation_date, links.ogimage, users.user_name FROM links LEFT JOIN users ON links.user_id = users.id ORDER BY creation_date DESC LIMIT $1;', [count]);
    },
    getLink: function (id) {
        console.log(chalk.blue("Getting link " + id + "..."));
        return db.usedb('SELECT links.id, links.user_id, links.url, links.title, links.comments, links.creation_date, links.ogimage, users.user_name FROM links LEFT JOIN users ON links.user_id = users.id WHERE links.id = $1;', [id]);
    },
    insertLink: function (user_id, url, title) {
        console.log(chalk.blue("Inserting links..."));
        return parser.parseUrl(url).then(function(og) {
            console.log("Checking database for similar links...");
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
    insertLinkThroughFaker: function (user_id, url, title) {
        console.log(chalk.blue("Inserting links..."));
        return db.usedb('INSERT INTO links (user_id, url, title) VALUES ($1, $2, $3) RETURNING id;', [user_id, url, title]);
    },
    registerUser: function (user_name, email, password) {
        return hash.hashPassword(password).then(function(hashedPassword){
            console.log(chalk.blue("Registering user..."));
            return db.usedb('INSERT INTO users (user_name, email, password) VALUES ($1, $2, $3) RETURNING id, user_name;', [user_name, email, hashedPassword]);
        });
    },
    logInUser: function(email, password) {
        console.log(chalk.blue("Logging " + email + " in..."));
        return db.usedb('SELECT * FROM users WHERE email = $1;', [email]).then(function(userInfo){
            return hash.checkPassword(password, userInfo.rows[0].password).then(function(passMatch){
                if(passMatch){
                    console.log('matched');
                    return db.usedb('SELECT * FROM users WHERE email = $1;', [email]);
                } else {
                    console.log('did not match');
                }
            });
        });
    },
    // deleteProfile: function(data) {
    //     console.log(chalk.blue("Deleting profile " + email + " in..."));
    //     return db.usedb('DELETE FROM users WHERE user_id = $1', [id]);
    // }
    getProfile: function(user_name) {
        console.log(chalk.blue("Getting " + user_name + " profile..."));
        return db.usedb('SELECT user_name, email, id FROM users WHERE user_name = $1;', [user_name]);
    },
    getUserLinks: function(userId) {
        console.log(chalk.blue("Getting links from " + userId + "..."));
        // return db.usedb('SELECT links.title, links.url, links.creation_date, users.user_name, users.email, users.id FROM links LEFT JOIN users ON links.user_id = $1 ORDER BY creation_date DESC LIMIT 5;', [userId]);
        return db.usedb('SELECT * FROM links WHERE user_id = $1 ORDER BY creation_date DESC LIMIT 50;', [userId]);
    },
    getComments: function(linkId) {
        console.log(chalk.blue("Getting comments from the server..."));
        // return db.usedb('SELECT links.id, links.user_id, links.url, links.title, links.comments, links.creation_date, links.ogimage, users.user_name FROM links LEFT JOIN users ON links.user_id = users.id WHERE links.id = $1;', [id]);
        return db.usedb('SELECT comments.id, comments.link_id, comments.user_id, comments.comment, comments.creation_date, users.user_name FROM comments LEFT JOIN users ON comments.user_id = users.id WHERE link_id = $1 AND comments.parent is null ORDER BY creation_date DESC LIMIT 10;', [linkId]);
    },
    getReplies: function(parent) {
        console.log(chalk.blue("Getting replies for the comment " + parent + " from the server..."));
        return db.usedb('SELECT * FROM comments WHERE parent = $1 ORDER BY creation_date DESC;', [parent]);
    },
    getUserComments: function(userId) {
        console.log(chalk.blue("Getting comments from the user..."));
        return db.usedb('SELECT * FROM comments WHERE user_id = $1 ORDER BY creation_date DESC;', [userId]);
    },
    postComment: function(link_id, author, comment, parent) {
        console.log(chalk.blue("Saving comment..."));
        db.usedb('INSERT INTO comments (link_id, user_id, comment, parent) VALUES ($1, $2, $3, $4) RETURNING id;', [link_id, author, comment, parent]);
        return db.usedb('UPDATE links SET comments = comments + 1 WHERE id = $1', [link_id]);
    },
    deleteComment: function(id) {
        console.log(chalk.blue("Deleting comment " + id + "..."));
        return db.usedb('DELETE * FROM comments WHERE id = $1;', [id]);
    },
    deleteAllComments: function(link_id) {
        console.log(chalk.blue("Deleting comments in image (" + link_id + ") from the server..."));
        return db.usedb('DELETE FROM comments WHERE imageid = $1;', [link_id]);
    },
    favLink: function(userId, linkId) {
        console.log(chalk.blue("Adding link " + linkId + " in " + userId + " favourites..."));
        db.usedb('UPDATE links SET favs = favs + 1 WHERE id = $1', [linkId]);
        return db.usedb('INSERT INTO favs (user_id, link_id) VALUES ($1, $2) RETURNING id', [userId, linkId]);
    }
};
