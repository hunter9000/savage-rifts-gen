
savageRiftsApp.controller('bonusesController', function($scope, $http, $window, $routeParams, $location) {
	$scope.sheet = null;

    APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
    });

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

});