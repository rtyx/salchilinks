(function() {
    angular
    .module("app.home")
    .controller("homeCtrl", homeControl);

    homeControl.$inject = ['$http'];

    function homeControl($http) {
        var vm = this;

        $http.get('/home').then(function(resp) {
            console.log(resp);
            vm.data = resp.data;
        });
        // vm.data = linksData;

        vm.activeLink = {};
        vm.changeActiveLink = changeActiveLink;

        function changeActiveLink(index) {
            vm.activeLink = index;
            console.log(index);
        }
    }

    var linksData = [
        {
            url: "https://www.google.es",
            title: "This is a cool title",
            author: "Your mum",
            tags: "tag",
            id: 1
        },
        {
            url: "www.elmundo.com",
            title: "This is a bad title",
            author: "Your dad",
            tags: "tag",
            id: 2
        },
        {
            url: "www.elespanol.es",
            title: "This is a worse title",
            author: "Your aunt",
            tags: "tag",
            id: 3
        },
        {
            url: "www.elespanol.es",
            title: "This is a MIAU title",
            author: "Your cat",
            tags: "tag",
            id: 4
        },
        {
            url: "www.elespanol.es",
            title: "This is a GUAY title",
            author: "Your dog",
            tags: "tag",
            id: 5
        },
        {
            url: "https://www.google.es",
            title: "This is a cool title",
            author: "Your mum",
            tags: "tag",
            id: 1
        },
        {
            url: "www.elmundo.com",
            title: "This is a bad title",
            author: "Your dad",
            tags: "tag",
            id: 2
        },
        {
            url: "www.elespanol.es",
            title: "This is a worse title",
            author: "Your aunt",
            tags: "tag",
            id: 3
        },
        {
            url: "www.elespanol.es",
            title: "This is a MIAU title",
            author: "Your cat",
            tags: "tag",
            id: 4
        },
        {
            url: "www.elespanol.es",
            title: "This is a GUAY title",
            author: "Your dog",
            tags: "tag",
            id: 5
        }
    ];
})();

// (function() {
//
//     var myApp = angular.module('myApp', []);
//
//     myApp.controller('index', function($scope, $http) {
//         $http.get('/admin/index').then(function(resp) {
//             $scope.index = resp.data;
//         });
//         $scope.update = function() {
//             console.log("Updating...");
//             var tags = this.image.hashtags;
//             var newTags;
//             if (typeof tags == "object") {
//                 newTags = tags;
//             } else {
//                 newTags = tags.split(',');
//             }
//             var url = '/admin/update/';
//             var data = {
//                 id: this.image.id,
//                 description: this.image.description,
//                 hashtags: newTags
//             };
//             $http.post(url, data).then(function() {
//                 alert("Updated!");
//             });
//         };
//         $scope.delete = function() {
//             console.log("Deleting...");
//             var url = '/admin/delete/';
//             var data = {
//                 id: this.image.id,
//             };
//             $http.post(url, data).then(function(resp) {
//                 console.log(resp);
//                 alert("Deleted!");
//                 $http.get('/admin/index').then(function(resp) {
//                     $scope.index = resp.data;
//                 });
//             });
//         };
//     });
// })();
