(function() {
    angular
        .module("app.home")
        .controller("homeCtrl", homeControl);

        homeControl.$inject = ['$http']

        function homeControl($http) {
            var vm = this;
            vm.data = linksData;

            vm.activeLink = {};
            vm.changeActiveLink = changeActiveLink;

            vm.sayhey = sayhey;

            function sayhey() {
                console.log("hey");
            }

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
