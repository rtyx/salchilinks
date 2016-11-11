(function() {
    angular
        .module('app.profile')
        .controller('profileCtrl', profileControl);

        profileControl.$inject = ['$http', '$state'];

        function profileControl($http, $state) {
            var vm = this;

            // $http.get('/profile/').then(function(resp) {
            //     if (resp.data.logstatus) {
            //         console.log("User " + resp.data.id + " is logged in!");
            //         $state.go('home');
            //     }
            // });

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
