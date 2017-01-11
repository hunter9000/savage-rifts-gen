
savageRiftsApp.directive('knowledgeSkillAdd', function(APIService, $uibModal, $routeParams, $log) {
    return {
        templateUrl: "pages/templates/knowledge-skill-add-directive-template.html",
        restrict: 'E',
        scope: {
            refresh: '&'
        },
        controller: function ($scope) {
            $scope.knowledgeSkills = [];
            $scope.selectedKnowledgeSkill = {};

            APIService.getKnowledgeSkills($routeParams.sheetId, function(response) {
                $scope.knowledgeSkills = response.data;
            });

            $scope.buildName = function(knowledgeSkill) {
                var s = knowledgeSkill.name;
                if (knowledgeSkill.knowledgeCategory != 'NONE') {
                    s = s + ' (' + knowledgeSkill.knowledgeCategory + ')';
                }
                return s;
            }

            $scope.addExistingKnowledge = function() {
                APIService.addKnowledgeSkill($routeParams.sheetId, $scope.selectedKnowledgeSkill.id, function(response) {
                    $scope.refresh();
                });
            }

            $scope.openModal = function() {
                $uibModal.open({
                    animation: false,
                    templateUrl: 'knowledge-skill-add-modal-template.html',
                    controller: 'KnowledgeSkillAddModalController',
                    size: 'md',
                    resolve: {
                        sheetId: function () {
                            return $routeParams.sheetId;
                        }
                    }
                })
                .result.then(function (/*sheet*/) {
                //                $scope.deleteSheet(sheet.id);
                }, function () {
                     $log.debug('Modal dismissed at: ' + new Date());
                });
            }
        }
    };
});


// controller for the modal window
savageRiftsApp.controller('KnowledgeSkillAddModalController', function (APIService, $scope, $uibModalInstance) {
    $scope.knowledgeCategories = [];

    $scope.selectedKnowledgeCategory = {};
    $scope.selectedKnowledgeName = '';

    APIService.getKnowledgeCategories(function(response) {
        $scope.knowledgeCategories = response.data;
    });


    $scope.addNewKnowledge = function() {

    }

    $scope.ok = function () {
        $uibModalInstance.close(/*$scope.sheet*/);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});