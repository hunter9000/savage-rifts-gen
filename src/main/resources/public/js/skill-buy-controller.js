
savageRiftsApp.controller('skillBuyController', function(APIService, $scope, $routeParams, $location) {
	$scope.skills = [];

    APIService.getSheetSkills($routeParams.sheetId, function(response) {
        console.log('got skills');
        console.log(response.data);
        $scope.skills = response.data;
    });

	$scope.decSkill = function(skill) {
	    console.log('dec ' + skill);

        APIService.changeSkill($routeParams.sheetId,
            {'skill': skill, 'operation': 'DEC'},
            function(response) {
                $scope.skills = response.data;
            }
        );
	}
	$scope.incSkill = function(skill) {
        console.log('inc ' + skill);

        APIService.changeSkill($routeParams.sheetId,
            {'skill': skill, 'operation': 'INC'},
            function(response) {
                $scope.skills = response.data;
            }
        );
	}

	$scope.finalize = function() {
	    APIService.finalizeSkillBuy($routeParams.sheetId, function successCallback(response) {
            console.log(response.data);
            $location.path("/editsheet/" + $routeParams.sheetId);
        });
	}

});