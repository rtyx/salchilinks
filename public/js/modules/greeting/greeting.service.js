(function() {
    angular
    .module("app.greeting")
    .service("greetingService", function ($http) {
        console.log("Greeting service running...");
        var service = this;

        function extract(result) { //extracts the data from the HTTP request
            console.log(result);
            return result.data;
        }

        service.loadUser = function() { //loads the last posted links
            return $http.get('/user')
            .then(extract);
        };
    });
})();
