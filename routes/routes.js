const express = require('express');
const router = express.Router();
const aux = require('../SQL/aux.js');

// HOME

router.route('/home')
    .get(function(req, res) {
        blablabla
    })
    .post(function(req, res) {
        blablabla
    });

router.route('/register')
    .post(function(req, res) {
        aux.registerUser(req.body.user_name, req.body.email, req.body.password);
    });

// router.get('/index', function (req,res) {
//     var count = req.query.count;
//     aux.getImages(count)
//     .then(function(response){
//         res.json(response.rows);
//     })
//     .catch(function(error){
//         console.log(error(error));
//         res.json({
//             success: false,
//             reason: error
//         });
//     });
// });

module.exports = router;
