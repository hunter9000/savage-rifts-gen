

	savageRiftsApp.controller('sheetSelectController', function(APIService, SheetService, usSpinnerService, $scope, $location, $uibModal, $log) {
		$scope.message = '';

		$scope.sheets = [];

        $scope.loadSheets = function() {
//            usSpinnerService.spin('spinner-1');

            APIService.getSheets(function(response) {
                $scope.sheets = response.data;
                usSpinnerService.
            });
        };
        $scope.loadSheets();

        $scope.newSheet = function() {
            $location.path("/newsheet");
        }

        $scope.selectSheet = function(sheetId) {
            SheetService.redirectToCreationStepsFromId(sheetId);
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
                $scope.deleteSheet(sheet.id);
            }, function () {
                 $log.debug('Modal dismissed at: ' + new Date());
            });
        };

        $scope.deleteSheet = function(sheetId) {
            APIService.deleteSheet(sheetId, function(response) {
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

