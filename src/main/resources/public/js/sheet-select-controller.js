// http://bsalex.github.io/angular-loading-overlay/_site/#examples-spinjs
// https://github.com/bsalex/angular-loading-overlay-spinjs

	savageRiftsApp.controller('sheetSelectController', function(APIService, bsLoadingOverlayService, $timeout, $scope, $location, $uibModal, $log) {
		$scope.message = '';

		$scope.sheets = [];

	$scope.showOverlay = function(referenceId) {
		bsLoadingOverlayService.start(/*{
			referenceId: referenceId
		}*/);
	};

	$scope.hideOverlay = function(referenceId) {
		bsLoadingOverlayService.stop(/*{
			referenceId: referenceId
		}*/);
	}

        $scope.loadSheets = function() {
//			bsLoadingOverlayService.start('hello');
//            $scope.showOverlay();
            bsLoadingOverlayService.start();
            APIService.getSheets(function(response) {
                $scope.sheets = response.data;

                bsLoadingOverlayService.stop();
//                $timeout(bsLoadingOverlayService.stop, 3000);
            });
//			bsLoadingOverlayService.stop();
//            $timeout(bsLoadingOverlayService.stop, 5000);

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

