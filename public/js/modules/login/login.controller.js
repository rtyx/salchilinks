(function() {
    angular
        .module('app.login')
        .controller('loginCtrl', loginControl);

        loginControl.$inject = ['$http', '$state']

        function loginControl($http, $state) {
            var vm = this;

            $http.get('/login').then(function(resp) {
                if (resp.data.logstatus) {
                    console.log("User " + resp.data.id + " is logged in!");
                    $state.go('home');
                }
            });

            vm.login = function(email, password) {
              var config = {
                method: 'POST',
                data: {
                    email: email,
                    password: password
                },
                url: '/login'
              }
              $http(config);
              $state.go('home');
            }
        }
})();
