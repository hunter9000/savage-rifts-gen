
savageRiftsApp.factory('SheetService', function($window, $location) {
    return {
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
                    $location.path('/bonusbuy/' + sheet.id);
            }
            else if (sheet.creationStep == 'FINISHED') {
                // do nothing, we're here
            }

        }
    };
});