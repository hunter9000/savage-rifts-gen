
// create the controller and inject Angular's $scope
savageRiftsApp.controller('mainController', function($scope, $location, $window, $log, JwtService) {
    // create a message to display in our view
    $scope.message = 'main';

    $scope.logout = function() {
        $window.localStorage['jwtToken'] = null;
        $location.path('/');
    };

    $scope.isAdmin = function() {
        return JwtService.isAdmin();
    }
    $scope.isDm = function() {
        return JwtService.isDm();
    }
    $scope.isPlayer = function() {
        return JwtService.isPlayer();
    }
    $scope.getUserName = function() {
        return JwtService.getUserName();
    }

    var init = function() {
        var token = $window.localStorage['jwtToken']
        $log.debug('checking '+ token);

        if (token === 'undefined' || token === null || token == null || token == 'null') {
            $location.path('/login');
            $log.debug('redirecting');
        }
        else {
            $location.path('/sheetselect');
        }
    };
    init();
});






