(function() {
    angular
        .module('app.register')
        .controller('registerCtrl', registerControl);

        registerControl.$inject = ['$http', '$cookies'];

        function registerControl($http, $cookies) {
            var vm = this;

            $http.get('/register').then(function(resp) {
                console.log(resp);
            });

            vm.register = function(user_name, email, password) {
              var config = {
                method: 'POST',
                data: {
                    user_name: user_name,
                    email: email,
                    password: password
                },
                url: '/register'
              }
              $http(config)
            }
        }
})();
