
savageRiftsApp.controller('bonusAttrBuyController', function(APIService, $scope, $routeParams, $location) {
	/*$scope.sheet = null;*/
	$scope.attrs = null;
	
    /*APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
    });
	*/

	// if ($routeParams.purchaseType == 'edge') {
	    // APIService.getEdges(function(response) {
            // $scope.edges = response.data;
        // });
	// }
	// else if ($routeParams.purchaseType == 'attr') {
	    APIService.getSheetAttributes($routeParams.sheetId, function(response) {
            $scope.attrs = response.data;
        });
	// }
	// else if ($routeParams.purchaseType == 'skill') {
        // APIService.getSheetSkills($routeParams.sheetId, function(response) {
            // $scope.skills = response.data;
        // });
	// }

	// $scope.purchaseEdge = function(edge) {
		// APIService.purchaseEdge(edge);
	// }
	// $scope.purchaseSkill = function(skill) {
		
	// }
	$scope.purchase = function(attr) {
		console.log('purchasing ' + attr);
	}
	
	
	$scope.back = function() {
	    $location.path('/edgebuy/' + $routeParams.sheetId);
	}

});