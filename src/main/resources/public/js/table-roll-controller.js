
savageRiftsApp.controller('tableRollController', function(SheetService, $scope, $http, $window, $routeParams, $location) {

    $scope.sheet = null;
	$scope.benefitTable = null;
	$scope.selectedPerk = null;
	
    // lookup the benefit table to make the roll on
    $http({method:'GET',
           url: '/api/benefittable/' + $routeParams.tableId + '/' + $routeParams.sheetId + '/',
           headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.benefitTable = response.data;
    }, function errorCallback(response) {
        $scope.message = "error loading table";
        console.log(response);
        $location.path('/error');
    });

    // get the sheet
    $http.get('/api/sheet/' + $routeParams.sheetId + '/',
        { headers: {'x-access-token': $window.localStorage['jwtToken']} }
    )
    .then(function successCallback(response) {
        $scope.sheet = response.data;
    }, function errorCallback(response) {
        console.log(response);
        $location.path('/error');
    });

	$scope.roll = function() {
		$http({method:'POST',
			   url: '/api/sheet/' + $routeParams.sheetId + '/tableroll/' + $routeParams.tableId + '/' + $routeParams.rollId + '/',
			   headers: {'x-access-token': $window.localStorage['jwtToken']}
		})
		.then(function successCallback(response) {
			$scope.selectedPerk = response.data.perkSelection;
			$scope.sheet = response.data.sheet;
		}, function errorCallback(response) {
			$scope.message = "error loading table";
			console.log(response);
			$location.path('/error');
		});
	}
	
    $scope.goBack = function() {
        SheetService.redirectToCreationSteps($scope.sheet);
    }

});