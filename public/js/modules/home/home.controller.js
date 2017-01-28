(function() {
    angular
    .module("app.home")
    .controller("homeCtrl", homeControl);

    homeControl.$inject = ['$http', '$state'];

    function homeControl($http) {
        var vm = this;

        vm.options = [{
            id: "1",
            name: 'most recent',
            value: '-creation_date'
        }, {
            id: "2",
            name: 'most popular',
            value: '-favs'
        }];

        vm.changeOrder = function(val) {
            console.log(val);
            vm.order = val;
        };

        vm.loadHome = loadHome;

        function loadHome() {
            $http.get('/home?' + Date.now()).then(function(resp) {
                console.log(resp.data);
                if (resp.data.user) {
                    $('#greeting').css('display', 'block');
                    vm.activeUser = resp.data.user.name;
                } else {
                    vm.activeUser = " ";
                }
                vm.data = resp.data.links;
            });
        }

        vm.loadHome();

        vm.fav = favLink;

        function favLink(id, index) {
            console.log("Faving link...");
            var config = {
                method: 'POST',
                data: {
                    linkId: id
                },
                url: '/fav'
            };
            $http(config).then(function(res) {
                if (res.data.success) {
                    $('#' + id).css('color', '#DC6F2A');
                    vm.data[index].favs += 1;
                } else {
                    console.log(res.data.reason);
                }
            });
        }

        vm.getUserFavs = getUserFavs;

        function getUserFavs() {
            console.log("Getting user favs...");
            var config = {
                method: 'GET',
                data: {
                },
                url: '/favs'
            };
            $http(config).then(function(res) {
                if (res.data.success) {
                    var userFaved = [];
                    function getFavsId() {
                        res.data.favs.map(function (fav) {
                            return userFaved.push(parseInt(fav.link_id));
                        });
                    }
                    getFavsId();
                    $('.star').each(function() {
                        if ($.inArray(parseInt($(this)[0].id), userFaved) > -1) {
                            $(this).css('color', '#DC6F2A');
                        }
                    });
                } else {
                    console.log(res.data.reason);
                }
            });
        }

        vm.getUserFavs();

        // $http(config).then(function() {
        //     vm.data.find(function(item) {
        //         return item.id == id;
        //     });

        // vm.favLink = favLink;

        // function favLink(linkId, userId) {
        //
        // }

        // vm.activeLink = {};
        // vm.changeActiveLink = changeActiveLink;
        //
        // function changeActiveLink(index) {
        //     vm.activeLink = index;
        //     console.log(index);
        // }
    }
})();
