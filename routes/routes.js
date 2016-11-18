const express = require('express');
const router = express.Router();
const csurf = require('csurf');
const aux = require('../SQL/aux.js');
const cookieSession = require('cookie-session');
const cookieParser = require('cookie-parser');
const chalk = require('chalk');
const errstyle = chalk.bold.red;

router.use(cookieSession({
    secret: 'helloworld',
    maxAge: 1000 * 60 * 60 * 24 * 14
}));
router.use(cookieParser());

router.use(csurf());
router.use(function(req, res, next) {
    res.cookie('XSRF-TOKEN', req.csrfToken());
    next();
});

// HOME

router.route('/home')
.get(function(req, res) {
    aux.getLinks(30)
    .then(function(response) {
        res.json({
            user: req.session.user,
            links: response.rows});
    })
    .catch(function(error) {
        console.log(errstyle(error));
        res.json({
            success: false,
            reason: "Something went wrong!"
        });
    });
});

router.route('/register')
.get(function(req, res) {
    res.json(req.session.user);
})
.post(function(req, res) {
    console.log(req.session);
    aux.registerUser(req.body.user_name, req.body.email, req.body.password)
    .then(function(response) {
        req.session.user = {
            logstatus: true,
            id: response.rows[0].id,
            name: response.rows[0].user_name
        };
        res.json(response.rows);
    })
    .catch(function(error) {
        console.log(errstyle(error));
        res.json({
            success: false,
            reason: "Something went wrong!"
        });
    });
});

router.route('/login')
.get(function(req, res) {
    res.json(req.session.user);
})
.post(function(req, res) {
    aux.logInUser(req.body.email, req.body.password)
    .then(function(response) {
        req.session.user = {
            logstatus: true,
            id: response.rows[0].id,
            name: response.rows[0].user_name
        };
        res.json(response.rows);
    })
    .catch(function(error) {
        console.log(errstyle(error));
        res.json({
            success: false,
            reason: "Incorrect password or email! Check and try again"
        });
    });
});

// router.get('/logout', function(req,res){
//     if(req.session.user){
//         req.session = null;
//     }
// });

// router.get('/del/profile', function(req,res){
// var query = 'DELETE FROM petition WHERE user_id = $1';
// var params = [req.session.user.id];
// db.dbquery(query, params).then(function(){
//     res.redirect('/petition');
// })
// });

router.route('/upload')
.get(function(req, res) {
    res.json(req.session.user);
})
.post(function(req, res) {
    aux.insertLink(req.session.user.id, req.body.url, req.body.title)
    .then(function() {
        console.log("Done!");
        res.redirect('/');
    })
    .catch(function(error) {
        console.log(errstyle(error));
        res.json({
            success: false,
            reason: "That link already exists in our database!"
        });
    });
});

router.route('/profile/:user')
.get(function(req, res) {
    var user = req.url.split('/').pop();
    var name;
    var email;
    var id;
    aux.getProfile(user)
    .then(function(response) {
        name = response.rows[0].user_name;
        email = response.rows[0].email;
        id = response.rows[0].id;
        return aux.getUserLinks(id);
    })
    .then(function(response) {
        res.json({
            id: id,
            name: name,
            email: email,
            links: response.rows
        });
    })
    .catch(function(error) {
        console.log(errstyle(error));
        res.json({
            success: false,
            reason: "Something went wrong!"
        });
    });
});

router.route('/comments/:user')
.get(function(req, res) {
    var user = req.url.split('/').pop();
    aux.getUserComments(user)
    .then(function(response) {
        res.json(response.rows);
    });
});

router.route('/link/:id')
.get(function(req, res) {
    var id = req.url.split('/').pop();
    var user, title, url, date, ogtitle, ogimage, ogdescription, nofcomments, favs;
    aux.getLink(id)
    .then(function(response) {
        user = response.rows[0].user_name;
        title = response.rows[0].title;
        url = response.rows[0].url;
        ogtitle = response.rows[0].ogtitle;
        ogimage = response.rows[0].ogimage;
        date = response.rows[0].creation_date;
        favs = response.rows[0].favs;
        nofcomments = response.rows[0].comments;
        return aux.getComments(id);
    })
    .then(function(response) {
        res.json({
            session: req.session.user,
            user: user,
            title: title,
            url: url,
            date: date,
            ogtitle: ogtitle,
            ogimage: ogimage,
            ogdescription: ogdescription,
            nofcomments: nofcomments,
            favs: favs,
            comments: response.rows
        });
    })
    .catch(function(error) {
        console.log(errstyle(error));
        res.json({
            success: false,
            reason: "Something went wrong!"
        });
    });
});

router.route('/comment')
.post(function(req, res) {
    aux.postComment(req.body.linkId, req.body.author, req.body.comment, req.body.parent)
    .then(function() {
        console.log("Done!");
        res.json({
            success: true
        });
    })
    .catch(function(error) {
        console.log(errstyle(error));
        res.json({
            success: false,
            reason: "Something went wrong!"
        });
    });
});

router.route('/reply')
.get(function(req, res) {
    var parent = req.query.parent;
    aux.getReplies(parent)
    .then(function(response) {
        res.json({
            replies: response.rows
        });
    });
});

router.route('/fav')
.get(function(req, res) {
    var userId = req.session.user.id;
    aux.getUserFavs(userId)
    .then(function(response) {
        console.log("Done!");
        res.json({
            success: true,
            favs: response
        });
    })
    .catch(function(error) {
        console.log(errstyle(error));
        res.json({
            success: false,
            reason: "It's already in your favourites!"
        });
    });
})
.post(function(req, res) {
    var linkId = req.body.linkId;
    var userId = req.session.user.id;
    aux.favLink(userId, linkId)
    .then(function() {
        console.log("Done!");
        res.json({
            success: true
        });
    })
    .catch(function(error) {
        console.log(errstyle(error));
        res.json({
            success: false,
            reason: "Something went wrong!"
        });
    });
});

router.route('/logout')
.get(function(req, res) {
    req.session = null;
    res.redirect('/#/home');
});

// router.route('/confirmLogin')
//     .get(function(req, res) {
//         if (req.session.user) {
//
//         }
//     })

module.exports = router;
