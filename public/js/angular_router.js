(function(){

    console.log("ROUTER IS HERE");

    var routerApp = angular.module('routerApp', ['ui.router']);

    routerApp.config(function($stateProvider, $urlRouterProvider) {

        // $urlRouterProvider.otherwise('/home');

        $stateProvider

            .state('home', {
                url: '/home',
                templateUrl: 'js/modules/home/home.html'
            })

            .state('register', {
                url: '/register',
                templateUrl: 'js/modules/register/register.html'
            });
            //
            // .state('login', {
            //     url: '/login',
            //     templateUrl: 'login.html'
            // });
            //
            // .state('upload', {
            //     url: '/upload',
            //     templateUrl: 'upload.html'
            // });
            //
            // .state('profile', {
            //     url: '/profile',
            //     templateUrl: 'profile.html'
            // });

    });
})();
