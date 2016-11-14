
savageRiftsApp.controller('raceSelectionController', function(APIService, SheetService, $scope, $routeParams) {
	$scope.races = [];
	$scope.selectedRace = null;
	$scope.sheet = null;

    // lookup the character
    APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;
    });

    APIService.getAllRaces(function(response) {
        console.log('got all races');
        console.log(response.data);
        $scope.races = response.data;
    });

	$scope.selectRace = function() {
	    APIService.createSheetRace($routeParams.sheetId, $scope.selectedRace.id, function successCallback(response) {
            console.log('set race successfully');
            SheetService.redirectToCreationSteps($scope.sheet);
        });
	}
	
});