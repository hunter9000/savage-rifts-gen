
savageRiftsApp.factory('SheetService', function(APIService, $window, $location) {
    var redirect = function(step, sheetId) {
        if (step == 'TABLE_ROLLS') {
            $location.path('/tablerolls/' + sheetId);
        }
        else if (step == 'TABLE_ROLL_SWAP') {
            $location.path('/tablerollswap/' + sheetId);
        }
        else if (step == 'RACE') {
            $location.path('/raceselection/' + sheetId);
        }
        else if (step == 'ATTRIBUTES') {
            $location.path('/attributebuy/' + sheetId);
        }
        else if (step == 'SKILLS') {
            $location.path('/skillbuy/' + sheetId);
        }
        else if (step == 'HINDRANCES') {
            $location.path('/hindrancebuy/' + sheetId);
        }
        else if (step == 'EDGES') {
            $location.path('/bonusbuy/' + sheetId);
        }
        else if (step == 'FINISHED') {
            $location.path('/editsheet/' + sheetId);
        }
        else {
            $location.path('/error');
        }
    };

    return {
        redirectToCreationStepsFromId: function(sheetId) {
            APIService.getSheetCreationStep(sheetId, function(response) {
                redirect(response.data, sheetId);
            });
        }
    };
});