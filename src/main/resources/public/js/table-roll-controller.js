
savageRiftsApp.controller('tableRollController', function($scope, $http, $window, $routeParams, $location) {

    $scope.charId = $routeParams.charId;
    $scope.rollId = $routeParams.rollId;
    $scope.tableId = $routeParams.tableId;

	$scope.benefitTable = null;
	
    // lookup the sheet
    $http({method:'GET',
           url: '/api/benefittable/' + $routeParams.tableId + '/' + $routeParams.charId + '/',
           headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.benefitTable = response.data;
    }, function errorCallback(response) {
        $scope.message = "error loading table";
        console.log(response);
        $location.path('/error');
    });
	
	$scope.roll = function() {
		$http({method:'POST',
			   url: '/api/sheet/' + $routeParams.charId + '/tableroll/' + $routeParams.tableId + '/' + $routeParams.rollId + '/',
			   headers: {'x-access-token': $window.localStorage['jwtToken']}
		})
		.then(function successCallback(response) {
			$scope.selectedPerk = response.data;
		}, function errorCallback(response) {
			$scope.message = "error loading table";
			console.log(response);
			$location.path('/error');
		});
	}
	
    $scope.goBack = function() {
        $location.path('/tablerolls/' + $routeParams.charId);
    }


//    $scope.message = '';
//
//    $scope.sheet = null;
//    $scope.benefitTables = null;        // all the
//    $scope.choosableTables = null;      // the table rolls that the player can choose from
//
//    // lookup the sheet
//    $http({method:'GET',
//           url: '/api/sheet/' + $routeParams.charId + '/',
//           headers: {'x-access-token': $window.localStorage['jwtToken']}
//    })
//    .then(function successCallback(response) {
//        $scope.sheet = response.data;
//    }, function errorCallback(response) {
//        $scope.message = "error loading sheet";
//        console.log(response);
//        $location.path('/error');
//    });
//
//    // get the selectable table rolls
//    $http.get('/api/benefittable/',
//        { headers: {'x-access-token': $window.localStorage['jwtToken']} }
//    )
//    .then(function successCallback(response) {
//        $scope.benefitTables = response.data;
//    }, function errorCallback(response) {
//        console.log(response);
//        $location.path('/error');
//    });
//
//    // get the tables
//    $http.get('/api/sheet/'+ $routeParams.charId +'/tableroll/',
//        { headers: {'x-access-token': $window.localStorage['jwtToken']} }
//    )
//    .then(function successCallback(response) {
//        $scope.choosableTables = response.data;
//    }, function errorCallback(response) {
//        console.log(response);
//        $location.path('/error');
//    });
//
//
//    $scope.save = function() {
//        $http.patch('/api/sheet/' + $routeParams.charId + '/',
//            $scope.sheet,
//            { headers: {'x-access-token': $window.localStorage['jwtToken']} }
//        )
//        .then(function successCallback(response) {
//            $scope.message = 'saved';
//            $scope.sheet = response.data;
//        }, function errorCallback(response) {
//            console.log(response);
//            $location.path('/error');
//        });
//    };
//
//    $scope.goToTable = function (rollId, tableId) {
//        $location.path('/tablerolls/' + $routeParams.charId + '/' + rollId + '/' + tableId);
//    }

});