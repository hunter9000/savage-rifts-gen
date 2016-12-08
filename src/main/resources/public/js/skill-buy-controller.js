
savageRiftsApp.controller('skillBuyController', function($scope, $http, $window, $routeParams, $location) {
	$scope.skillResponse = {};

	$http.get('/api/sheet/'+ $routeParams.sheetId +'/skills/',
		{ headers: {'x-access-token': $window.localStorage['jwtToken']} } )
	.then(function successCallback(response) {
		console.log('got skills');
		console.log(response.data);
		$scope.skillResponse = response.data;
	}, function errorCallback(response) {
		console.log(response);
		$location.path('/error');
	});

	$scope.decSkill = function(skill) {
	    console.log('dec ' + skill);

        $http.put('/api/sheet/' + $routeParams.sheetId + '/skills/',
            { 'skill': skill, 'operation': 'DEC' },       // data
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        )
        .then(function successCallback(response) {
            $scope.skillResponse = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}
	$scope.incSkill = function(skill) {
        console.log('inc ' + skill);

        $http.put('/api/sheet/' + $routeParams.sheetId + '/skills/',
            { 'skill': skill, 'operation': 'INC' },       // data
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        )
        .then(function successCallback(response) {
            $scope.skillResponse = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}

	$scope.finalize = function() {
        $http.post('/api/sheet/' + $routeParams.sheetId + '/skills/',
            {},       // data
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        )
        .then(function successCallback(response) {
            console.log(response.data);
            $location.path("/editsheet/" + $routeParams.sheetId);
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}

});