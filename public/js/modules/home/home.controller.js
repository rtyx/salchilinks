(function() {
    angular
    .module("app.home")
    .controller("homeCtrl", ['homeService', function (homeService) {
        var home = this;

        home.loadHome = function() { homeService.loadHome()
            .then(function(data) {
                home.data = data.links;
                if (data.user) {
                    home.activeUser = data.user.name;
                } else {
                    home.activeUser = false;
                }
            })
            .catch(function(err) {
                console.log(err);
            });
        };

        home.loadHome();

        home.favLink = function(id, index) { homeService.favLink(id)
            .then(function(data) {
                console.log(data);
                if (data.success) {
                    home.data[index].starred = true;
                    home.data[index].favs = data.favs;
                } else {
                    console.log(data.reason);
                }
            })
            .catch(function(err) {
                console.log(err);
            });
        };

        home.getUserFavs = function() { homeService.getUserFavs()
            .then(function(data) {
                if (data.success) {
                    var favs = data.favs; //this is an array with all the user's favourite links (their id)
                    for (var i = 0; i < home.data.length; i++) { //this iterates through all the links currently shown
                        if (favs.indexOf(home.data[i].id) > -1) { //and checks wether they belong to the user's favourites or not
                            home.data[i].starred = true; //if they are part of his favourites, they're flagged
                        }
                    }
                } else {
                    console.log(data.reason);
                }
            })
            .catch(function(err) {
                console.log(err);
            });
        };

        home.getUserFavs();
    }]);
})();
