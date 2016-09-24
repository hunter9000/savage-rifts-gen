
savageRiftsApp.controller('newCharController', function($scope, $location, $http, $window) {
    $scope.message = '';

    $scope.formData = {
        characterName: '',
        frameworkId: {}
    };

    $scope.frameworks = [];

    $http({
        method:'GET',
        url:'/api/framework/',
        headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.frameworks = response.data;
    }, function errorCallback(response) {
        $scope.message = "error loading character classes";
        console.log(response);
        $location.path('/error');
    });

    $scope.save = function() {
        $http({
            method: 'POST',
            url: '/api/sheet/',
            headers: {'x-access-token': $window.localStorage['jwtToken']},
            data: $scope.formData
        })
        .then(function successCallback(response) {
            $location.path("/charselect");
        }, function errorCallback(response) {
            $scope.message = "error creating character sheet";
            console.log(response);
            $location.path('/error');
        });
    };
});