
savageRiftsApp.controller('newSheetController', function(APIService, $scope, $location) {
    $scope.message = '';

    $scope.formData = {
        characterName: '',
        frameworkId: {}
    };

    $scope.frameworks = [];

    APIService.getAllFrameworks(function(response) {
        $scope.frameworks = response.data;
    });

    $scope.save = function() {
        APIService.createSheet($scope.formData, function(response) {
            $location.path("/sheetselect");
        });
    };
});