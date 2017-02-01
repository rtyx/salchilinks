(function() {
    angular
    .module("app.home")
    .service("homeService", function ($http) {
        var service = this;

        function extract(result) { //extracts the data from the HTTP request
            return result.data;
        }

        service.loadHome = function() { //loads the last posted links
            var config = {
                method: 'GET',
                data: {
                },
                url: '/home?' + Date.now()
            };
            return $http(config)
            .then(extract);
        };

        service.favLink = function (id) { //allows the user to mark a link as a favourite
            var config = {
                method: 'POST',
                data: {
                    linkId: id
                },
                url: '/fav'
            };
            return $http(config)
            .then(extract);
        };

        service.getUserFavs = function() { //fetches the list of links a user has previously marked as favourites
            var config = {
                method: 'GET',
                data: {
                },
                url: '/favs'
            };
            return $http(config)
            .then(extract);
        };
    });
})();
