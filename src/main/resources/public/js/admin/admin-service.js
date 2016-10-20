
	savageRiftsApp.factory('JwtData', function($window, $location) {
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
                if (!token || token == null) {
//                    console.log('error, no token');
                    return null;
                }
                var arrayOfStrings = token.split('.');
                var decoded = atob(arrayOfStrings[1]);
                var obj = JSON.parse(decoded);
                var sub = JSON.parse(obj.sub);
                return sub;
            },

            redirectToCreationSteps: function(sheet) {
                if (!sheet) {
                    $location.path('/error');
                }

                if (sheet.creationStep == 'TABLE_ROLLS') {
                    $location.path('/tablerolls/' + sheet.id);
                }
                else if (sheet.creationStep == 'TABLE_ROLL_SWAP') {
                    $location.path('/tablerollswap/' + sheet.id);
                }
                else if (sheet.creationStep == 'RACE') {
                    $location.path('/raceselection/' + sheet.id);
                }
				else if (sheet.creationStep == 'ATTRIBUTES') {
                    $location.path('/attributebuy/' + sheet.id);
                }
                else if (sheet.creationStep == 'SKILLS') {
                    $location.path('/skillbuy/' + sheet.id);
                }
				else if (sheet.creationStep == 'HINDRANCES') {
                    $location.path('/hindrancebuy/' + sheet.id);
                }
				else if (sheet.creationStep == 'EDGES') {
//                    $location.path('//' + sheet.id);
                }
				else if (sheet.creationStep == 'FINISHED') {
					// do nothing, we're here
				}

            }
        };
	});