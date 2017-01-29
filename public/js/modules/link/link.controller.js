(function() {
    angular
    .module('app.link')
    .controller('linkCtrl', linkControl);

    linkControl.$inject = ['$http', '$state', '$stateParams'];

    function linkControl($http, $state, $stateParams) {
        var vm = this;

        vm.fav = favLink;

        function favLink(id) {
            console.log("Faving link...");
            var config = {
                method: 'POST',
                data: {
                    linkId: id
                },
                url: '/fav'
            };
            $http(config);
            console.log("Faved!").then(function() {
                $state.reload();
            });
        }

        $http.get('/link/' + $stateParams.id).then(function(resp) {

            vm.title = resp.data.title;
            vm.url = resp.data.url;
            vm.creation_date = resp.data.date;
            vm.user = resp.data.user;
            vm.ogimage = resp.data.ogimage;
            vm.ogtitle = resp.data.ogtitle;
            vm.comments = resp.data.comments;
            vm.favs = resp.data.favs;
            vm.nofcomments = resp.data.nofcomments;

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
                $http(config).then(function() {
                    console.log("Posted!");
                    $state.reload();
                });
            }

            vm.showReplyBox = showReplyBox;

            function showReplyBox(id) {
                console.log("Replying comment " + id + "...");
                $('#replyBox_' + id).removeClass('hidden');
            }

            vm.showReplies = showReplies;

            function showReplies(index, parent) {
                console.log("Showing in " + index + " replies to comment " + parent + "...");
                $('#repliesBox_' + parent).css('display', 'block');
                var config = {
                    method: 'GET',
                    params: {
                        parent: parent
                    },
                    url: '/reply'
                };
                $http(config).then(function(resp) {
                    console.log(vm.comments[index]);
                    vm.comments[index].replies = resp.data.replies;
                    console.log(resp.data.replies);
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
                    console.log(res.data);
                    if (res.data.success) {
                        var userFaved = [];
                        function getFavsId() {
                            res.data.favs.map(function (fav) {
                                return userFaved.push(parseInt(fav.link_id));
                            });
                        }
                        getFavsId();
                        $('.star').each(function() {
                            if ($.inArray(parseInt($stateParams.id), userFaved) > -1) {
                                $(this).css('color', '#DC6F2A');
                            }
                        });
                    } else {
                        console.log(res.data.reason);
                    }
                });
            }

            vm.getUserFavs();
        });
    }
})();
