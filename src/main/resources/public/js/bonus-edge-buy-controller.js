
savageRiftsApp.controller('bonusEdgeBuyController', function(APIService, $scope, $routeParams, $location) {
	$scope.sheet = null;
	$scope.bonusOptions = null;

    APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
    });

	// if ($routeParams.purchaseType == 'edge') {
	    APIService.getBonusOptions(function(response) {
            $scope.bonusOptions = response.data;
        });
	// }
	// else if ($routeParams.purchaseType == 'attr') {
	    // APIService.getSheetAttributes($routeParams.sheetId, function(response) {
            // $scope.attrs = response.data;
        // });
	// }
	// else if ($routeParams.purchaseType == 'skill') {
        // APIService.getSheetSkills($routeParams.sheetId, function(response) {
            // $scope.skills = response.data;
        // });
	// }

	$scope.purchaseEdge = function(edge) {
		APIService.purchaseEdge(edge);
	}
	// $scope.purchaseSkill = function(skill) {
		
	// }
	// $scope.purchaseAttr = function(attr) {
		
	// }
	
	
	$scope.back = function() {
	    $location.path('/bonusbuy/' + $routeParams.sheetId);
	}

});