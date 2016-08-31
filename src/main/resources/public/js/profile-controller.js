

sampleApp.controller('profileController', function($scope, $http, $routeParams, $window, $location){
	$scope.user = {};

    $scope.roles = [];

	$http.get('/api/profile/',
	    { headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
	.then(function successCallback(response) {
        $scope.user = response.data;
    }, function errorCallback(response) {
        console.log(response);
        $location.path('/error');
    });

    $scope.save = function() {
        $http.put('/api/profile/',
            $scope.user,
            { headers: {'x-access-token': $window.localStorage['jwtToken']}
        })
        .then(function successCallback(response) {
            $scope.user = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
    }

});