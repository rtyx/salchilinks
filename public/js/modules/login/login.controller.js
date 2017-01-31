(function() {
    angular
    .module('app.login')
    .controller('loginCtrl', loginControl);

    loginControl.$inject = ['$http', '$state'];

    function loginControl($http, $state) {
        var vm = this;

        $http.get('/login').then(function(resp) {
            if (resp.data.logstatus) {
                $state.go('home');
            }
        });

        vm.login = function(email, password) {
            console.log("logging in");
            var config = {
                method: 'POST',
                data: {
                    email: email,
                    password: password
                },
                url: '/login'
            };
            $http(config).then(function(res) {
                if (res.data.success == false) {
                    vm.errmessage = res.data.reason;
                } else {
                    $state.go('home');

                }
            });
        };
    }
})();
