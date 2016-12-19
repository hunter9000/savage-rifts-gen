
savageRiftsApp.controller('attributeBuyController', function(APIService, $scope, $routeParams, $location) {
	$scope.attributes = [];

	APIService.getSheetAttributes($routeParams.sheetId, function(response) {
		console.log('got attributes');
		console.log(response.data);
		$scope.attributes = response.data;
	});

	$scope.decAttribute = function(attribute) {
	    console.log('dec ' + attribute);

        APIService.changeAttribute($routeParams.sheetId,
            {'attribute': attribute, 'operation': 'DEC'},
            function(response) {
                $scope.attributes = response.data;
            }
        );
	}
	$scope.incAttribute = function(attribute) {
        console.log('inc ' + attribute);

        APIService.changeAttribute($routeParams.sheetId,
            {'attribute': attribute, 'operation': 'INC'},
            function(response) {
                $scope.attributes = response.data;
            }
        );
	}

	$scope.finalize = function() {
	    APIService.finalizeAttributeBuy($routeParams.sheetId, function(response) {
	        console.log(response.data);
            $location.path("/editsheet/" + $routeParams.sheetId);
	    });
	}
	
});