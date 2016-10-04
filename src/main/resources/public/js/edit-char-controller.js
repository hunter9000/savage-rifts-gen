
savageRiftsApp.controller('editCharController', function(JwtData, $scope, $http, $window, $routeParams, $location) {

    $scope.message = '';

    $scope.char = null;

    // lookup the character
    $http({method:'GET',
           url: '/api/sheet/' + $routeParams.charId + '/',
           headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.char = response.data;

        $scope.redirectToCreationSteps();

    }, function errorCallback(response) {
        $scope.message = "error loading sheet";
        console.log(response);
        $location.path('/error');
    });


    $scope.save = function() {
        $http.patch('/api/sheet/' + $routeParams.charId + '/',
            $scope.char,
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }
        )
        .then(function successCallback(response) {
            $scope.message = 'saved';
            $scope.char = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
    };

    /** redirects the user to the correct page depending on what phase of character creation you're on */
    $scope.redirectToCreationSteps = function() {
		JwtData.redirectToCreationSteps($scope.char);
    }


});