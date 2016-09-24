
pfApp.directive('characterSearch', function() {
    return {
        templateUrl: '/pages/templates/character-search-template.html',
        scope: {
            addSelected : '&',		// function to call when clicking ok for a selected user
        },
        controller:function($scope, $window, $http, $location) {
            $scope.selectedItem = null;
            $scope.searchText = '';

            $scope.querySearch = function(query) {
                return $http.get('/api/charactersheet/?query=' + query,
                    { headers: {'x-access-token': $window.localStorage['jwtToken']} }
                ).then(function(response){
                   return response.data;
                }, function(response) {
                   console.log('errrrrororrrr');
                   console.log(response)
                })
            };

            $scope.submit = function() {
                $scope.addSelected({'characterSheet': $scope.selectedItem});
                $scope.searchText = '';
            }
        },

    }
});