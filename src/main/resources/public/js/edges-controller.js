
savageRiftsApp.controller('edgesController', function($scope, $http, $window, $routeParams, $location) {
	$scope.sheet = null;

    APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
    });

	$scope.choose = function(type) {
		$location.path('/edgebuy/' + $routeParams.sheetId + '/' + type);
	}
	
	$scope.chooseMoney = function() {
		$http.put('/api/sheet/' + $routeParams.sheetId + '/money/')
		.then();
	}

});