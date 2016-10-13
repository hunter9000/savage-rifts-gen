savageRiftsApp.directive('statbuy', function() {
  return {
	templateUrl: "pages/templates/point-buy-directive-template.html",
	restrict: 'E',
    scope: {
        // name of the attribute
		stat: '@',      // one way string binding
		// functions to call when clicking inc or dec
		dec: '&',       // Object & Object Literal Expression Binding
		inc: '&',
		// the values to display
		value: '=',     // two way object binding
		canincrease: '=',
		candecrease: '=',
	},
	transclude: true,
  };
});