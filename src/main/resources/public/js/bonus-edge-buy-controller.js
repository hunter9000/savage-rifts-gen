
savageRiftsApp.controller('bonusEdgeBuyController', function(APIService, $scope, $routeParams, $location) {
	$scope.sheet = null;
	$scope.edgeOptions = null;		// array of Edge

    APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
    });

    APIService.getEdgeOptions($routeParams.sheetId, function(response) {
        $scope.edgeOptions = response.data;
    });

	$scope.purchaseEdge = function(edge) {
		APIService.purchaseEdge($routeParams.sheetId, edge.id, function() {
		    $scope.back();
		});
	}

	$scope.back = function() {
	    $location.path('/bonusbuy/' + $routeParams.sheetId);
	}

});