(function() {
    angular
    .module("app.greeting")
    .controller("greetingCtrl", ['greetingService', function (greetingService) {
        console.log("Greeting controller running...");
        var greeting = this;

        greeting.loadUser = function() { greetingService.loadUser()
            .then(function(data) {
                if (data.user) {
                    greeting.activeUser = data.user.name;
                } else {
                    greeting.activeUser = false;
                }
            })
            .catch(function(err) {
                console.log(err);
            });
        };

        greeting.loadUser();

    }]);
})();
