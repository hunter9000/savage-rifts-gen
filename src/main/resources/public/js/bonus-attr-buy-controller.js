
savageRiftsApp.controller('bonusAttrBuyController', function(APIService, $scope, $routeParams, $location) {
	/*$scope.sheet = null;*/
	$scope.attrs = null;
	
    /*APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
    });
	*/

	APIService.getSheetAttributes($routeParams.sheetId, function(response) {
		$scope.attrs = response.data;
	});
	
	$scope.purchase = function(attr) {
		console.log('purchasing ' + attr);
        var attributeRaiseData = {
            attribute: attr,
            operation: 'INC'
        };
        APIService.purchaseAttributeRaise($routeParams.sheetId, attributeRaiseData, function() {
            $scope.back();
        });
	}
		
	$scope.back = function() {
	    $location.path('/bonusbuy/' + $routeParams.sheetId);
	}

});