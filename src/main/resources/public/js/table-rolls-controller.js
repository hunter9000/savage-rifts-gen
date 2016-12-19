
savageRiftsApp.controller('tableRollsController', function(APIService, $scope, $routeParams, $location) {

    $scope.message = '';

    $scope.sheet = null;
    $scope.benefitTables = null;        // all the
    $scope.choosableTables = null;      // the table rolls that the player can choose from

    // lookup the sheet
    APIService.getSheet($routeParams.sheetId, function(response) {
        console.log('received from /api/sheet/' + $routeParams.sheetId);
        console.log(response.data);
        $scope.sheet = response.data;
    });

    // get the selectable table rolls
    APIService.getAllBenefitTables(function(response) {
        console.log('received from /api/benefittable/');
        console.log(response.data);
        $scope.benefitTables = response.data;
    });

    // get the tables
    APIService.getSheetTableRolls($routeParams.sheetId, function successCallback(response) {
        console.log('received from /api/sheet/' + $routeParams.sheetId + '/tableroll/');
        console.log(response.data);
        $scope.choosableTables = response.data;
    });


    $scope.save = function() {
        APIService.updateSheet($routeParams.sheetId, $scope.sheet, function (response) {
            $scope.message = 'saved';
            $scope.sheet = response.data;
        });
    };

    $scope.goToTable = function (rollId, tableId) {
        $location.path('/tablerolls/' + $routeParams.sheetId + '/' + rollId + '/' + tableId);
    }

});