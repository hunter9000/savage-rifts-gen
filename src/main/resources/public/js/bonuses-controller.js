
savageRiftsApp.controller('bonusesController', function(APIService, $scope, $http, $window, $routeParams, $location) {
	$scope.sheet = null;

    $scope.fetchSheet = function() {
        APIService.getSheet($routeParams.sheetId, function(response) {
            $scope.sheet = response.data;
        });
    }
    $scope.fetchSheet();

	$scope.chooseEdge = function() {
		$location.path('/bonusbuy/' + $routeParams.sheetId + '/edge');
	}
	
	$scope.chooseAttr = function() {
		$location.path('/bonusbuy/' + $routeParams.sheetId + '/attr');
	}
	
	$scope.chooseSkill = function() {
		$location.path('/bonusbuy/' + $routeParams.sheetId + '/skill');
	}
	
	$scope.chooseMoney = function() {
		$http.put('/api/sheet/' + $routeParams.sheetId + '/money/')
		.then();
	}

	$scope.removeEdge = function(edgeSelection) {
	    APIService.removeEdge($routeParams.sheetId, edgeSelection.id, function() {
	        $scope.fetchSheet();
	    });
	}

	$scope.removeAttribute = function(attributeRaise) {
	    APIService.removeAttributeRaise($routeParams.sheetId, attributeRaise.id, function() {
	        $scope.fetchSheet();
	    });
	};

    $scope.removeSkill = function(skillRaise) {
        APIService.removeSkillRaise($routeParams.sheetId, skillRaise.id, function() {
            $scope.fetchSheet();
        });
    };

    $scope.removeMoney = function() {
//        APIService.removeSkillRaise($routeParams.sheetId, skillRaise.id, function() {
//            $scope.fetchSheet();
//        });
    };
});