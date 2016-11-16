const faker = require('faker');
const aux = require('./SQL/aux.js');

// var randomCard = faker.helpers.createCard(); // random contact card containing

// for (var i = 0; i < 50; i++) {
//     setTimeout(function () {
//         var randomId = faker.random.number(50);
//         var randomUrl = faker.internet.url();
//         var randomTitle = faker.random.words();
//         aux.insertLinkThroughFaker(randomId, randomUrl, randomTitle);
//     }, 600000);
// }
//
// for (var i = 0; i < 50; i++) {
//     var randomName = faker.internet.userName(); // Rowan Nikolaus
//     var randomEmail = faker.internet.email(); // Kassandra.Haley@erich.biz
//     var randomPassword = "password";
//     aux.registerUser(randomName, randomEmail, randomPassword);
// }

// for (var i = 0; i < 50; i++) {
//     setTimeout(function postComment() {
//         var randomId = faker.random.number(50);
//         var randomAuthor = faker.random.number(50);
//         var randomComment = faker.lorem.sentence();
//         aux.postComment(randomId, randomAuthor, randomComment);
//         postComment();
//     }, 5 * 60 * 1000);
// }
//
// for (var i = 0; i < 50; i++) {
//     setTimeout(function favLink() {
//         var randomLink = faker.random.number(50);
//         var randomUser = faker.random.number(50);
//         aux.favLink(randomUser, randomLink);
//         favLink();
//     }, 5 * 60 * 1000);
// }

setInterval(function fake() {
    var randomLink = faker.random.number(50);
    var randomUser = faker.random.number(50);
    var randomComment = faker.lorem.sentence();
    aux.postComment(randomLink, randomUser, randomComment);
    aux.favLink(randomUser, randomLink);
}, 60 * 1000);
