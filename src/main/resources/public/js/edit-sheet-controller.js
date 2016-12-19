
savageRiftsApp.controller('editSheetController', function(APIService, SheetService, $scope, $routeParams) {

    $scope.message = '';

    $scope.sheet = null;

    // lookup the character
    APIService.getSheet($routeParams.sheetId, function(response) {
        $scope.sheet = response.data;

        SheetService.redirectToCreationSteps($scope.sheet);
    });

    $scope.save = function() {
        APIService.updateSheet($routeParams.sheetId, $scope.sheet, function(response) {
            $scope.message = 'saved';
            $scope.sheet = response.data;
        });
    };

});