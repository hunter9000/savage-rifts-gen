
savageRiftsApp.factory('APIService', function($window, $location, $http) {
    return {
        getHeaders: function() {
            return { headers: {'x-access-token': $window.localStorage['jwtToken']} };
        },

        getStandardFailureCallback: function(response) {
            return function(response) {
                console.log(response);
                $location.path('/error');
            };
        },

        get: function(uri, successCallback) {
            $http.get(uri, this.getHeaders())
            .then(successCallback, this.getStandardFailureCallback());
        },

        post: function(uri, data, successCallback) {
            return $http.post(uri, data, this.getHeaders())
            .then(successCallback, this.getStandardFailureCallback());
        },

        put: function(uri, data, successCallback) {
            return $http.put(uri, data, this.getHeaders())
            .then(successCallback, this.getStandardFailureCallback());
        },

        patch: function(uri, data, successCallback) {
            return $http.patch(uri, data, this.getHeaders())
            .then(successCallback, this.getStandardFailureCallback());
        },

        delete: function(uri, successCallback) {
            return $http.delete(uri, this.getHeaders())
            .then(successCallback, this.getStandardFailureCallback());
        },

        // API CALLS
        authenticate: function(data, successCallback) {
            this.post('/api/authenticate/', data, successCallback);
        },
        getUser: function(userId, successCallback) {
            this.get('/api/users/'+userId+'/', successCallback);
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
        }

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
            this.post('/api/sheet/' + $routeParams.sheetId + '/tablerollswap/', {}, successCallback);
        },
        getAllBenefitTables: function(successCallback) {
            this.get('/api/benefittable/', successCallback);
        },
        getSheetTableRolls: function(sheetId, successCallback) {
            this.get('/api/sheet/'+ $routeParams.sheetId +'/tableroll/', successCallback);
        },



    };
});