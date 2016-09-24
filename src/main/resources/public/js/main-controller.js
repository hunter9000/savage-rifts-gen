
// create the controller and inject Angular's $scope
savageRiftsApp.controller('mainController', function($scope, $location, $window, JwtData) {
    // create a message to display in our view
    $scope.message = 'main';

    $scope.logout = function() {
        $window.localStorage['jwtToken'] = null;
        $location.path('/');
    };

  /*  $scope.home = function() {


        $location.path('/');
    };*/

    $scope.isAdmin = function() {
        return JwtData.isAdmin();
    }
    $scope.isDm = function() {
        return JwtData.isDm();
    }
    $scope.isPlayer = function() {
        return JwtData.isPlayer();
    }
    $scope.getUserName = function() {
        return JwtData.getUserName();
    }

    var init = function() {
        var token = $window.localStorage['jwtToken']
        console.log('checking '+ token);

        if (token === 'undefined' || token === null || token == null || token == 'null') {
            $location.path('/login');
            console.log('redirecting');
        }
        else {
            $location.path('/charselect');
        }
    };
    init();
});






