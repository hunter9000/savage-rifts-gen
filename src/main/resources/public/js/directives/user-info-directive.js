
/** pass in the user object to be edited. editName is a boolean for if the name can be changed. roles is the array
 *  of roles to choose from. if not present, the roles can't be edited. */

sampleApp.directive('userInfo', function() {
    return {
        templateUrl: 'pages/templates/user-info-directive-template.html',
        restrict: 'E',
        scope: {
            user: '=',
            editName: '=',
            roles: '='
        },
    }
  });