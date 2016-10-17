
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

	$scope.decAttribute = function(attribute) {
	    console.log('dec ' + attribute);

        $http.put('/api/sheet/' + $routeParams.sheetId + '/attributes/',
            { 'attribute': attribute, 'operation': 'DEC' },       // data
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        )
        .then(function successCallback(response) {
            $scope.attributes = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}
	$scope.incAttribute = function(attribute) {
        console.log('inc ' + attribute);

        $http.put('/api/sheet/' + $routeParams.sheetId + '/attributes/',
            { 'attribute': attribute, 'operation': 'INC' },       // data
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