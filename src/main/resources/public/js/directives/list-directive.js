
savageRiftsApp.directive('list', function($compile, $interpolate, $log) {
    return {
        restrict: 'E',
        scope: {
            contents: '=',
            clickCallback: '&click',
            templateContents: '@'
        },
        template: '<div class="scroll-list equipment-list"> \
                        <div class="scroll-list-inner"> \
                            <element ng-repeat="ele in contents track by $index" ele="ele" click="click(element)" template-contents="{{templateContents}}"></element> \
                        </div> \
                    </div>',
        link: function(scope, element, attrs) {
            scope.click = function(ele) {
//                $log.debug('click ' + ele);
                scope.clickCallback({recipe: ele});
            }
        }
    }
});
savageRiftsApp.directive('element', function($compile, $interpolate, TemplateService) {
    return {
        restrict: 'E',
        scope: {
            ele: '=ele',
            clickCallback: '&click',
            templateContents: '@'
        },
        link: function(scope, element, attrs) {
            scope.click = function() {
                scope.clickCallback({element: scope.ele});
            }

            TemplateService.getTemplate(scope.templateContents).then(function (response) {
                element.html(response.data);
                $compile(element.contents())(scope);
            });
        }
    };
});