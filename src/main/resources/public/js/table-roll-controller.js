
savageRiftsApp.controller('tableRollController', function(JwtData, $scope, $http, $window, $routeParams, $location) {

    $scope.sheet = null;
	$scope.benefitTable = null;
	$scope.selectedPerk = null;
	
    // lookup the benefit table to make the roll on
    $http({method:'GET',
           url: '/api/benefittable/' + $routeParams.tableId + '/' + $routeParams.charId + '/',
           headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.benefitTable = response.data;
    }, function errorCallback(response) {
        $scope.message = "error loading table";
        console.log(response);
        $location.path('/error');
    });

	$scope.roll = function() {
		$http({method:'POST',
			   url: '/api/sheet/' + $routeParams.charId + '/tableroll/' + $routeParams.tableId + '/' + $routeParams.rollId + '/',
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
        JwtData.redirectToCreationSteps($scope.sheet);
    }

});