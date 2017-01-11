
savageRiftsApp.controller('skillBuyController', function(APIService, SheetService, $scope, $routeParams, $location, $log) {
	$scope.skillResponse = {};

    $scope.reloadSkills = function() {
        APIService.getSheetSkills($routeParams.sheetId, function(response) {
            $scope.skillResponse = response.data;
        });
    }
    $scope.reloadSkills();

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
            APIService.getSheet($routeParams.sheetId, function(response) {
                SheetService.redirectToCreationSteps(response.data);
            });
        });
	}

});

savageRiftsApp.filter('startFrom', function() {
    return function(input, start) {
        if (input) {
            start = +start; //parse to int
            return input.slice(start);
        }
    }
});