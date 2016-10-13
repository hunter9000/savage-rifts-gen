
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

		// make a call to /charactersheet/pointbuy/dec/{stat}
//        $http.put('/api/charactersheet/' + $routeParams.charId + '/pointbuy/',
//            { 'stat': stat, 'operation': 'DEC' },       // data
//            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
//        )
//        .then(function successCallback(response) {
//            $scope.data = response.data;
//        }, function errorCallback(response) {
//            console.log(response);
//            $location.path('/error');
//        });
	}
	$scope.incStat = function(stat) {
        console.log('inc ' + stat);

		// make a call to /charactersheet/pointbuy/inc/{stat}
//        $http.put('/api/charactersheet/' + $routeParams.charId + '/pointbuy/',
//            { 'stat': stat, 'operation': 'INC' },       // data
//            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
//        )
//        .then(function successCallback(response) {
//            $scope.data = response.data;
//        }, function errorCallback(response) {
//            console.log(response);
//            $location.path('/error');
//        });
	}

	$scope.finalize = function() {
        $http.post('/api/charactersheet/' + $routeParams.charId + '/pointbuy/',
            {},       // data
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        )
        .then(function successCallback(response) {
            console.log(response.data);
            if (response.data) {
                $location.path("/editchar/" + $routeParams.charId);
            }
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}
	
});