

	savageRiftsApp.controller('charSelectController', function($scope, $window, $http, $location, $uibModal) {
		$scope.message = '';

		$scope.chars = [];

        $scope.loadCharacterSheets = function() {
            $http({
                method: 'GET',
                url: '/api/sheet/',
                headers: {'x-access-token': $window.localStorage['jwtToken']}
            })
            .success(function(response) {
                $scope.chars = response;
                console.log('got these chars back: ');
                console.log(response);
            })
            .error(function(response) {
                console.log('Error: ');
                console.log(response);
                $location.path('/error');
            });
        }
        $scope.loadCharacterSheets();

        $scope.newChar = function() {
            $location.path("/newchar");
        }

        $scope.selectChar = function(charId) {
            $location.path("/editchar/" + charId);
        }

        // opens a modal dialog to confirm deleting the character
        $scope.confirmDelete = function (char) {
            var modalInstance = $uibModal.open({
                animation: false,
                templateUrl: 'myModalContent.html',
                controller: 'ConfirmCharacterDeleteController',
                size: 'md',
                resolve: {
                    char: function () {
                        return char;    // pass the character to delete
                    }
                }
            });

            modalInstance.result.then(function (char) {
                console.log('char Id to delete ' + char);
                $scope.deleteChar(char.id);
            }, function () {
                 console.log('Modal dismissed at: ' + new Date());
            });
        };

        $scope.deleteChar = function(charId) {
            $http.delete('/api/charactersheet/' + charId + '/',
                { headers: {'x-access-token': $window.localStorage['jwtToken']} }       // config
            )
            .then(function successCallback(response) {
                console.log('deleted char, reloading chars');
                $scope.loadCharacterSheets();
            }, function errorCallback(response) {
                console.log(response);
                $location.path('/error');
            });
        }

	});

    // controller for the modal window
    savageRiftsApp.controller('ConfirmCharacterDeleteController', function ($scope, $uibModalInstance, char) {
        $scope.char = char;

        $scope.ok = function () {
            $uibModalInstance.close($scope.char);
        };

        $scope.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };
    });

