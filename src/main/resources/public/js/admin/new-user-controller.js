
sampleApp.controller('newUserController', function($scope, $window, $http, $location) {
    $scope.user = {
        roles: []
    };       // user object to build and pass to server

    // roles fetched from server
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

    $scope.save = function() {
        $http({
            method:'POST',
            url:'/api/user/',
            headers: {'x-access-token': $window.localStorage['jwtToken']},
            data: $scope.user
        })
       /* $http.post('/api/user/', {
            data: $scope.user,
            headers: {'x-access-token': $window.localStorage['jwtToken']}
        })*/
        .then(function successCallback(response) {
            $scope.message = "Success!";
        }, function errorCallback(response) {
            $scope.message = "Something went wrong";
        });
    }
});



