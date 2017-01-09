
savageRiftsApp.directive('dieRoll', function() {
	return {
		templateUrl: '/pages/templates/die-roll-directive-template.html',
		restrict: 'E',
		scope: {
			roll: '='
		}
	}
});
