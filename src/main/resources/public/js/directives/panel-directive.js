

savageRiftsApp.directive('panel', function() {
    return {
        templateUrl: 'pages/templates/panel-directive-template.html',
        restrict: 'E',
		transclude: true,
        scope: {
            header: '@',
        },
    }
  });