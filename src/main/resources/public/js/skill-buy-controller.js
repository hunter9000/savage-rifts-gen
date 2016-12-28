
savageRiftsApp.controller('skillBuyController', function($scope, $http, $window, $routeParams, $location, APIService) {
	$scope.skillResponse = {};

    APIService.getSheetSkills($routeParams.sheetId, function(response) {
        console.log('got skills:');
        console.log(response.data);
        $scope.skillResponse = response.data;
    });

	$scope.decSkill = function(skill) {
	    console.log('dec ' + skill);

        APIService.changeSkill($routeParams.sheetId,
            {'skill': skill, 'operation': 'DEC'},
            function(response) {
                $scope.skillResponse = response.data;
            }
        );
	}
	$scope.incSkill = function(skill) {
        console.log('inc ' + skill);

        APIService.changeSkill($routeParams.sheetId,
            {'skill': skill, 'operation': 'INC'},
            function(response) {
                $scope.skillResponse = response.data;
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