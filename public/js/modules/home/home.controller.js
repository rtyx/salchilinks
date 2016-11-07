(function() {
    angular
        .module("homeApp")
        .controller("homeCtrl", HomeController);

        function HomeController() {
            var vm = this;
            vm.data = linksData;

            vm.activeLink = {};
            vm.changeActiveLink = changeActiveLink;

            function changeActiveLink(index) {
                vm.activeLink = index;
                console.log(index);
            }
        }

        var linksData = [
            {
                url: "www.elpais.es",
                title: "This is a cool title",
                author: "Your mum",
                id: 1
            },
            {
                url: "www.elmundo.com",
                title: "This is a bad title",
                author: "Your dad",
                id: 2
            },
            {
                url: "www.elespanol.es",
                title: "This is a worse title",
                author: "Your aunt",
                id: 3
            },
            {
                url: "www.elespanol.es",
                title: "This is a MIAU title",
                author: "Your cat",
                id: 4
            },
            {
                url: "www.elespanol.es",
                title: "This is a GUAY title",
                author: "Your dog",
                id: 5
            }
        ];
})();
