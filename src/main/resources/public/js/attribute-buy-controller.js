
savageRiftsApp.controller('attributeBuyController', function($scope, $http, $window, $routeParams, $location) {
	$scope.attributes = [];
	
	$http.get('/api/sheet/'+ $routeParams.sheetId +'/attributes/',
		{ headers: {'x-access-token': $window.localStorage['jwtToken']} } )
	.then(function successCallback(response) {
		console.log('got attributes');
		console.log(response.data);
		$scope.attributes = response.data;
	}, function errorCallback(response) {
		console.log(response);
		$location.path('/error');
	});

	$scope.decStat = function(stat) {
	    console.log('dec ' + stat);

        $http.put('/api/sheet/' + $routeParams.sheetId + '/attributes/',
            { 'stat': stat, 'operation': 'DEC' },       // data
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        )
        .then(function successCallback(response) {
            $scope.attributes = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}
	$scope.incStat = function(stat) {
        console.log('inc ' + stat);

        $http.put('/api/sheet/' + $routeParams.sheetId + '/attributes/',
            { 'stat': stat, 'operation': 'INC' },       // data
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        )
        .then(function successCallback(response) {
            $scope.attributes = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}

	$scope.finalize = function() {
        $http.post('/api/sheet/' + $routeParams.sheetId + '/attributes/',
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