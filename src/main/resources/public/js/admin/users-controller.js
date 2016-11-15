
savageRiftsApp.controller('usersController', function(APIService, $scope, $location) {

    $scope.users = [];

    APIService.getUsers(function(response) {
        $scope.users = response.data;
    });

    $scope.edit = function(userId) {
        $location.path('/edituser/'+userId);
    }

    $scope.delete = function() {

    }

});
