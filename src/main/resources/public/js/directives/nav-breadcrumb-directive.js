
savageRiftsApp.directive('navBreadcrumb', function() {
	return {
		templateUrl: '/pages/templates/nav-breadcrumb-directive-template.html',
		restrict: 'E',
		scope: {
			step: '@'
		},
        controller: function ($scope) {
            $scope.isActive = function(currentStep) {
                return $scope.step == currentStep ? 'active' : '';
            }
        }
	}
});
