
savageRiftsApp.controller('edgeBuyController', function(APIService, $scope, $routeParams, $location) {
	$scope.sheet = null;

    APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
    });

	if ($routeParams.purchaseType == 'edge') {
	    APIService.getEdges(function(response) {
            $scope.edges = response.data;
        });
	}
	else if ($routeParams.purchaseType == 'attr') {
	    APIService.getSheetAttributes($routeParams.sheetId, function(response) {
            $scope.attrs = response.data;
        });
	}
	else if ($routeParams.purchaseType == 'skill') {
        APIService.getSheetSkills($routeParams.sheetId, function(response) {
            $scope.skills = response.data;
        });
	}

	$scope.back = function() {
	    $location.path('/edgebuy/' + $routeParams.sheetId);
	}

});