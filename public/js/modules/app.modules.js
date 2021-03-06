(function() {

    console.log("Loading main app...");

    angular
        .module('app', [
            // Angular modules.
            'ui.router',
            'ngtimeago',

            // Custom modules.
            // 'app.common',
            'app.home',
            'app.greeting',
            'app.link',
            'app.router',
            'app.post',
            'app.register',
            'app.login',
            'app.profile',
        ]);
})();

// as soon as page loads, the route makes an ajax request to a route that only says if the user is logged in or not.
// add csurf in the json response.
