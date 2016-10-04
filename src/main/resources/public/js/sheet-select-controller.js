

	savageRiftsApp.controller('sheetSelectController', function($scope, $window, $http, $location, $uibModal) {
		$scope.message = '';

		$scope.sheets = [];

        $scope.loadSheets = function() {
            $http({
                method: 'GET',
                url: '/api/sheet/',
                headers: {'x-access-token': $window.localStorage['jwtToken']}
            })
            .success(function(response) {
                $scope.sheets = response;
                console.log('got these sheets back: ');
                console.log(response);
            })
            .error(function(response) {
                console.log('Error: ');
                console.log(response);
                $location.path('/error');
            });
        }
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
                console.log('sheet Id to delete ' + sheet);
                $scope.deleteSheet(sheet.id);
            }, function () {
                 console.log('Modal dismissed at: ' + new Date());
            });
        };

        $scope.deleteSheet = function(sheetId) {
            $http.delete('/api/sheet/' + sheetId + '/',
                { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
            )
            .then(function successCallback(response) {
                console.log('deleted sheet, reloading sheets');
                $scope.loadSheets();
            }, function errorCallback(response) {
                console.log(response);
                $location.path('/error');
            });
        }

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

