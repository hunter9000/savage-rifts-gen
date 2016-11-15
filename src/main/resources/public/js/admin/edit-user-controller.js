
savageRiftsApp.controller('editUserController', function(APIService, $scope, $location, $routeParams) {

    $scope.user = {};

    $scope.roles = [];

    APIService.getAllRoles(function(response) {
        $scope.roles = response.data;
    });

    APIService.getUser($routeParams.userId, function(response) {
        $scope.user = response.data;
    });

    $scope.save = function() {
        APIService.updateUser($routeParams.userId, $scope.user, function(response) {
            $location.path('/users');
        });
    }

});