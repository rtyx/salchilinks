var bcrypt = require('bcrypt');

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
            })
        })
    })
}

module.exports.hashPassword = hashPassword;
