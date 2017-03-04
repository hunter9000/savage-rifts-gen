
savageRiftsApp.controller('bonusSkillBuyController', function(APIService, $scope, $routeParams, $location) {
	$scope.skills = null;

    APIService.getSheetSkills($routeParams.sheetId, function(response) {
        $scope.skills = response.data;
    });

	$scope.purchaseSkill = function(skill) {
        var skillRaiseData = {
            'skill': skill,
            'skillKnowledge': '',
            'operation': 'INC'
        };
        APIService.purchaseSkillRaise($routeParams.sheetId, skillRaiseData, function() {
            $scope.back();
        });
	}

	$scope.back = function() {
	    $location.path('/bonusbuy/' + $routeParams.sheetId);
	}

});