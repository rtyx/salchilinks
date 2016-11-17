(function(){

    console.log("Loading router...");

    angular
    .module('app.router', ['ui.router'])
    .config(function($stateProvider, $urlRouterProvider) {

        $urlRouterProvider.otherwise('/home');

        $stateProvider

            .state('home', {
                url: '/home',
                templateUrl: 'js/modules/home/home2.html',
                controller: 'homeCtrl',
                controllerAs: 'home'
            })

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

            .state('upload', {
                url: '/upload',
                templateUrl: 'js/modules/upload/upload.html',
                controller: 'uploadCtrl',
                controllerAs: 'upload'
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
            })

            // .state('profile.user', {
            //     url: '/:user',
            //     templateUrl: 'js/modules/profile/profile.html',
            //     controller: 'profileCtrl',
            //     controllerAs: 'profile'
            // });
    });
})();
