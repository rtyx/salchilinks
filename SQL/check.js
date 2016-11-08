var bcrypt = require('bcrypt');

function checkPassword(typedPass, dbPass) {
    return new Promise(function(resolve, reject){
        bcrypt.compare(typedPass, dbPass, function(err, results) {
            if (err) {
                reject(err);
                return;
            }
            resolve(results);
        })
    })
}

module.exports.checkPassword = checkPassword;
