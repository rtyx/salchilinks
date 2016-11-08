(function() {
    angular
        .module('app.login')
        .controller('loginCtrl', loginControl);

        loginControl.$inject = ['$http']

        function loginControl($http) {
            var vm = this;
            vm.login = function(user_name, password) {
                console.log(user_name, password);
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
            }
        }
})();
