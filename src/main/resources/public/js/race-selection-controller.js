

savageRiftsApp.controller('raceSelectionController', function($scope, $http, $window, $routeParams, $location) {
	$scope.races = [];
	$scope.selectedRace = null;
	
	$http.get('/api/race/', 
		{ headers: {'x-access-token': $window.localStorage['jwtToken']} } )
	.then(function successCallback(response) {
		console.log('got all races');
		console.log(response.data);
		$scope.races = response.data;
	}, function errorCallback(response) {
		console.log(response);
		$location.path('/error');
	});

	$scope.selectRace = function() {
		$http.post('/api/sheet/' + $routeParams.sheetId + '/race/' + $scope.selectedRace.id + '/',
		    {},
			{ headers: {'x-access-token': $window.localStorage['jwtToken']} } )
		.then(function successCallback(response) {
			console.log('set race successfully');
			$location.path('/editsheet/' + $routeParams.sheetId);
		}, function errorCallback(response) {
			console.log(response);
			$location.path('/error');
		});
	}
	
});