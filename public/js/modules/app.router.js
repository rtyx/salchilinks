(function(){

    console.log("Loading router...");

    angular
    .module('app.router', ['ui.router'])
    .config(function($stateProvider, $urlRouterProvider) {

        // $urlRouterProvider.otherwise('/home');

        $stateProvider
<<<<<<< HEAD

            .state('home', {
                url: '/home',
                templateUrl: 'js/modules/home/home.html',
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
            });
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

=======
        .state('home', {
            url: '/home',
            templateUrl: 'js/modules/home/home.html',
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
            templateUrl: 'login.html',
            controller: 'loginCtrl',
            controllerAs: 'login'
        })
        .state('upload', {
            url: '/upload',
            templateUrl: 'upload.html',
            controller: 'uploadCtrl',
            controllerAs: 'upload'
        })
        .state('profile', {
            url: '/profile',
            templateUrl: 'profile.html',
            controller: 'profileCtrl',
            controllerAs: 'profile'
>>>>>>> 084c1407119ac08430c8aecb10a4aa04239b4be1
        });
    });
})();
