
savageRiftsApp.factory('APIService', function($window, $location, $http) {
    return {
        getHeaders: function() {
            return { headers: {'x-access-token': $window.localStorage['jwtToken']} };
        },

        getStandardFailureCallback: function(response) {
            console.log(response);
            $location.path('/error');
        },

        get: function(uri, successCallback) {
            $http.get(uri, getHeaders())
            .then(successCallback, getStandardFailureCallback());
        },

        post: function(uri, data, successCallback) {
            return $http.post(uri, data, getHeaders())
            .then(successCallback, getStandardFailureCallback());
        },

        put: function(uri, data, successCallback) {
            return $http.put(uri, data, getHeaders())
            .then(successCallback, getStandardFailureCallback());
        },

        patch: function(uri, data, successCallback) {
            return $http.patch(uri, data, getHeaders())
            .then(successCallback, getStandardFailureCallback());
        },

        delete: function(uri, successCallback) {
            return $http.delete(uri, getHeaders())
            .then(successCallback, getStandardFailureCallback());
        },

        // API CALLS

        getSheets: function(successCallback) {
            get('/api/sheet/', successCallback);
        },
        deleteSheet: function(sheetId, successCallback) {
            delete('/api/sheet/'+sheetId+'/', successCallback);
        },

    };
});