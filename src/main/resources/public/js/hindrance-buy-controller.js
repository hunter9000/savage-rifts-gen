
savageRiftsApp.controller('hindranceBuyController', function($scope, $http, $window, $routeParams, $location) {
	$scope.hindrances = [];
	$scope.sheetHindranceSelections = null;
	
	$http.get('/api/sheet/'+ $routeParams.sheetId +'/hindrances/',
		{ headers: {'x-access-token': $window.localStorage['jwtToken']} } )
	.then(function successCallback(response) {
		console.log('got skills');
		console.log(response.data);
		$scope.sheetHindranceSelections = response.data;
	}, function errorCallback(response) {
		console.log(response);
		$location.path('/error');
	});

	$http.get('/api/hindrance/',
		{ headers: {'x-access-token': $window.localStorage['jwtToken']} } )
	.then(function successCallback(response) {
		console.log('got hindrances');
		console.log(response.data);
		$scope.hindrances = response.data;
	}, function errorCallback(response) {
		console.log(response);
		$location.path('/error');
	});
	
//	$scope.decSkill = function(skill) {
//	    console.log('dec ' + skill);
//
//        $http.put('/api/sheet/' + $routeParams.sheetId + '/hindrances/',
//            { 'skill': skill, 'operation': 'DEC' },       // data
//            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
//        )
//        .then(function successCallback(response) {
//            $scope.skills = response.data;
//        }, function errorCallback(response) {
//            console.log(response);
//            $location.path('/error');
//        });
//	}
//	$scope.incSkill = function(skill) {
//        console.log('inc ' + skill);
//
//        $http.put('/api/sheet/' + $routeParams.sheetId + '/hindrances/',
//            { 'skill': skill, 'operation': 'INC' },       // data
//            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
//        )
//        .then(function successCallback(response) {
//            $scope.skills = response.data;
//        }, function errorCallback(response) {
//            console.log(response);
//            $location.path('/error');
//        });
//	}
//
//	$scope.finalize = function() {
//        $http.post('/api/sheet/' + $routeParams.sheetId + '/hindrances/',
//            {},       // data
//            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
//        )
//        .then(function successCallback(response) {
//            console.log(response.data);
//            $location.path("/editsheet/" + $routeParams.sheetId);
//        }, function errorCallback(response) {
//            console.log(response);
//            $location.path('/error');
//        });
//	}

});