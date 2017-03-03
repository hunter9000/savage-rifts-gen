savageRiftsApp.directive('attributeBuy', function() {
  return {
	templateUrl: "pages/templates/attribute-point-buy-directive-template.html",
	restrict: 'E',
    scope: {
        // name of the attribute
		attribute: '@',      // one way string binding
        // the values to display
        value: '=',

		// functions to call when clicking inc or dec
		dec: '&',       // Object & Object Literal Expression Binding
		inc: '&',

        // if the buttons will be shown, defaults to false.
		showIncrease: '=',  // two way object binding
		showDecrease: '=',
	},
    controller:function($scope, $window, $http, $location) {
        $scope.canIncrease = function() {
            if ($scope.value && $scope.value.canIncrease) {
                return $scope.value.canIncrease[$scope.attribute];
            }
        }
        $scope.canDecrease = function() {
            if ($scope.value && $scope.value.canDecrease) {
                return $scope.value.canDecrease[$scope.attribute];
            }
        }
    },
  };
});