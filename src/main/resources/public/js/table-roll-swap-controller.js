
savageRiftsApp.controller('tableRollSwapController', function($scope, $http, $window, $routeParams, $location) {

    $scope.sheet = null;
    $scope.benefitTables = null;            // all the tables
    $scope.perkItems = [];                  // the chosen perks to swap: Perk[]
    $scope.selectedTable = null;            // the table to choose from
    $scope.swapTable = null;                // the BenefitTable that the new selection is to be made from
    $scope.newPerkSelection = null;         // the selected new perk: Perk

    // get the sheet
    $http.get('/api/sheet/' + $routeParams.charId + '/',
        { headers: {'x-access-token': $window.localStorage['jwtToken']} }
    )
    .then(function successCallback(response) {
        $scope.sheet = response.data;
    }, function errorCallback(response) {
        console.log(response);
        $location.path('/error');
    });

    // get the selectable table rolls
    $http.get('/api/benefittable/',
        { headers: {'x-access-token': $window.localStorage['jwtToken']} }
    )
    .then(function successCallback(response) {
        $scope.benefitTables = response.data;
    }, function errorCallback(response) {
        console.log(response);
        $location.path('/error');
    });

    $scope.swap = function() {
        if ($scope.perkItems.length == 2 && $scope.selectedTable) {
            var perkId1 = $scope.perkItems[0].perk.id;
            var perkId2 = $scope.perkItems[1].perk.id;
            var tableId = $scope.selectedTable.id;
//            $location.path('/tablerollswap/' + $routeParams.charId + '/' + perkId1 + '/' + perkId2 + '/' + tableId);

            $http.get('/api/benefittable/'+ tableId +'/'+ $routeParams.charId +'/',
                { headers: {'x-access-token': $window.localStorage['jwtToken']} }
            )
            .then(function successCallback(response) {
                $scope.swapTable = response.data;
            }, function errorCallback(response) {
                console.log(response);
                $location.path('/error');
            });
        }
        else {
            console.log('invalid selection');
        }
    }

    $scope.confirmSwap = function() {
        console.log('confirm swap');
        console.log($scope.newPerkSelection);
		
		
    }

	$scope.finishSwapping = function() {
		// post to set flag true, go to editchar
		console.log($scope.perkItems);
		console.log($scope.selectedTable);
	}

    $scope.back = function() {
        $scope.swapTable = null;
    }

});