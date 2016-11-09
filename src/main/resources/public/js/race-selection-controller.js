

savageRiftsApp.controller('raceSelectionController', function(SheetService, $scope, $http, $window, $routeParams, $location) {
	$scope.races = [];
	$scope.selectedRace = null;
	$scope.sheet = null;

    // lookup the character
    $http.get('/api/sheet/' + $routeParams.sheetId + '/',
		{headers: {'x-access-token': $window.localStorage['jwtToken']}}
    )
    .then(function successCallback(response) {
        $scope.sheet = response.data;
    }, function errorCallback(response) {
        $scope.message = "error loading sheet";
        console.log(response);
        $location.path('/error');
    });
	
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
			//$location.path('/editsheet/' + $routeParams.sheetId);
			SheetService.redirectToCreationSteps($scope.sheet);
		}, function errorCallback(response) {
			console.log(response);
			$location.path('/error');
		});
	}
	
});