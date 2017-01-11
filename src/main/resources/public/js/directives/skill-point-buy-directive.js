/** Value is a SkillRoll object. if allowIncDec is true, the next 4 attrs must be supplied */
savageRiftsApp.directive('skillbuy', function() {
  return {
	templateUrl: "pages/templates/skill-point-buy-directive-template.html",
	restrict: 'E',
    scope: {
		// the values to display
		value: '=',     // two way object binding

        // boolean if the inc and dec funtionality should work
        allowIncDec: '=',

        // these are only used if allowIncDec is true:
		// functions to call when clicking inc or dec
		dec: '&',       // Object & Object Literal Expression Binding
		inc: '&',
        // boolean, if the skill can inc or dec
		canincrease: '=',
		candecrease: '=',
	},
    controller: function ($scope) {
        $scope.getTextClass = function(roll) {
//            console.log('roll ' + roll);
            return roll.dieType == 'D4' && roll.modifier == '-2' ? 'text-light' : '';
        }
    }
  };
});