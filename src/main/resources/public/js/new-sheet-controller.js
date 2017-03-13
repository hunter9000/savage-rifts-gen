
savageRiftsApp.controller('newSheetController', function(APIService, SheetService, $scope, $location, $log) {
    $scope.message = '';
    $scope.selectedFramework = null;

    $scope.formData = {
        characterName: '',
        frameworkId: {}
    };

    $scope.frameworks = [];

    APIService.getAllFrameworks(function(response) {
        $scope.frameworks = response.data;
    });

    $scope.save = function() {
        if (!$scope.selectedFramework) {
            $log.error('framework was not selected before saving');
            return;
        }
        $scope.formData.frameworkId = $scope.selectedFramework.id;
        APIService.createSheet($scope.formData, function(response) {
            SheetService.redirectToCreationStepsFromId(response.data.id);
        });
    };
});