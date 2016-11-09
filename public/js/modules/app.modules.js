(function() {

    console.log("Loading main app...");

    angular
        .module('app', [
            // Angular modules.
            'ui.router',

            // Custom modules.
            'app.router',
            'app.home',
            'app.register',
            'app.login'
        ]);
})();

// as soon as page loads, the route makes an ajax request to a route that only says if the user is logged in or not.
// add csurf in the json response.
