(function() {
    angular
    .module('app.link')
    .controller('linkCtrl', linkControl);

    linkControl.$inject = ['$http', '$state', '$stateParams'];

    function linkControl($http, $state, $stateParams) {
        var vm = this;

        $http.get('/link/' + $stateParams.id).then(function(resp) {

            if (!resp.data.session) {
                $state.go('home');
            }

            vm.title = resp.data.title;
            vm.url = resp.data.url;
            vm.date = resp.data.date;
            vm.user = resp.data.user;
            vm.ogimage = resp.data.ogimage;
            vm.ogtitle = resp.data.ogtitle;
            vm.comments = resp.data.comments;

            vm.postComment = postComment;

            function postComment(newComment, parent) {
                console.log("Posting comment...");
                var config = {
                    method: 'POST',
                    data: {
                        linkId : $stateParams.id,
                        author : resp.data.session.id,
                        comment : newComment,
                        parent: parent
                    },
                    url: '/comment'
                };
                $http(config);
                console.log("Posted!");
                setTimeout(function () {
                    $state.reload();
                }, 1000);
            }

            vm.showReplyBox = showReplyBox;

            function showReplyBox(id) {
                console.log("Replying comment " + id + "...");
                $('#replyBox_' + id).css('display', 'block');
            }

            vm.showReplies = showReplies;

            function showReplies(id) {
                console.log("Showing replies to comment " + id + "...");
                $('#repliesBox_' + id).css('display', 'block');
            }
        });
    }
})();
