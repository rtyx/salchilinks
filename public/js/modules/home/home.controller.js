(function() {
    angular
    .module("app.home")
    .controller("homeCtrl", homeControl);

    homeControl.$inject = ['$http'];

    function homeControl($http) {
        var vm = this;

        vm.order = "creation_date";

        $http.get('/home').then(function(resp) {
            console.log(resp.data);
            if (resp.data.user) {
                vm.activeUser = resp.data.user.name;
            } else {
                vm.activeUser = "there!";
            }
            vm.data = resp.data.links;
        });

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
