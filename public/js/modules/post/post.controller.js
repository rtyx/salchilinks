(function() {

    angular
    .module("app.post")
    .controller("postCtrl", postControl);

    postControl.$inject = ['$http', '$state'];

    function postControl($http, $state) {
        var vm = this;

        $http.get('/post').then(function(resp) {
            console.log(resp);
            if (!resp.data.logstatus) {
                console.log("No user is logged in!");
                $state.go('login');
            } else {
                console.log(resp.data.name + " is logged in");
            }
        });

        vm.postLink = postLink;

        function postLink(url, title) {
            console.log("Posting...");
            var config = {
                method: 'POST',
                data: {
                    url: url,
                    title: title,
                },
                url: '/post'
            };
            $http(config).then(function(res) {
                if (res.data.success) {
                    $state.go('home');
                } else {
                    vm.errmessage = res.data.reason;
                }
            });
        }
    }
})();
