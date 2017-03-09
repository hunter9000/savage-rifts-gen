
savageRiftsApp.controller('skillBuyController', function(APIService, SheetService, $scope, $routeParams, $location, $log) {
	$scope.skillResponse = {};

    APIService.getSheetSkills($routeParams.sheetId, function(response) {
        $scope.skillResponse = response.data;
    });

	$scope.decSkill = function(skill) {
	    $log.debug('dec ' + skill);

        APIService.decreaseSkill($routeParams.sheetId, skill.id, function(response) {
            $scope.skillResponse = response.data;
        });
	}
	$scope.incSkill = function(skill) {
        $log.debug('inc ' + skill);

        APIService.increaseSkill($routeParams.sheetId,
            {'skill': skill},
            function(response) {
                $scope.skillResponse = response.data;
            }
        );
	}

	$scope.finalize = function() {
	    APIService.finalizeSkillBuy($routeParams.sheetId, function successCallback(response) {
//            $location.path("/editsheet/" + $routeParams.sheetId);
            SheetService.redirectToCreationStepsFromId($routeParams.sheetId);
        });
	}

});