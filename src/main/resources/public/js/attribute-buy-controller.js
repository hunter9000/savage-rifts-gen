
savageRiftsApp.controller('attributeBuyController', function(APIService, SheetService, $scope, $routeParams, $location, $log) {
	$scope.attributes = [];

	APIService.getSheetAttributes($routeParams.sheetId, function(response) {
		$scope.attributes = response.data;
	});

	$scope.decAttribute = function(attribute) {
	    $log.debug('dec ' + attribute);

        APIService.changeAttribute($routeParams.sheetId,
            {'attribute': attribute, 'operation': 'DEC'},
            function(response) {
                $scope.attributes = response.data;
            }
        );
	}
	$scope.incAttribute = function(attribute) {
        $log.debug('inc ' + attribute);

        APIService.changeAttribute($routeParams.sheetId,
            {'attribute': attribute, 'operation': 'INC'},
            function(response) {
                $scope.attributes = response.data;
            }
        );
	}

	$scope.finalize = function() {
	    APIService.finalizeAttributeBuy($routeParams.sheetId, function(response) {
//            $location.path("/editsheet/" + $routeParams.sheetId);
            SheetService.redirectToCreationStepsFromId($routeParams.sheetId);
	    });
	}
	
});