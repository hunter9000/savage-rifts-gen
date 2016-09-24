
pfApp.controller('editCharController', function($scope, $http, $window, $routeParams, $location) {

    $scope.message = '';

    $scope.char = null;
    $scope.charClasses = [];
    $scope.selectedLevelUpClass = null;

    // lookup the character
    $http({method:'GET',
           url: '/api/charactersheet/' + $routeParams.charId + '/',
           headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .success(function (response) {
        $scope.char = response;
        console.log('get /api/charactersheet/id/ ');
        console.log(response);

        if ($scope.char.pointBuy) {
            $location.path("/pointBuy/" + $routeParams.charId);
        }

        // sort the skill ranks by skill name
        $scope.char.skillRanks.sort(function(a, b) {
            return a.skill.name.localeCompare(b.skill.name);
        });
    })
    .error(function(response) {
        console.log('Error:' + response);
        $location.path('/error');
    });

    $http.get('/api/class/',
        { headers: {'x-access-token': $window.localStorage['jwtToken']} }
    )
    .then(function successCallback(response) {
        $scope.charClasses = response.data;
    },
    function errorCallback(response) {
        console.log('error ');
        console.log(response);
    });

    // get the list of alignments
/*    $http.get('/api/alignments/', {
        headers: {'x-access-token': $window.localStorage['jwtToken']}
    })
    .then(function successCallback(response) {
        $scope.alignments = response.data;
    }, function errorCallback(response) {
        console.log(response);
    });*/

    $scope.save = function() {
        $http.patch('/api/charactersheet/' + $routeParams.charId + '/',
            $scope.char,
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }
        )
        .then(function successCallback(response) {
            $scope.message = 'saved';
            $scope.char = response.data;
        }, function errorCallback(response) {
            console.log(response);
            $location.path('/error');
        });
    };

    $scope.increaseSkillRank = function(skillRank) {
        console.log(skillRank);
        skillRank = angular.copy(skillRank);        // make a clone of the object so we don't change the model
        skillRank.rank++;
        $scope.putSkillRank(skillRank);
    }
    $scope.decreaseSkillRank = function(skillRank) {
        console.log(skillRank);
        skillRank = angular.copy(skillRank);        // make a clone of the object so we don't change the model
        skillRank.rank--;
        $scope.putSkillRank(skillRank);
    }

    $scope.putSkillRank = function(skillRank) {
       $http.put('/api/charactersheet/' + $routeParams.charId + '/skillrank/',
           skillRank,
           { headers: {'x-access-token': $window.localStorage['jwtToken']} }
       )
       .then(function successCallback(response) {
//           $scope.char = response.data;
            $scope.char.skillPoints = response.data.skillPoints;
            $scope.char.skillRanks = response.data.skillRanks;
       }, function errorCallback(response) {
           console.log(response);
       });
    }

    $scope.level = function(characterClass) {
        console.log(characterClass);
        console.log('leveling in class id '+ characterClass.id);
        $http.put('/api/charactersheet/' + $routeParams.charId + '/level/',
            characterClass,
            { headers: {'x-access-token': $window.localStorage['jwtToken']} }
        )
       .then(function successCallback(response) {
           $scope.char = response.data;
       }, function errorCallback(response) {
           console.log(response);
       });
    }

    $scope.levelUp = function() {
        $location.path('/level/' + $routeParams.charId);
    }

});