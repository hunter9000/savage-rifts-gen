
savageRiftsApp.controller('tableRollController', function(APIService, SheetService, $scope, $routeParams, $location) {

    $scope.sheet = null;
	$scope.benefitTable = null;
	$scope.selectedPerk = null;
	
    // lookup the benefit table to make the roll on
    APIService.getBenefitTablesForSheet($routeParams.tableId, $routeParams.sheetId, function(response) {
        $scope.benefitTable = response.data;
    });

    // get the sheet
    APIService.getSheet($routeParams.sheetId, function successCallback(response) {
        $scope.sheet = response.data;
    });

	$scope.roll = function() {
	    APIService.makeTableRoll($routeParams.sheetId, $routeParams.tableId, $routeParams.rollId, function(response) {
            $scope.selectedPerk = response.data.perkSelection;
            $scope.sheet = response.data.sheet;
        });
	}
	
    $scope.goBack = function() {
        SheetService.redirectToCreationStepsFromId($scope.sheet.id);
//        $location.path('/tablerolls/' + $routeParams.sheetId);
    }

});