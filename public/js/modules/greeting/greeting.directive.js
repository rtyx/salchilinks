angular.module('app.greeting')
.directive('greeting', function() {
    console.log("Greeting directive running...");
    return {
        restrict: 'E',
        replace: true,
        templateUrl: 'js/modules/greeting/greeting.html',
        controller: 'greetingCtrl',
        controllerAs: 'greeting'
    };
});
