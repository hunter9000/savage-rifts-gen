
sampleApp.controller('editUserController', function($scope, $window, $http, $location, $routeParams) {

    $scope.user = {};

    $scope.roles = [];

    $http.get('/api/roles/', {
        headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.roles = response.data;
    }, function errorCallback(response) {
        console.log('error getting roles');
        $location.path('/error');
    });


    $http.get('/api/users/' + $routeParams.userId + '/', {
        headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.user = response.data;
    }, function errorCallback(response) {
        console.log('error getting roles');
        $location.path('/error');
    });

    $scope.save = function() {
        $http.put('/api/users/' + $routeParams.userId + '/',
            $scope.user,
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }
        )
        .then(function successCallback(response) {
//            $scope.roles = response.data;
            $location.path('/users');
        }, function errorCallback(response) {
            console.log('error getting roles');
            $location.path('/error');
        });
    }

});