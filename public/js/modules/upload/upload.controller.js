(function() {

    angular
    .module("app.upload")
    .controller("uploadCtrl", uploadControl);

    uploadControl.$inject = ['$http', '$state'];

    function uploadControl($http, $state) {
        var vm = this;

        $http.get('/upload').then(function(resp) {
            if (!resp.data.logstatus) {
                console.log("No user is logged in!");
                $state.go('upload');
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
            $http(config);
            console.log("Uploaded!");
            setTimeout(function () {
                $state.go('home');
            }, 1000);
        }
    }
})();
