
savageRiftsApp.controller('skillBuyController', function($scope, $routeParams, $location, $log, APIService) {
	$scope.skillResponse = {};

    APIService.getSheetSkills($routeParams.sheetId, function(response) {
        $scope.skillResponse = response.data;
    });

	$scope.decSkill = function(skill) {
	    $log.debug('dec ' + skill);

        APIService.changeSkill($routeParams.sheetId,
            {'skill': skill, 'operation': 'DEC'},
            function(response) {
                $scope.skillResponse = response.data;
            }
        );
	}
	$scope.incSkill = function(skill) {
        $log.debug('inc ' + skill);

        APIService.changeSkill($routeParams.sheetId,
            {'skill': skill, 'operation': 'INC'},
            function(response) {
                $scope.skillResponse = response.data;
            }
        );
	}

	$scope.finalize = function() {
	    APIService.finalizeSkillBuy($routeParams.sheetId, function successCallback(response) {
            $location.path("/editsheet/" + $routeParams.sheetId);
        });
	}

});