(function() {

    console.log("Loading main app...");

    angular
        .module('app', [
            // Angular modules.
            'ui.router',

            // Custom modules.
            'app.router',
            'app.home',
        ]);
})();
