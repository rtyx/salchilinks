(function(){

    console.log("Loading router...");

    angular
    .module('app.router', ['ui.router'])
    .config(function($stateProvider, $urlRouterProvider) {

        $urlRouterProvider.otherwise('/home');

        $stateProvider

            .state('home', {
                url: '/home',
                templateUrl: 'js/modules/home/home.html',
                controller: 'homeCtrl',
                controllerAs: 'home'
            })

            // .state('greeting', {
            //     url: '/greeting',
            //     templateUrl: 'js/modules/greeting/greeting.html',
            //     controller: 'greetingCtrl',
            //     controllerAs: 'greeting'
            // })

            .state('register', {
                url: '/register',
                templateUrl: 'js/modules/register/register.html',
                controller: 'registerCtrl',
                controllerAs: 'register'
            })

            .state('login', {
                url: '/login',
                templateUrl: 'js/modules/login/login.html',
                controller: 'loginCtrl',
                controllerAs: 'login'
            })

            .state('post', {
                url: '/post',
                templateUrl: 'js/modules/post/post.html',
                controller: 'postCtrl',
                controllerAs: 'post'
            })

            .state('header', {
                url: '/header',
                templateUrl: 'js/modules/header/header.html',
                controller: 'headerCtrl',
                controllerAs: 'header'
            })

            .state('link', {
                url: '/link?id',
                templateUrl: 'js/modules/link/link.html',
                controller: 'linkCtrl',
                controllerAs: 'link'
            })

            .state('profile', {
                url: '/profile?user',
                templateUrl: 'js/modules/profile/profile.html',
                controller: 'profileCtrl',
                controllerAs: 'user'
            });

            // .state('profile.user', {
            //     url: '/:user',
            //     templateUrl: 'js/modules/profile/profile.html',
            //     controller: 'profileCtrl',
            //     controllerAs: 'profile'
            // });
    });
})();
