(function() {

    angular
    .module("app.upload")
    .controller("uploadCtrl", uploadControl);

    uploadControl.$inject = ['$http', '$state'];

    function uploadControl($http, $state) {
        var vm = this;

        // $http.get('/upload').then(function(resp) {
        //     console.log(resp);
        //     // vm.csrfToken = resp.data.csrfToken;
        //     // console.log(resp.data);
        //     // console.log(vm.csrfToken);
        // });

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
