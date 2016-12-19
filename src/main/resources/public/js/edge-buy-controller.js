
savageRiftsApp.controller('edgeBuyController', function($scope, $http, $window, $routeParams, $location) {
	$scope.sheet = null;
	
	$http.get('/api/sheet/' + $routeParams.sheetId + '/',
        { headers: {'x-access-token': $window.localStorage['jwtToken']} }
    )
    .then(function successCallback(response) {
        $scope.sheet = response.data;
    }, function errorCallback(response) {
        console.log(response);
        $location.path('/error');
    });
	
	if ($routeParams.purchaseType == 'edge') {
		$http.get('/api/edge/',
		    { headers: {'x-access-token': $window.localStorage['jwtToken']} }
		)
		.then(function successCallback(response) {
		    $scope.edges = response.data;
		}, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
		});
	}
	else if ($routeParams.purchaseType == 'attr') {
        $http.get('/api/sheet/' + $routeParams.sheetId + '/attributes/',
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }
        )
        .then(function successCallback(response) {
            $scope.attrs = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}
	else if ($routeParams.purchaseType == 'skill') {
        $http.get('/api/sheet/' + $routeParams.sheetId + '/skills/',
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }
        )
        .then(function successCallback(response) {
            $scope.skills = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}

	$scope.back = function() {
	    $location.path('/edgebuy/' + $routeParams.sheetId);
	}
	
	// get sheet's hindrance selections
	// $http.get('/api/sheet/'+ $routeParams.sheetId +'/hindrances/',
		// { headers: {'x-access-token': $window.localStorage['jwtToken']} } )
	// .then(function successCallback(response) {
		// console.log('got skills');
		// console.log(response.data);
		// $scope.sheetHindranceSelections = response.data;
	// }, function errorCallback(response) {
		// console.log(response);
		// $location.path('/error');
	// });

    // get all hindrances
	// $http.get('/api/hindrance/',
		// { headers: {'x-access-token': $window.localStorage['jwtToken']} } )
	// .then(function successCallback(response) {
		// console.log('got hindrances');
		// console.log(response.data);
		// $scope.hindrances = response.data;
	// }, function errorCallback(response) {
		// console.log(response);
		// $location.path('/error');
	// });
	
	// $scope.addHindrance = function(hindrance, severityType) {
	    // console.log('add ' + hindrance);
        // $http.put('/api/sheet/' + $routeParams.sheetId + '/hindrances/',
            // { 'hindranceType': hindrance.type, 'severityType': severityType, 'operation': 'ADD' },       // data
            // { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        // )
        // .then(function successCallback(response) {
            // $scope.sheetHindranceSelections = response.data;
        // }, function errorCallback(response) {
            // console.log(response);
            // $location.path('/error');
        // });
	// }

	// $scope.removeHindrance = function(hindrance) {
	    // console.log('add ' + hindrance);
        // $http.put('/api/sheet/' + $routeParams.sheetId + '/hindrances/',
            // { 'hindranceType': hindrance.type, 'severityType': null, 'operation': 'REMOVE' },       // data
            // { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        // )
        // .then(function successCallback(response) {
            // $scope.sheetHindranceSelections = response.data;
        // }, function errorCallback(response) {
            // console.log(response);
            // $location.path('/error');
        // });
	// }

    // $scope.canSelectMajor = function(hindrance) {
        // return (hindrance.major && $scope.sheetHindranceSelections.numMajorSelections > 0);
    // }

    // $scope.canSelectMinor = function(hindrance) {
        // return (hindrance.minor && $scope.sheetHindranceSelections.numMinorSelections > 0);
    // }


	// $scope.finishHindrances = function() {
        // $http.post('/api/sheet/' + $routeParams.sheetId + '/hindrances/',
            // {},       // data
            // { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
        // )
        // .then(function successCallback(response) {
            // console.log(response.data);
            // $location.path("/editsheet/" + $routeParams.sheetId);
        // }, function errorCallback(response) {
            // console.log(response);
            // $location.path('/error');
        // });
	// }

});