
savageRiftsApp.directive('pfCollapseSection', function() {
	return {
		template:
			'<div class="panel panel-default" id="panel2"> \
				<span ng-transclude></span> \
			</div>',
		restrict: 'E',
		scope: {
			identifier: '@',
			initialCollapsed: '@'
		},
		transclude: true,
		controller: function firstDirectiveController($scope) {
            if ($scope.initialCollapsed == undefined) {
                $scope.initialCollapsed = false;
            }
            return $scope;
		},
		link: function postLink(scope, element, attrs) {
		}
	}
});

savageRiftsApp.directive('pfCollapseSectionHeader', function() {
	return {
		template:
			'<div class="panel-heading"> \
				 <h4 class="panel-title"> \
					<a data-toggle="collapse" data-target="#{{id}}" href="" class="collapsed"> \
						<span ng-transclude></span> \
					</a> \
				</h4> \
			</div>',
		restrict: 'E',
		scope: false,
		transclude: true,
		replace: true,
		require: '^pfCollapseSection',
		link: function postLink(scope, iElement, iAttrs, firstDirectiveController) {
		  scope.id = firstDirectiveController.identifier;
		}
	}
});

savageRiftsApp.directive('pfCollapseSectionBody', function() {
	return {
		template:
			'<div id="{{id}}" ng-class="{in: !initialCollapsed, \'panel-collapse\': true, collapse: true}" > \
				<div class="panel-body"> \
					<span ng-transclude></span> \
				</div> \
			</div>',
		restrict: 'E',
		scope: false,
		transclude: true,
		replace: true,
		require: '^pfCollapseSection',
		link: function postLink(scope, iElement, iAttrs, firstDirectiveController) {
		  scope.id = firstDirectiveController.identifier;
          scope.initialCollapsed = firstDirectiveController.initialCollapsed;
		}
	}
});
