const bcrypt = require('bcrypt');

function hashPassword(plainTextPassword) {
    return new Promise(function(resolve, reject){
        bcrypt.genSalt(function(err, salt) {
            if (err) {
                reject(err);
                return;
            }
            bcrypt.hash(plainTextPassword, salt, function(err, hash) {
                if (err) {
                    reject(err);
                    return;
                }
                resolve(hash);
            });
        });
    });
}

function checkPassword(typedPass, dbPass) {
    return new Promise(function(resolve, reject){
        bcrypt.compare(typedPass, dbPass, function(err, results) {
            if (err) {
                reject(err);
                return;
            }
            resolve(results);
        });
    });
}


module.exports.hashPassword = hashPassword;
module.exports.checkPassword = checkPassword;
