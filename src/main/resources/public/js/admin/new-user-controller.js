
savageRiftsApp.controller('newUserController', function(APIService, $scope, $location) {
    $scope.user = {
        roles: []
    };       // user object to build and pass to server

    // roles fetched from server
    $scope.roles = [];

    APIService.getAllRoles(function(response) {
        $scope.roles = response.data;
    });

    $scope.save = function() {
        APIService.createUser($scope.user, function(response) {
            $scope.message = "Success!";
        });
    }
});



