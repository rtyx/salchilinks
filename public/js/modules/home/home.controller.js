(function() {
    angular
    .module("app.home")
    .controller("homeCtrl", homeControl);

    homeControl.$inject = ['$http'];

    function homeControl($http) {
        var vm = this;

        $http.get('/home').then(function(resp) {
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
})();
