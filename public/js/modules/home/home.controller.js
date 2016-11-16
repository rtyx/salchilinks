(function() {
    angular
    .module("app.home")
    .controller("homeCtrl", homeControl);

    homeControl.$inject = ['$http', '$state'];

    function homeControl($http, $state) {
        var vm = this;

        vm.order = "creation_date";

        vm.loadHome = loadHome;

        function loadHome() {
            $http.get('/home').then(function(resp) {
                console.log(resp.data);
                if (resp.data.user) {
                    vm.activeUser = resp.data.user.name;
                } else {
                    vm.activeUser = "there!";
                }
                vm.data = resp.data.links;
            });
        }

        vm.loadHome();

        vm.fav = favLink;

        function favLink(id) {
            console.log("Faving link...");
            var config = {
                method: 'POST',
                data: {
                    linkId: id
                },
                url: '/fav'
            };
            $http(config);
            console.log("Faved!");
            $state.reload();
        }

        // vm.favLink = favLink;

        // function favLink(linkId, userId) {
        //
        // }

        // vm.activeLink = {};
        // vm.changeActiveLink = changeActiveLink;
        //
        // function changeActiveLink(index) {
        //     vm.activeLink = index;
        //     console.log(index);
        // }
    }
})();
