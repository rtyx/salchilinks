(function() {

    angular
    .module("app.upload")
    .controller("uploadCtrl", uploadControl);

    uploadControl.$inject = ['$http'];

    function uploadControl($http) {
        var vm = this;

        $http.get('/register').then(function(resp) {
            console.log(resp.data.csrfToken);
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
        }
    }
})();
