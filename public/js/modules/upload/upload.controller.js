(function() {

    angular
    .module("app.upload")
    .controller("uploadCtrl", uploadControl);

    uploadControl.$inject = ['$http', '$state'];

    function uploadControl($http, $state) {
        var vm = this;

        $http.get('/upload').then(function(resp) {
            console.log(resp);
            if (!resp.data.logstatus) {
                console.log("No user is logged in!");
                $state.go('login');
            } else {
                console.log(resp.data.name + " is logged in");
            }
        });

        vm.uploadLink = uploadLink;

        function uploadLink(url, title) {
            console.log("Uploading...");
            var config = {
                method: 'POST',
                data: {
                    url: url,
                    title: title,
                },
                url: '/upload'
            };
            $http(config).then(function() {
                console.log("Uploaded!");
                $state.go('home');
            });
        }
    }
})();
