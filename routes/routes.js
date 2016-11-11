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

// INDEX

// router.route('/')
//     .get(function(req, res) {
//         res.redirect('/#/home');
//     });

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
        res.json(req.session.user);
    })
    .post(function(req, res) {
        console.log(req.session);
        if (req.session.user) {
            res.redirect('/');
        } else {
            aux.registerUser(req.body.user_name, req.body.email, req.body.password)
            .then(function(response) {
                req.session.user = {
                    logstatus: true,
                    id: response.rows[0].id
                };
                console.log(req.session);
                res.json(response.rows);
            })
            .catch(function(error) {
                console.log(error(error));
                res.json({
                    success: false,
                    reason: error
                });
            });
        }
    });

router.route('/login')
    .post(function(req, res) {
        aux.logInUser(req.body.email, req.body.password)
        .then(function(response) {
            console.log(response.rows);
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
            console.log(error(error));
            res.json({
                success: false,
                reason: "Something went wrong!"
            });
        });
    });

router.route('/profile/:user')
    .get(function(req, res) {
        var user = req.url.split('/').pop();
        aux.getProfile(user)
        .then(function(response) {
            console.log(response);
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
