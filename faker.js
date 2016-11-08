const faker = require('faker');
const aux = require('./SQL/aux.js');




// var randomCard = faker.helpers.createCard(); // random contact card containing

// for (var i = 0; i < 100; i++) {
//     var randomId = faker.random.number();
//     var randomUrl = faker.internet.url();
//     var randomTitle = faker.random.words();
//     aux.insertLink(randomId, randomUrl, randomTitle);
// }

for (var i = 0; i < 100; i++) {
    var randomName = faker.name.findName(); // Rowan Nikolaus
    var randomEmail = faker.internet.email(); // Kassandra.Haley@erich.biz
    var randomPassword = "password";
    aux.registerUser(randomName, randomEmail, randomPassword);
}
