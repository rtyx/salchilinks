const faker = require('faker');
const aux = require('./SQL/aux.js');

// var randomCard = faker.helpers.createCard(); // random contact card containing

// for (var i = 0; i < 50; i++) {
//     var randomId = faker.random.number(50);
//     var randomUrl = faker.internet.url();
//     var randomTitle = faker.random.words();
//     aux.insertLinkThroughFaker(randomId, randomUrl, randomTitle);
// }
//
// for (var i = 0; i < 50; i++) {
//     var randomName = faker.internet.userName(); // Rowan Nikolaus
//     var randomEmail = faker.internet.email(); // Kassandra.Haley@erich.biz
//     var randomPassword = "password";
//     aux.registerUser(randomName, randomEmail, randomPassword);
// }

for (var i = 0; i < 50; i++) {
    var randomId = faker.random.number(50);
    var randomAuthor = faker.random.number(50);
    var randomComment = faker.lorem.sentence();
    aux.postComment(randomId, randomAuthor, randomComment);
}

for (var i = 0; i < 50; i++) {
    var randomLink = faker.random.number(50);
    var randomUser = faker.random.number(50);
    aux.favLink(randomUser, randomLink);
}
