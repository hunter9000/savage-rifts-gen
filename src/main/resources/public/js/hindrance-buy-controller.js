
savageRiftsApp.controller('hindranceBuyController', function(APIService, $scope, $routeParams, $location, $log) {
	$scope.hindrances = [];
	$scope.sheetHindranceSelections = null;

	// get sheet's hindrance selections
	APIService.getSheetHindrances($routeParams.sheetId, function(response) {
        $scope.sheetHindranceSelections = response.data;
	});

    // get all hindrances
    APIService.getAllHindrances(function(response) {
		$scope.hindrances = response.data;
    });
	
	$scope.addHindrance = function(hindrance, severityType) {
	    $log.debug('add ' + hindrance);

	    APIService.changeHindrance($routeParams.sheetId,
            {'hindranceType': hindrance.type, 'severityType': severityType, 'operation': 'ADD'},
            function(response) {
                $scope.sheetHindranceSelections = response.data;
            }
        );
	}

	$scope.removeHindrance = function(hindrance) {
	    $log.debug('add ' + hindrance);

        APIService.changeHindrance($routeParams.sheetId,
            {'hindranceType': hindrance.type, 'severityType': null, 'operation': 'REMOVE'},
            function(response) {
                $scope.sheetHindranceSelections = response.data;
            }
        );
	}

    $scope.chosenTypeFilterFunc = function(hindrance) {
        var chosenTypes = [];
        if ($scope.sheetHindranceSelections.major) {
            chosenTypes.push($scope.sheetHindranceSelections.major.type);
        }
        if ($scope.sheetHindranceSelections.minor1) {
            chosenTypes.push($scope.sheetHindranceSelections.minor1.type);
        }
        if ($scope.sheetHindranceSelections.minor2) {
            chosenTypes.push($scope.sheetHindranceSelections.minor2.type);
        }

        for (var i=0; i<chosenTypes.length; i++) {
            if (hindrance.type == chosenTypes[i]) {
                return false;
            }
        }
        return true;
    }

    $scope.canSelectMajor = function(hindrance) {
        return (hindrance.major && $scope.sheetHindranceSelections.numMajorSelections > 0);
    }

    $scope.canSelectMinor = function(hindrance) {
        return (hindrance.minor && $scope.sheetHindranceSelections.numMinorSelections > 0);
    }


	$scope.finishHindrances = function() {
	    APIService.finalizeHindranceBuy($routeParams.sheetId, function(response) {
            $location.path("/editsheet/" + $routeParams.sheetId);
	    });
	}

});