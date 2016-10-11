

savageRiftsApp.controller('tableRollsController', function($scope, $http, $window, $routeParams, $location) {
	$scope.races = [];
	$scope.selectedRaceId = null;
	
	$http.get('/api/race/', 
		{'x-access-token': $window.localStorage['jwtToken']} )
	.then(function successCallback(response) {
		console.log('got all races');
		$scope.races = response.data;
	}, function errorCallback(response) {
		console.log(response);
		$location.path('/error');
	});

	$scope.selectRace = function() {
		$http.post('/api/sheet/' + $routeParams.sheetId + '/race/' + $scope.selectedRaceId + '/', 
			{'x-access-token': $window.localStorage['jwtToken']} )
		.then(function successCallback(response) {
			console.log('set race successfully');
			$location.path('/editsheet/' + $routeParams.sheetId);
		}, function errorCallback(response) {
			console.log(response);
			$location.path('/error');
		});
	}
	
});