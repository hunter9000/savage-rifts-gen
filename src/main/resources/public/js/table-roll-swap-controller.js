
savageRiftsApp.controller('tableRollSwapController', function(APIService, $scope, $routeParams, $location) {

    $scope.sheet = null;
    $scope.benefitTables = null;            // all the tables
    $scope.perkItems = [];                  // the chosen perks to swap: Perk[]
    $scope.selectedTableId = null;            // the table to choose from
    $scope.swapTable = null;                // the BenefitTable that the new selection is to be made from
    $scope.newPerkSelection = null;         // the selected new perk: Perk

    // get the sheet
    APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
        $scope.remainingSwaps = $scope.numberOfSwapsRemaining($scope.sheet);
    });

    // get the selectable table rolls
    APIService.getAllBenefitTables(function(response) {
        $scope.benefitTables = response.data;
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

    $scope.isCheckBoxDisabled = function(chosenPerk) {
        if ($scope.perkItems.length == 2) {
            // return if this perk is not in the list
            for (i=0; i<$scope.perkItems.length; i++) {
                if ($scope.perkItems[i] == chosenPerk) {
                    return false;
                }
            }
            return true;
        }
        else {
            return false;
        }
    }

    $scope.canSwap = function() {
        return $scope.perkItems.length == 2 && $scope.selectedTableId;
    }

    $scope.swap = function() {
        if ($scope.canSwap()) {
            APIService.getBenefitTablesForSheet($scope.selectedTableId, $routeParams.sheetId, function(response) {
                $scope.swapTable = response.data;
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

        APIService.makeTableRollSwap($routeParams.sheetId, postData, function(response) {
            $location.path('/editsheet/' + $routeParams.sheetId);
        });
    }

	$scope.finishSwapping = function() {
		// post to set flag true, go to editsheet
		console.log($scope.perkItems);
		console.log($scope.selectedTableId);

        APIService.finalizeTableRollSwaps($routeParams.sheetId, function(response) {
            $location.path('/editsheet/' + $routeParams.sheetId);
        });
	}

    $scope.back = function() {
        $scope.swapTable = null;
    }

});