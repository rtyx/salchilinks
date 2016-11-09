const express = require('express');
const router = express.Router();
const csurf = require('csurf');
const aux = require('../SQL/aux.js');

var csrfProtection = csurf({ cookie: true });
// var parseForm = bodyParser.urlencoded({ extended: false });

router.use(csrfProtection);

// HOME

router.route('/home')
    .get(function(req, res) {
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
    .get(function(req, res) {
        res.json({
            csrfToken: req.csrfToken()
        });
    })
    .post(function(req, res) {
        aux.registerUser(req.body.user_name, req.body.email, req.body.password)
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

router.route('/login')
    .get(function(req, res) {
        res.json({
            csrfToken: req.csrfToken()
        });
    })
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
    .get(function(req, res) {
        res.json({
            csrfToken: req.csrfToken()
        });
    })
    .post(function(req, res) {
        aux.insertLink(420, req.body.url, req.body.title)
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
