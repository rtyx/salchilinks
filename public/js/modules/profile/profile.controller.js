
(function() {
    angular
    .module('app.profile')
    .controller('profileCtrl', profileControl);

    profileControl.$inject = ['$http', '$state', '$stateParams'];

    function profileControl($http, $state, $stateParams) {
        var vm = this;

        $http.get('/profile/' + $stateParams.user).then(function(resp) {
            if (!resp.data.session) {
                console.log("user not logged in");
                // $state.go('login');
            }
            vm.id = resp.data.id;
            vm.name = resp.data.name;
            vm.email = resp.data.email;
            vm.links = resp.data.links + " links";
            vm.noflinks = vm.links.length;

            $http.get('/comments/' + vm.id).then(function(resp) {
                vm.comments = resp.data;
                vm.nofcomments = vm.comments.length + " comments";
            });
        });


        // vm.register = function(user_name, email, password) {
        //   var config = {
        //     method: 'POST',
        //     data: {
        //         user_name: user_name,
        //         email: email,
        //         password: password
        //     },
        //     url: '/register'
        //   }
        //   $http(config)
        //   $state.go('home');
        // }
    }
})();
