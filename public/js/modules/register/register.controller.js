(function() {
    angular
    .module('app.register')
    .controller('registerCtrl', registerControl);

    registerControl.$inject = ['$http', '$state'];

    function registerControl($http, $state) {
        var vm = this;

        $http.get('/register').then(function(resp) {
            if (resp.data.logstatus) {
                console.log("User " + resp.data.id + " is logged in!");
                $state.go('home');
            }
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
            };
            $http(config).then(function(res) {
                if (!res.data.success) {
                    vm.errmessage = res.data.reason;
                } else {
                    $state.go('home');
                }
            });
        };
    }
})();
