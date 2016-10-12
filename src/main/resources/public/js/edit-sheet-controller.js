
savageRiftsApp.controller('editSheetController', function(JwtData, $scope, $http, $window, $routeParams, $location) {

    $scope.message = '';

    $scope.sheet = null;

    // lookup the character
    $http({method:'GET',
           url: '/api/sheet/' + $routeParams.sheetId + '/',
           headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.sheet = response.data;

        JwtData.redirectToCreationSteps($scope.sheet);

    }, function errorCallback(response) {
        $scope.message = "error loading sheet";
        console.log(response);
        $location.path('/error');
    });


    $scope.save = function() {
        $http.patch('/api/sheet/' + $routeParams.sheetId + '/',
            $scope.sheet,
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }
        )
        .then(function successCallback(response) {
            $scope.message = 'saved';
            $scope.sheet = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
    };

});