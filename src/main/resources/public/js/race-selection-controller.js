
savageRiftsApp.controller('raceSelectionController', function(APIService, SheetService, $scope, $routeParams) {
	$scope.races = [];
	$scope.selectedRace = null;
	$scope.sheet = null;

    // lookup the character
    APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
    });

    APIService.getAllRaces(function(response) {
        $scope.races = response.data;
    });

	$scope.selectRace = function() {
	    APIService.createSheetRace($routeParams.sheetId, $scope.selectedRace.id, function successCallback(response) {
//            APIService.getSheet($routeParams.sheetId, function(response) {
            SheetService.redirectToCreationStepsFromId($routeParams.sheetId);
//            });
        });
	}
	
});