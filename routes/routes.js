const express = require('express');
const router = express.Router();
const aux = require('../SQL/aux.js');

// HOME

router.route('/home')
    .get(function(req, res) {
        aux.getLinks()
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
        // [user, email, password] = [req.body.user, req.body.email, req.body.password];
        aux.registerUser(req.body.user, req.body.email, req.body.password)
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

module.exports = router;
