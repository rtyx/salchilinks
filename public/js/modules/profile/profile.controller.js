
(function() {
    angular
    .module('app.profile')
    .controller('profileCtrl', profileControl);

    profileControl.$inject = ['$http', '$state', '$stateParams'];

    function profileControl($http, $state, $stateParams) {
        var vm = this;

        $http.get('/profile/' + $stateParams.user).then(function(resp) {
            vm.id = resp.data.id;
            vm.name = resp.data.name;
            vm.email = resp.data.email;
            vm.links = resp.data.links;

            console.log(vm);

            if (resp.data.logstatus) {
                console.log(this);
                // console.log("User " + resp.data.id + " is logged in!");
                // $state.go('home');
            }
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
