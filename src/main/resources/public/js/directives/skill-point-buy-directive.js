savageRiftsApp.directive('skillbuy', function() {
  return {
	templateUrl: "pages/templates/skill-point-buy-directive-template.html",
	restrict: 'E',
    scope: {
        // name of the attribute
		skill: '@',      // one way string binding
		// functions to call when clicking inc or dec
		dec: '&',       // Object & Object Literal Expression Binding
		inc: '&',
		// the values to display
		value: '=',     // two way object binding
		canincrease: '=',
		candecrease: '=',
	},
	transclude: true,
    controller: function ($scope) {
        $scope.getTextClass = function(roll) {
            console.log('roll ' + roll);
            return roll.dieType == 'D4' && roll.modifier == '-2' ? 'text-light' : '';
        }
    }
  };
});