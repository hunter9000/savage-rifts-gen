
savageRiftsApp.controller('skillBuyController', function(APIService, SheetService, $scope, $routeParams, $location, $log) {
	$scope.skillResponse = {};

    APIService.getSheetSkills($routeParams.sheetId, function(response) {
        $scope.skillResponse = response.data;
    });

	$scope.decSkill = function(skillType) {
	    $log.debug('dec ' + skillType);

        $scope.sendSkillRequest($routeParams.sheetId, skillType, 'DEC');

//        APIService.decreaseSkill($routeParams.sheetId, skill.id, function(response) {
//            $scope.skillResponse = response.data;
//        });
	}
	$scope.incSkill = function(skillType) {
        $log.debug('inc ' + skillType);

        $scope.sendSkillRequest($routeParams.sheetId, skillType, 'INC');

//        APIService.increaseSkill($routeParams.sheetId,
//            {},
//            function(response) {
//                $scope.skillResponse = response.data;
//            }
//        );
	}

	$scope.sendSkillRequest = function(sheetId, skillType, operation) {
	    var data = {
	        'skill': skillType,
	        'skillKnowledge': null,
	        'operation': operation
	    }

        APIService.changeSkillPurchase(sheetId, data, function(response) {
            $scope.skillResponse = response.data;
        });
	}

	$scope.finalize = function() {
	    APIService.finalizeSkillBuy($routeParams.sheetId, function successCallback(response) {
//            $location.path("/editsheet/" + $routeParams.sheetId);
            SheetService.redirectToCreationStepsFromId($routeParams.sheetId);
        });
	}

});