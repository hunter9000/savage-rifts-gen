
savageRiftsApp.factory('JwtService', function($window, $location, $log) {
    return {
        getUserName: function() {
            var subject = this.parseJwt();
            if (subject == null) {
                return null;
            }
            return subject.userName;
        },
        isAdmin: function() {
            return this.checkForRole('ADMIN');
        },
        isPlayer: function() {
            return this.checkForRole('PLAYER');
        },
        checkForRole: function(role) {
            var subject = this.parseJwt();
            if (subject == null) {
                return false;
            }
            var roles = subject.roles;
            if (roles != null) {
                for (i=0; i<roles.length; i++) {
                    if (roles[i] == role) {
                        return true;
                    }
                }
            }
            return false;
        },
        // parses the token and returns the subject object (userName:'', roles:['','']}
        parseJwt: function() {
            var token = $window.localStorage['jwtToken'];
            if (!token || token == null || token == 'null') {
                $log.debug('error, no token');
                return null;
            }
            var arrayOfStrings = token.split('.');
            var decoded = atob(arrayOfStrings[1]);
            var obj = JSON.parse(decoded);
            var sub = JSON.parse(obj.sub);
            return sub;
        }
    };
});