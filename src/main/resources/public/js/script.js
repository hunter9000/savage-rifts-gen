// create the module and name it scotchApp
var savageRiftsApp = angular.module('savageRiftsApp', ['ngRoute', 'ui.bootstrap', 'checklist-model', 'ngMaterial']);

// configure our routes
savageRiftsApp.config(function($routeProvider) {
    $routeProvider
        // route for the home page
        // main-controller.js
        .when('/', {
            templateUrl : 'pages/home.html',
            controller  : 'mainController'
        })
        // route for the login page
        // login-controller.js
        .when('/login', {
            templateUrl : 'pages/login.html',
            controller  : 'loginController'
        })

        // USERS #######
        // admin/new-user-controller.js
        .when('/newuser', {
            templateUrl : 'pages/admin/newuser.html',
            controller  : 'newUserController'
        })
        // admin/users-controller.js
        .when('/users', {
            templateUrl : 'pages/admin/users.html',
            controller  : 'usersController'
        })
        // admin/edit-user-controller.js
        .when('/edituser/:userId', {
            templateUrl: 'pages/admin/edituser.html',
            controller: 'editUserController'
        })
        // profile-controller.js
        .when('/profile', {
            templateUrl : 'pages/profile.html',
            controller  : 'profileController'
        })

        .when('/sheetselect', {
            templateUrl : 'pages/sheetselect.html',
            controller : 'sheetSelectController'
        })

        .when('/newsheet', {
            templateUrl : 'pages/newsheet.html',
            controller  : 'newSheetController'
        })
        .when('/editsheet/:sheetId', {
            templateUrl : 'pages/editsheet.html',
            controller  : 'editSheetController'
        })


        .when('/tablerolls/:sheetId', {
            templateUrl : 'pages/tablerolls.html',
            controller  : 'tableRollsController'
        })
        .when('/tablerolls/:sheetId/:rollId/:tableId', {
            templateUrl : 'pages/tableroll.html',
            controller  : 'tableRollController'
        })
		
		.when('/tablerollswap/:sheetId', {
			templateUrl : 'pages/tablerollswap.html',
			controller  : 'tableRollSwapController'
		})

        .when('/raceselection/:sheetId', {
            templateUrl: 'pages/raceselection.html',
            controller:  'raceSelectionController'
        })

		.when('/attributebuy/:sheetId', {
			templateUrl: 'pages/attributebuy.html',
			controller : 'attributeBuyController'
		})

        .when('/skillbuy/:sheetId', {
            templateUrl: 'pages/skillbuy.html',
            controller : 'skillBuyController'
        })
		
		.when('/hindrancebuy/:sheetId', {
            templateUrl: 'pages/hindrancebuy.html',
            controller : 'hindranceBuyController'
        })
		
		.when('/edgebuy/:sheetId', {
			templateUrl: 'pages/edges.html',
			controller : 'edgesController'
		})
		.when('/edgebuy/:sheetId/:purchaseType', {
			templateUrl: 'pages/edgebuy.html',
			controller : 'edgeBuyController'
		})
		
        // generic error page
        .when('/error', {
            templateUrl: 'pages/error.html',
            controller: 'errorController'
        })
        .otherwise({redirectTo:'/'});
        ;
});
