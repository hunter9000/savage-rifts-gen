
// create the controller and inject Angular's $scope
savageRiftsApp.controller('loginController', function(APIService, $scope, $location) {
    // create a message to display in our view
    $scope.message = '';

    $scope.formData = {};

    // when submitting the add form, send the text to the node API
    $scope.login = function() {
        APIService.authenticate($scope.formData, function(response) {
            console.log(response);
            $window.localStorage['jwtToken'] = response.data.response;
            $location.path("/sheetselect");
        });
    };
});