const faker = require('faker');
const aux = require('./SQL/aux.js');

// var randomCard = faker.helpers.createCard(); // random contact card containing

// for (var i = 0; i < 100; i++) {
//     var randomId = faker.random.number(200);
//     var randomUrl = faker.internet.url();
//     var randomTitle = faker.random.words();
//     aux.insertLinkThroughFaker(randomId, randomUrl, randomTitle);
// }

// for (var i = 0; i < 50; i++) {
//     var randomName = faker.internet.userName(); // Rowan Nikolaus
//     var randomEmail = faker.internet.email(); // Kassandra.Haley@erich.biz
//     var randomPassword = "password";
//     aux.registerUser(randomName, randomEmail, randomPassword);
// }

for (var i = 0; i < 1000; i++) {
    var randomId = faker.random.number(504);
    var randomAuthor = faker.random.number(300);
    var randomComment = faker.lorem.sentence();
    aux.postComment(randomId, randomAuthor, randomComment);
}
