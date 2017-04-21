
savageRiftsApp.factory('APIService', function($window, $location, $http, $log) {

    var getHeaders = function() {
        return { headers: {'x-access-token': $window.localStorage['jwtToken']} };
    };
    var getStandardFailureCallback = function(response) {
        return function(response) {
            $log.error(response);
            $location.path('/error');
        };
    };

    var getSuccessCallbackWrapper = function(callback, method, uri, data) {
        return function(response) {
            $log.debug('Response from '+method+': ' + uri);
            if (data) {
                $log.debug('With data: ');
                $log.debug(data);
            }
            $log.debug(response);
            callback(response);
        };
    };

    var get = function(uri, successCallback) {
        $log.debug('GET: ' + uri);
        $http.get(uri, getHeaders())
        .then(getSuccessCallbackWrapper(successCallback, 'GET', uri), getStandardFailureCallback());
    };
    var post = function(uri, data, successCallback, failureCallback) {
        $log.debug('POST: ' + uri + ' DATA:');
        $log.debug(data);
        if (!failureCallback) {
            failureCallback = getStandardFailureCallback();
        }
        return $http.post(uri, data, getHeaders())
        .then(getSuccessCallbackWrapper(successCallback, 'POST', uri, data), failureCallback);
    };
    var put = function(uri, data, successCallback) {
        $log.debug('PUT: ' + uri + ' DATA:');
        $log.debug(data);
        return $http.put(uri, data, getHeaders())
        .then(getSuccessCallbackWrapper(successCallback, 'PUT', uri, data), getStandardFailureCallback());
    };
    var patch = function(uri, data, successCallback) {
        $log.debug('PATCH: ' + uri + ' DATA:');
        $log.debug(data);
        return $http.patch(uri, data, getHeaders())
        .then(getSuccessCallbackWrapper(successCallback, 'PATCH', uri, data), getStandardFailureCallback());
    };
    var deleteCall = function(uri, successCallback) {
        $log.debug('DELETE: ' + uri);
        return $http.delete(uri, getHeaders())
        .then(getSuccessCallbackWrapper(successCallback, 'DELETE', uri), getStandardFailureCallback());
    };

    return {
        // API CALLS
        authenticate: function(data, successCallback) {
            post('/api/authenticate/', data, successCallback);
        },
        getUser: function(userId, successCallback) {
            get('/api/users/'+userId+'/', successCallback);
        },
        getUsers: function(successCallback) {
            get('/api/users/', successCallback);
        },
        updateUser: function(userId, data, successCallback) {
            put('/api/users/'+userId+'/', data, successCallback);
        },
        createUser: function(data, successCallback) {
            post('/api/user/', data, successCallback);
        },
        getProfile: function(successCallback) {
            get('/api/profile/', successCallback);
        },
        editProfile: function(data, successCallback) {
            put('/api/profile/', data, successCallback);
        },
        getAllRoles: function(successCallback) {
            get('/api/roles/', successCallback);
        },

        createSheet: function(data, successCallback) {
            post('/api/sheet/', data, successCallback);
        },
        getSheets: function(successCallback) {
            get('/api/sheet/', successCallback);
        },
        getSheet: function(sheetId, successCallback) {
            get('/api/sheet/'+sheetId+'/', successCallback);
        },
        getSheetCreationStep: function(sheetId, successCallback) {
            get('/api/sheet/'+sheetId+'/creationStep/', successCallback);
        },
        updateSheet: function(sheetId, data, successCallback) {
            patch('/api/sheet/'+sheetId+'/', data, successCallback);
        },
        deleteSheet: function(sheetId, successCallback) {
            deleteCall('/api/sheet/'+sheetId+'/', successCallback);
        },

        getSheetAttributes: function(sheetId, successCallback) {
            get('/api/sheet/'+sheetId+'/attributes/', successCallback);
        },
        changeAttribute: function(sheetId, data, successCallback) {
            put('/api/sheet/'+sheetId+'/attributes/', data, successCallback);
        },
        finalizeAttributeBuy: function(sheetId, successCallback) {
            post('/api/sheet/'+sheetId+'/attributes/', {}, successCallback);
        },

        getSheetHindrances: function(sheetId, successCallback) {
            get('/api/sheet/'+sheetId+'/hindrances/', successCallback);
        },
        getAllHindrances: function(successCallback) {
            get('/api/hindrance/', successCallback);
        },
        changeHindrance: function(sheetId, data, successCallback) {
            put('/api/sheet/'+sheetId+'/hindrances/', data, successCallback);
        },
        finalizeHindranceBuy: function(sheetId, successCallback) {
            post('/api/sheet/'+sheetId+'/hindrances/', {}, successCallback);
        },

        getAllFrameworks: function(successCallback) {
            get('/api/framework/', successCallback);
        },

        getAllRaces: function(successCallback) {
            get('/api/race/', successCallback);
        },

        createSheetRace: function(sheetId, raceId, successCallback) {
            post('/api/sheet/'+sheetId+'/race/'+raceId+'/', {}, successCallback);
        },

        getSheetSkills: function(sheetId, successCallback) {
            get('/api/sheet/'+sheetId+'/skills/', successCallback);
        },
        changeSkillPurchase: function(sheetId, data, successCallback) {
            put('/api/sheet/'+sheetId+'/skills/', data, successCallback);
        },
//        decreaseSkill: function(sheetId, skillPurchaseId, successCallback) {
//            deleteCall('/api/sheet/'+sheetId+'/skills/'+skillPurchaseId+'/', successCallback);
//        },
        finalizeSkillBuy: function(sheetId, successCallback) {
            post('/api/sheet/'+sheetId+'/skills/', {}, successCallback);
        },

        getBenefitTablesForSheet: function(tableId, sheetId, successCallback) {
            get('/api/benefittable/'+tableId+'/'+sheetId+'/', successCallback);
        },
        makeTableRoll: function(sheetId, tableId, rollId, successCallback) {
            post('/api/sheet/'+sheetId+'/tableroll/'+tableId+'/'+rollId+'/', {}, successCallback);
        },
        makeTableRollSwap: function(sheetId, data, successCallback) {
            put('/api/sheet/'+sheetId+'/tablerollswap/', data, successCallback);
        },
        finalizeTableRollSwaps: function(sheetId, successCallback) {
            post('/api/sheet/' + sheetId + '/tablerollswap/', {}, successCallback);
        },
        getAllBenefitTables: function(successCallback) {
            get('/api/benefittable/', successCallback);
        },
        getSheetTableRolls: function(sheetId, successCallback) {
            get('/api/sheet/'+ sheetId +'/tableroll/', successCallback);
        },

        getEdges: function(successCallback) {
            get('/api/edge/', successCallback);
        },

		// bonuses
		getEdgeOptions: function(sheetId, successCallback) {
			get('/api/sheet/'+sheetId+'/bonuses/edges/', successCallback);
		},
		finalizeBonusPurchases: function(sheetId, successCallback) {
			post('/api/sheet/'+sheetId+'/bonuses/', {}, successCallback);
		},
		purchaseEdge: function(sheetId, edgeId, successCallback) {
			put("/api/sheet/"+sheetId+"/bonuses/edges/"+edgeId+"/", {}, successCallback);
		},
		removeEdge: function(sheetId, edgeRaiseId, successCallback) {
			deleteCall('/api/sheet/'+sheetId+'/bonuses/edges/'+edgeRaiseId+'/', successCallback);
		},
		purchaseAttributeRaise: function(sheetId, attributeRaiseData, successCallback) {
			put('/api/sheet/'+sheetId+'/bonuses/attributes/', attributeRaiseData, successCallback);
		},
		removeAttributeRaise: function(sheetId, attributeRaiseId, successCallback) {
			deleteCall('/api/sheet/'+sheetId+'/bonuses/attributes/'+attributeRaiseId+'/', successCallback);
		},
		purchaseSkillRaise: function(sheetId, skillRaiseData, successCallback) {
			put('/api/sheet/'+sheetId+'/bonuses/skills/', skillRaiseData, successCallback);
		},
		removeSkillRaise: function(sheetId, skillRaiseId, successCallback) {
			deleteCall('/api/sheet/'+sheetId+'/bonuses/skills/'+skillRaiseId+'/', successCallback);
		},
		purchaseMoneyRaise: function(sheetId, successCallback) {
			put('/api/sheet/'+sheetId+'/bonuses/money/', {}, successCallback);
		},
		removeMoneyRaise: function(sheetId, successCallback) {
			deleteCall('/api/sheet/'+sheetId+'/bonuses/money/', successCallback);
		},
		
		
    };
});