(function() {

    const parser = require("ogp-parser");

    angular
    .module("app.upload")
    .controller("uploadCtrl", uploadControl);

    uploadControl.$inject = ['$http'];

    function uploadControl($http) {
        var vm = this;

        vm.uploadLink = uploadLink;

        function uploadLink(url, title) {
            console.log("Uploading...");
            var urlToParse = "http://internacional.elpais.com/internacional/2016/11/09/estados_unidos/1478647677_279555.html";
            parser(urlToParse, true).then(function(data) {
                var config = {
                    method: 'POST',
                    data: {
                        url: url,
                        title: title,
                        ogtitle: data.ogp['og:title'],
                        ogdescription: data.ogp['og:description'],
                        ogimage: data.ogp['og:image']
                    },
                    url: '/upload'
                };
                $http(config);
            }).catch(function(error) {
                console.error(error);
            });
        }
    }
})();
