
savageRiftsApp.directive('navBreadcrumb', function() {
	return {
		template:
			'   <div class="container nav-breadcrumb-wrapper"> \
                     <!-- Nav tabs --> \
                     <ul class="nav nav-pills nav-justified"> \
                         <li class="{{isActive(\'TABLE_ROLLS\')}}"> <a href="" class="">Table Rolls</a> </li> \
                         <li class="nav-divider"> <a><span class="glyphicon glyphicon-chevron-right"></span></a> </li> \
                         <li class="{{isActive(\'TABLE_ROLL_SWAP\')}}"> <a href="">Table Roll Swap</a> </li> \
                         <li class="nav-divider"> <a><span class="glyphicon glyphicon-chevron-right"></span></a> </li> \
                         <li class="{{isActive(\'RACE\')}}"> <a href="">Race</a> </li> \
                         <li class="nav-divider"> <a><span class="glyphicon glyphicon-chevron-right"></span></a> </li> \
                         <li class="{{isActive(\'ATTRIBUTES\')}}"> <a href="">Attributes</a> </li> \
                         <li class="nav-divider"> <a><span class="glyphicon glyphicon-chevron-right"></span></a> </li> \
                         <li class="{{isActive(\'SKILLS\')}}"> <a href="">Skills</a> </li> \
                         <li class="nav-divider"> <a><span class="glyphicon glyphicon-chevron-right"></span></a> </li> \
                         <li class="{{isActive(\'HINDRANCES\')}}"> <a href="">Hindrances</a> </li> \
                         <li class="nav-divider"> <a><span class="glyphicon glyphicon-chevron-right"></span></a> </li> \
                         <li class="{{isActive(\'EDGES\')}}"> <a href="">Edges</a> </li> \
                     </ul> \
                 </div>',
		restrict: 'E',
		scope: {
			step: '@'
		},
        controller: function ($scope) {
            $scope.isActive = function(currentStep) {
                console.log('currentStep ' + currentStep);
                return $scope.step == currentStep ? 'active' : '';
            }
        }
	}
});
