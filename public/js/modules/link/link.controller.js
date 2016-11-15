(function() {
    angular
    .module('app.link')
    .controller('linkCtrl', linkControl);

    linkControl.$inject = ['$http', '$state', '$stateParams'];

    function linkControl($http, $state, $stateParams) {
        var vm = this;

        $http.get('/link/' + $stateParams.id).then(function(resp) {

            console.log(resp);

            vm.id = resp.data.id;
            vm.title = resp.data.title;
            vm.url = resp.data.url;
            vm.date = resp.data.date;
            vm.user = resp.data.user;
            vm.ogimage = resp.data.ogimage;
            vm.ogtitle = resp.data.ogtitle;
            vm.comments = resp.data.comments;

            // console.log(vm);

            if (resp.data.logstatus) {
                console.log(this);
                // console.log("User " + resp.data.id + " is logged in!");
                // $state.go('home');
            }
        });
    }
})();
