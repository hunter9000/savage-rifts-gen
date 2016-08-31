
savageRiftsApp.controller('usersController', function($scope, $window, $http, $location) {

    $scope.users = [];

    $http.get('/api/users/', {
        headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.users = response.data;
    }, function errorCallback(response) {
        console.log('error getting roles');
        $location.path('/error');
    });

    $scope.edit = function(userId) {
        $location.path('/edituser/'+userId);
    }

    $scope.delete = function() {

    }

});
