
savageRiftsApp.controller('tableRollSwapController', function($scope, $http, $window, $routeParams, $location) {

    $scope.sheet = null;
    $scope.benefitTables = null;            // all the tables
    $scope.perkItems = [];                  // the chosen perks to swap: Perk[]
    $scope.selectedTableId = null;            // the table to choose from
    $scope.swapTable = null;                // the BenefitTable that the new selection is to be made from
    $scope.newPerkSelection = null;         // the selected new perk: Perk

    // get the sheet
    $http.get('/api/sheet/' + $routeParams.sheetId + '/',
        { headers: {'x-access-token': $window.localStorage['jwtToken']} }
    )
    .then(function successCallback(response) {
        $scope.sheet = response.data;
        $scope.remainingSwaps = $scope.numberOfSwapsRemaining($scope.sheet);
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

    $scope.numberOfSwapsRemaining = function(sheet) {
        var count = 0;
        for (i=0; i<sheet.chosenPerks.length; i++) {
            if (!sheet.chosenPerks[i].wasSwappedFor) {
                count++;
            }
        }
        return Math.floor(count/2);
    }

    $scope.swap = function() {
        if ($scope.perkItems.length == 2 && $scope.selectedTableId) {
            var perkId1 = $scope.perkItems[0].perk.id;
            var perkId2 = $scope.perkItems[1].perk.id;
            var tableId = $scope.selectedTableId;

            $http.get('/api/benefittable/'+ tableId +'/'+ $routeParams.sheetId +'/',
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

		if (!$scope.newPerkSelection) {
		    return;
		}

        var postData = {
            'perkSelection1' : $scope.perkItems[0].perk,
            'perkSelection2' : $scope.perkItems[1].perk,
            'swapPerk' : $scope.newPerkSelection
        }

        $http.put('/api/sheet/' + $routeParams.sheetId + '/tablerollswap/',
            postData,
            { headers: {'x-access-token': $window.localStorage['jwtToken']} })
        .then(function successCallback(response) {
            $location.path('/editsheet/' + $routeParams.sheetId);
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
    }

	$scope.finishSwapping = function() {
		// post to set flag true, go to editsheet
		console.log($scope.perkItems);
		console.log($scope.selectedTableId);

        $http.post('/api/sheet/' + $routeParams.sheetId + '/tablerollswap/',
            {},
            { headers: {'x-access-token': $window.localStorage['jwtToken']} })
        .then(function successCallback(response) {
            $location.path('/editsheet/' + $routeParams.sheetId);
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
	}

    $scope.back = function() {
        $scope.swapTable = null;
    }

});