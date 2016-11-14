

	savageRiftsApp.controller('sheetSelectController', function(APIService, $scope, $location, $uibModal) {
		$scope.message = '';

		$scope.sheets = [];

        $scope.loadSheets = function() {
            APIService.getSheets(function(response) {
                $scope.sheets = response.data;
                console.log('got these sheets back: ');
                console.log(response);
            });
        };
        $scope.loadSheets();

        $scope.newSheet = function() {
            $location.path("/newsheet");
        }

        $scope.selectSheet = function(sheetId) {
            $location.path("/editsheet/" + sheetId);
        }

        // opens a modal dialog to confirm deleting the character
        $scope.confirmDelete = function (sheet) {
            var modalInstance = $uibModal.open({
                animation: false,
                templateUrl: 'myModalContent.html',
                controller: 'ConfirmSheetDeleteController',
                size: 'md',
                resolve: {
                    sheet: function () {
                        return sheet;    // pass the character to delete
                    }
                }
            });

            modalInstance.result.then(function (sheet) {
                console.log('sheet Id to delete ');
                console.log(sheet);
                $scope.deleteSheet(sheet.id);
            }, function () {
                 console.log('Modal dismissed at: ' + new Date());
            });
        };

        $scope.deleteSheet = function(sheetId) {
            APIService.deleteSheet(sheetId, function(response) {
                console.log('deleted sheet, reloading sheets');
                $scope.loadSheets();
            });
        };

	});

    // controller for the modal window
    savageRiftsApp.controller('ConfirmSheetDeleteController', function ($scope, $uibModalInstance, sheet) {
        $scope.sheet = sheet;

        $scope.ok = function () {
            $uibModalInstance.close($scope.sheet);
        };

        $scope.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };
    });

