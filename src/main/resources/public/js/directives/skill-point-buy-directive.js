savageRiftsApp.directive('skillbuy', function() {
    return {
        templateUrl: "pages/templates/skill-point-buy-directive-template.html",
        restrict: 'E',
        scope: {
            // name of the attribute
            skill: '@',      // one way string binding

            // the SkillRollInfo value to display
            value: '=',     // two way object binding

            // functions to call when clicking inc or dec
            dec: '&',       // Object & Object Literal Expression Binding
            inc: '&',

            // if the buttons will be shown, defaults to false.
            showIncrease: '=',  // two way object binding
            showDecrease: '=',
        },
	    controller:function($scope, $window, $http, $location) {
            $scope.canIncrease = function() {
                if ($scope.value && $scope.value.canIncrease !== undefined) {
                    return $scope.value.canIncrease;
                }
            }
            $scope.canDecrease = function() {
                if ($scope.value && $scope.value.canDecrease !== undefined) {
                    return $scope.value.canDecrease;
                }
            }
        },
    };
});