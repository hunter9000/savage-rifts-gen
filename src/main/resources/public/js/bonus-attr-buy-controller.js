
savageRiftsApp.controller('bonusAttrBuyController', function(APIService, $scope, $routeParams, $location) {
	$scope.attrs = null;
	
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