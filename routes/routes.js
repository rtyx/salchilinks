const express = require('express');
const router = express.Router();
const csurf = require('csurf');
const aux = require('../SQL/aux.js');
const cookieSession = require('cookie-session');
const cookieParser = require('cookie-parser');

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
        console.log(req.session);
        aux.getLinks(100)
        .then(function(response) {
            res.json(response.rows);
        })
        .catch(function(error) {
            console.log(error(error));
            res.json({
                success: false,
                reason: error
            });
        });
    });

router.route('/register')
    .post(function(req, res) {
        aux.registerUser(req.body.user_name, req.body.email, req.body.password)
        .then(function(response) {
            req.session.user = {
                user_name: req.body.user_name
            };
            console.log(req.session.user);
            res.json(response.rows);
        })
        .catch(function(error) {
            console.log(error(error));
            res.json({
                success: false,
                reason: error
            });
        });
    });

router.route('/login')
    .post(function(req, res) {
        aux.logInUser(req.body.email, req.body.password)
        .then(function(response) {
            res.json(response.rows);
        })
        .catch(function(error) {
            console.log(error(error));
            res.json({
                success: false,
                reason: error
            });
        });
    });

router.route('/upload')
    .post(function(req, res) {
        aux.insertLink(420, req.body.url, req.body.title)
        .then(function(response) {
            console.log("Done");
            res.json(response.rows);
        })
        .catch(function(error) {
            console.log(error(error));
        });
    });

router.route('/profile/:user')
    .get(function(req, res) {
        var user = req.query.user;
        aux.getProfile(user)
        .then(function(response) {
            res.json(response.rows);
        })
        .catch(function(error) {
            console.log(error(error));
            res.json({
                success: false,
                reason: error
            });
        });
    });

// router.route('/confirmLogin')
//     .get(function(req, res) {
//         if (req.session.user) {
//
//         }
//     })

module.exports = router;
