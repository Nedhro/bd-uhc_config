'use strict';

angular.module('bahmni.common.displaycontrol.custom')
    .directive('birthCertificate', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
        var link = function ($scope) {
            var conceptNames = ["HEIGHT"];
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/birthCertificate.html";
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                $scope.observations = response.data;
            }));
        };

        return {
            restrict: 'E',
            template: '<ng-include src="contentUrl"/>',
            link: link
        }
    }]).directive('deathCertificate', ['$q', 'observationsService', 'visitService', 'bedService', 'appService', 'spinner', '$sce', function ($q, observationsService, visitService, bedService, appService, spinner, $sce) {
    var link = function ($scope) {
        $scope.displayStuff = false;
        var conceptNames = ["Date of death"];
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
            if ($scope.observations.length > 0) {
                $scope.displayStuff = true;
            }

        }));
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/deathCertificate.html";

        spinner.forPromise($q.all([bedService.getAssignedBedForPatient($scope.patient.uuid), visitService.getVisitSummary($scope.visitUuid)]).then(function (results) {
            $scope.bedDetails = results[0];
            $scope.visitSummary = results[1].data;
        }));

    };
    var controller = function ($scope) {
        $scope.htmlLabel = function (label) {
            return $sce.trustAsHtml(label)
        }
    }
    return {
        restrict: 'E',
        link: link,
        controller: controller,
        template: '<ng-include src="contentUrl"/>'
    }
}]).directive('deathFooter', ['observationsService', 'visitService', 'appService', 'spinner', function (observationsService, visitService, appService, spinner) {
    var link = function ($scope) {
        $scope.displayStuff = false;
        var conceptNames = ["Date of death"];
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
            if ($scope.observations.length > 0) {
                $scope.displayStuff = true;
            }

        }));

        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/deathFooter.html";
        $scope.curDate = new Date();
    };

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>',
    }
}]).directive('dischargeSummary', ['$q', 'observationsService', 'visitService', 'bedService', 'appService', 'spinner', function ($q, observationsService, visitService, bedService, appService, spinner) {
    var link = function ($scope) {
        $scope.displayStuff = false;
        var conceptNames = ["Discharge Summary"];
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
            if ($scope.observations.length > 0) {
                $scope.displayStuff = true;
            }

        }));
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/dischargeSummary.html";

        spinner.forPromise($q.all([bedService.getAssignedBedForPatient($scope.patient.uuid), visitService.getVisitSummary($scope.visitUuid)]).then(function (results) {
            $scope.bedDetails = results[0];
            $scope.visitSummary = results[1].data;
        }));

    };

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>',
    }
}]).directive('footerSummary', ['observationsService', 'visitService', 'appService', 'spinner', function (observationsService, visitService, appService, spinner) {
    var link = function ($scope) {
        $scope.displayStuff = false;
        var conceptNames = ["Discharge Summary"];
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
            if ($scope.observations.length > 0) {
                $scope.displayStuff = true;
            }

        }));

        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/footerSummary.html";
        spinner.forPromise(visitService.getVisitSummary($scope.visitUuid).then(function (results) {
            $scope.visitSummary = results.data;
            $scope.curDate = new Date();
        }));
    };

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>',
    }
}]).directive('commonFooter', ['observationsService', 'visitService', 'appService', 'spinner', function (observationsService, visitService, appService, spinner) {
    var link = function ($scope) {

        $scope.displayStuff = false;

        $scope.displayStuff = false;
        var conceptNames = [$scope.conceptName];
        spinner.forPromise(observationsService.fetch($scope.$parent.patient.uuid, conceptNames, "latest", undefined, $scope.$parent.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
            if ($scope.observations.length > 0) {
                $scope.displayStuff = true;
            }

        }));
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/commonFooter.html";
        $scope.curDate = new Date();
    };

    return {
        restrict: 'E',
        link: link,
        scope: {
            conceptName: "@"
        },
        template: '<ng-include src="contentUrl"/>',
    }
}]).directive('prescriptionFooter', ['treatmentService', 'visitService', 'appService', 'spinner', function (treatmentService, visitService, appService, spinner) {
    var link = function ($scope) {
        spinner.forPromise(treatmentService.getPrescribedAndActiveDrugOrders($scope.patient.uuid, undefined, false, [$scope.visitUuid]).then(function (response) {
            $scope.drugOrders = response.data;

            var audits = _.map($scope.drugOrders.visitDrugOrders, function (drugOrder) {
                return _.pick(drugOrder, 'creatorName', 'provider');
            });
            var auditDisplay = _.map(audits, function (audit) {
                return audit.creatorName == audit.provider.name ? audit.provider.name : audit.creatorName + " on behalf of " + audit.provider.name;
            });
            $scope.displayName = _.uniq(auditDisplay)
            if (_.isEmpty($scope.drugOrders)) {
                $scope.$emit("no-data-present-event");
            }

            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/prescription.html";
            $scope.curDate = new Date();
        }));
    }

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>',
    }
}]).directive('endPrescription', ['treatmentService', 'visitService', 'appService', 'spinner', function (treatmentService, visitService, appService, spinner) {
    var link = function ($scope) {
        spinner.forPromise(treatmentService.getPrescribedAndActiveDrugOrders($scope.patient.uuid, undefined, false, [$scope.visitUuid]).then(function (response) {
            $scope.drugOrders = response.data;

            var audits = _.map($scope.drugOrders.visitDrugOrders, function (drugOrder) {
                return _.pick(drugOrder, 'creatorName', 'provider');
            });
            var auditDisplay = _.map(audits, function (audit) {
                return audit.creatorName == audit.provider.name ? audit.provider.name : audit.creatorName + " on behalf of " + audit.provider.name;
            });
            $scope.displayName = _.uniq(auditDisplay);
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/endprescription.html";
            $scope.curDate = new Date();
        }));
    }

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>',
    }
}]).directive('headerPadWhiteSpace', ['appService', '$sce', function (appService, $sce) {
    var link = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/headerPadWhiteSpace.html";
    }

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>'
    }
}]).directive('treatmentPrescription', ['appService', 'treatmentService', 'visitService', 'spinner', '$sce', function (appService, treatmentService, visitService, spinner, $sce) {
    var link = function ($scope) {
        spinner.forPromise(treatmentService.getPrescribedAndActiveDrugOrders($scope.patient.uuid, undefined, false, [$scope.visitUuid]).then(function (response) {
            $scope.drugOrders = response.data;

            var audits = _.map($scope.drugOrders.visitDrugOrders, function (drugOrder) {
                return _.pick(drugOrder, 'creatorName', 'provider');
            });
            var auditDisplay = _.map(audits, function (audit) {
                return audit.creatorName == audit.provider.name ? audit.provider.name : audit.creatorName + " on behalf of " + audit.provider.name;
            });
            $scope.displayName = _.uniq(auditDisplay);
            $scope.frequencyList = [];
            $scope.frequencyList["Once a day"] = "";
            if ($scope.drugOrders.visitDrugOrders.length == 0) {
                $scope.isDataAvailable = false;
            }



            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/treatmentPrescription.html";
            $scope.curDate = new Date();
        }));
    }

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>'
    }
}]).directive("medicineDetails", function () {
    let template = "";

    var link = function ($scope) {
        let doseUnits = $scope.drugOrder.dosingInstructions.doseUnits.split(" ").length > 0 ?
            $scope.drugOrder.dosingInstructions.doseUnits.split(" ")[0] : $scope.drugOrder.dosingInstructions.doseUnits;
        var instructionList = JSON.parse($scope.drugOrder.dosingInstructions.administrationInstructions);
        $scope.instruction = (instructionList.instructions ? instructionList.instructions : '') + ' ' + (instructionList.additionalInstructions ? instructionList.additionalInstructions : '');
        switch ($scope.drugOrder.dosingInstructions.frequency) {
            case 'Once a day' : {
                if($scope.instruction.includes('morning')) {
                    $scope.dosageFrequency = $scope.drugOrder.dosingInstructions.dose + "-0-0 (" + doseUnits + ")";
                } else {
                    $scope.dosageFrequency = "0-0-" + $scope.drugOrder.dosingInstructions.dose + " (" + doseUnits + ")";
                }
                break;
            }

            case 'Twice a day' : $scope.dosageFrequency = $scope.drugOrder.dosingInstructions.dose + "-0-" +
                $scope.drugOrder.dosingInstructions.dose  + " (" + doseUnits + ")";
                break;
            case 'Thrice a day' : $scope.dosageFrequency = $scope.drugOrder.dosingInstructions.dose + "-" +
                $scope.drugOrder.dosingInstructions.dose + "-" + $scope.drugOrder.dosingInstructions.dose + " (" + doseUnits + ")";
                break;
            default: $scope.dosageFrequency = ("" + $scope.drugOrder.dosingInstructions.dose +
                " " + doseUnits + " " + " (" + $scope.drugOrder.dosingInstructions.frequency + ")");

        }
    };
    return {
        scope: {
            'drugOrder': '=',
            'index': '='
        },
        link: link,
        template: "{{index + 1}}.\n" +
            "        <span>{{drugOrder.drugNonCoded ? drugOrder.drugNonCoded : drugOrder.drug.name}}</span>\n" +
            "        <span>{{drugOrder.drug != null ? ('('+ drugOrder.drug.form + ')') : ''}}</span>\n" +
            "        <br/>" +
            "        <span style='padding-left: 15px'>{{dosageFrequency}}</span>" +
            "        ({{instruction}})" +
            "         <span style='padding-left: 10px'>-{{drugOrder.duration}}</span>" +
            "         <span>{{drugOrder.durationUnits}}</span>" +
            "        <br/><br/>"
    };
}).directive('labInvestigation', ['appService', 'labOrderResultService', 'treatmentService', 'visitService', 'spinner', '$http',
    function (appService, labOrderResultService, treatmentService, visitService, spinner, $http) {
    var link = function ($scope) {
        var params = {
            visitUuids: $scope.$parent.visitUuid
        };
        $http.get(Bahmni.Common.Constants.bahmniLabOrderResultsUrl, {
            method: "GET",
            params: params,
            withCredentials: true
        }).success(function (response) {
            $scope.investigationResults = response.results;
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/labInvestigation.html";
            $scope.curDate = new Date();
        });
    };

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>'
    }
    }]).directive('dischargedAdvice', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
    var link = function ($scope) {
        var conceptNames = ["Additional advice"];
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/dischargedAdvice.html";
        }));
    };

    return {
        restrict: 'E',
        template: '<ng-include src="contentUrl"/>',
        link: link
    }
}]).directive('dischargedSurgicalNote', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
    var link = function ($scope) {
        var conceptNames = ["OT Surgery Notes", "Radiology Notes"];
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            if (response.data.length > 0) {
                for (var i = 0; i < response.data.length; i++) {
                    if (response.data[i].concept.name == 'OT Surgery Notes') {
                        $scope.otSurgicalNote = response.data[i].value;
                    }
                    if (response.data[i].concept.name == 'Radiology Notes') {
                        $scope.radiologyNote = response.data[i].value;
                    }
                }
            }
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/dischargedSurgicalNote.html";
        }));
    };

    return {
        restrict: 'E',
        template: '<ng-include src="contentUrl"/>',
        link: link
    }
}]).directive('dischargedFollowUpPlan', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
    var link = function ($scope) {
        var conceptNames = ["Follow up After", "Duration Coded Units"];
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            if (response.data.length > 0) {
                for (var i = 0; i < response.data.length; i++) {
                    if (response.data[i].concept.name == 'Follow up After') {
                        $scope.followUpAfter = response.data[i].value;
                    }
                    if (response.data[i].concept.name == 'Duration Coded Units') {
                        $scope.durationUnits = response.data[i].value.shortName;
                    }
                }
            }
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/dischargedFollowUpPlan.html";
        }));
    };

    return {
        restrict: 'E',
        template: '<ng-include src="contentUrl"/>',
        link: link
    }
}]);

