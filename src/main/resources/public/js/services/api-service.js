
savageRiftsApp.factory('APIService', function($window, $location, $http, $log) {
    return {
        getHeaders: function() {
            return { headers: {'x-access-token': $window.localStorage['jwtToken']} };
        },

        getStandardFailureCallback: function(response) {
            return function(response) {
                $log.debug(response);
                $location.path('/error');
            };
        },

        getSuccessCallbackWrapper: function(callback, method, uri, data) {
            return function(response) {
                $log.debug('Response from '+method+': ' + uri);
                if (data) {
                    $log.debug('With data: ');
                    $log.debug(data);
                }
                $log.debug(response);
                callback(response);
            };
        },

        get: function(uri, successCallback) {
            $log.debug('GET: ' + uri);
            $http.get(uri, this.getHeaders())
            .then(this.getSuccessCallbackWrapper(successCallback, 'GET', uri), this.getStandardFailureCallback());
        },

        post: function(uri, data, successCallback) {
            $log.debug('POST: ' + uri + ' DATA:');
            $log.debug(data);
            return $http.post(uri, data, this.getHeaders())
            .then(this.getSuccessCallbackWrapper(successCallback, 'POST', uri, data), this.getStandardFailureCallback());
        },

        put: function(uri, data, successCallback) {
            $log.debug('PUT: ' + uri + ' DATA:');
            $log.debug(data);
            return $http.put(uri, data, this.getHeaders())
            .then(this.getSuccessCallbackWrapper(successCallback, 'PUT', uri, data), this.getStandardFailureCallback());
        },

        patch: function(uri, data, successCallback) {
            $log.debug('PATCH: ' + uri + ' DATA:');
            $log.debug(data);
            return $http.patch(uri, data, this.getHeaders())
            .then(this.getSuccessCallbackWrapper(successCallback, 'PATCH', uri, data), this.getStandardFailureCallback());
        },

        delete: function(uri, successCallback) {
            $log.debug('DELETE: ' + uri);
            return $http.delete(uri, this.getHeaders())
            .then(this.getSuccessCallbackWrapper(successCallback, 'DELETE', uri), this.getStandardFailureCallback());
        },

        // API CALLS
        authenticate: function(data, successCallback) {
            this.post('/api/authenticate/', data, successCallback);
        },
        getUser: function(userId, successCallback) {
            this.get('/api/users/'+userId+'/', successCallback);
        },
        getUsers: function(successCallback) {
            this.get('/api/users/', successCallback);
        },
        updateUser: function(userId, data, successCallback) {
            this.put('/api/users/'+userId+'/', data, successCallback);
        },
        createUser: function(data, successCallback) {
            this.post('/api/user/', data, successCallback);
        },
        getProfile: function(successCallback) {
            this.get('/api/profile/', successCallback);
        },
        editProfile: function(data, successCallback) {
            this.put('/api/profile/', data, successCallback);
        },
        getAllRoles: function(successCallback) {
            this.get('/api/roles/', successCallback);
        },

        createSheet: function(data, successCallback) {
            this.post('/api/sheet/', data, successCallback);
        },
        getSheets: function(successCallback) {
            this.get('/api/sheet/', successCallback);
        },
        getSheet: function(sheetId, successCallback) {
            this.get('/api/sheet/'+sheetId+'/', successCallback);
        },
        updateSheet: function(sheetId, data, successCallback) {
            this.patch('/api/sheet/'+sheetId+'/', data, successCallback);
        },
        deleteSheet: function(sheetId, successCallback) {
            this.delete('/api/sheet/'+sheetId+'/', successCallback);
        },

        getSheetAttributes: function(sheetId, successCallback) {
            this.get('/api/sheet/'+sheetId+'/attributes/', successCallback);
        },
        changeAttribute: function(sheetId, data, successCallback) {
            this.put('/api/sheet/'+sheetId+'/attributes/', data, successCallback);
        },
        finalizeAttributeBuy: function(sheetId, successCallback) {
            this.post('/api/sheet/'+sheetId+'/attributes/', {}, successCallback);
        },

        getSheetHindrances: function(sheetId, successCallback) {
            this.get('/api/sheet/'+sheetId+'/hindrances/', successCallback);
        },
        getAllHindrances: function(successCallback) {
            this.get('/api/hindrance/', successCallback);
        },
        changeHindrance: function(sheetId, data, successCallback) {
            this.put('/api/sheet/'+sheetId+'/hindrances/', data, successCallback);
        },
        finalizeHindranceBuy: function(sheetId, successCallback) {
            this.post('/api/sheet/'+sheetId+'/hindrances/', {}, successCallback);
        },

        getAllFrameworks: function(successCallback) {
            this.get('/api/framework/', successCallback);
        },

        getAllRaces: function(successCallback) {
            this.get('/api/race/', successCallback);
        },

        createSheetRace: function(sheetId, raceId, successCallback) {
            this.post('/api/sheet/'+sheetId+'/race/'+raceId+'/', {}, successCallback);
        },

        getSheetSkills: function(sheetId, successCallback) {
            this.get('/api/sheet/'+sheetId+'/skills/', successCallback);
        },
        changeSkill: function(sheetId, data, successCallback) {
            this.put('/api/sheet/'+sheetId+'/skills/', data, successCallback);
        },
        finalizeSkillBuy: function(sheetId, successCallback) {
            this.post('/api/sheet/'+sheetId+'/skills/', {}, successCallback);
        },

        getBenefitTablesForSheet: function(tableId, sheetId, successCallback) {
            this.get('/api/benefittable/'+tableId+'/'+sheetId+'/', successCallback);
        },
        makeTableRoll: function(sheetId, tableId, rollId, successCallback) {
            this.post('/api/sheet/'+sheetId+'/tableroll/'+tableId+'/'+rollId+'/', {}, successCallback);
        },
        makeTableRollSwap: function(sheetId, data, successCallback) {
            this.put('/api/sheet/'+sheetId+'/tablerollswap/', data, successCallback);
        },
        finalizeTableRollSwaps: function(sheetId, successCallback) {
            this.post('/api/sheet/' + sheetId + '/tablerollswap/', {}, successCallback);
        },
        getAllBenefitTables: function(successCallback) {
            this.get('/api/benefittable/', successCallback);
        },
        getSheetTableRolls: function(sheetId, successCallback) {
            this.get('/api/sheet/'+ sheetId +'/tableroll/', successCallback);
        },

        getEdges: function(successCallback) {
            this.get('/api/edge/', successCallback);
        },

        getKnowledgeSkills: function(sheetId, successCallback) {
            this.get('/api/sheet/'+sheetId+'/skills/knowledge/', successCallback);
        },

        getKnowledgeCategories: function(successCallback) {
            this.get('/api/knowledgecategories/', successCallback);
        },
        addKnowledgeSkill: function(sheetId, knowledgeSkillId, successCallback) {
            this.put('/api/sheet/' + sheetId + '/skills/knowledge/' + knowledgeSkillId + '/', {}, successCallback);
        },

    };
});