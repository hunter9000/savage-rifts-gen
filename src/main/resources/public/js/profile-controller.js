
savageRiftsApp.controller('profileController', function(APIService, $scope){
	$scope.user = {};
    $scope.roles = [];

    APIService.getProfile(function(response) {
        $scope.user = response.data;
    });

    APIService.getAllRoles(function(response) {
        $scope.roles = response.data;
    });

    $scope.save = function() {
        APIService.editProfile($scope.user, function(response) {
            $scope.user = response.data;
        });
    }
});