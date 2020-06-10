'use strict';

angular.module('bahmni.common.displaycontrol.custom')
    .directive('commonPatientInfoHeader', ['appService', '$sce', function (appService, $sce) {
        var link = function ($scope) {
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/commonPatientInfoHeader.html";
        }
        return {
            restrict: 'E',
            link: link,
            template: '<ng-include src="contentUrl"/>'
        }
    }])
    .directive('commonPatientAdditionalInfoHeader', ['appService', '$sce', function (appService, $sce) {
        var link = function ($scope) {
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/commonPatientAdditionalInfoHeader.html";
        }
        return {
            restrict: 'E',
            link: link,
            template: '<ng-include src="contentUrl"/>'
        }
    }])
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
    }])
    .directive('deathCertificate', ['$q', 'observationsService', 'visitService', 'bedService', 'appService', 'spinner', '$sce', function ($q, observationsService, visitService, bedService, appService, spinner, $sce) {
        var link = function ($scope) {
            $scope.displayStuff = false;
            var conceptNames = ["Date of death", "Death Notes, Citizenship", "Death Notes, Religion"];
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                $scope.observations = response.data;

                if ($scope.observations.length > 0) {
                    $scope.displayStuff = true;
                    for (var i = 0; i < response.data.length; i++) {
                        if (response.data[i].concept.name == 'Date of death') {
                            $scope.dateOfDeath = response.data[i].value;
                        }
                        if (response.data[i].concept.name == 'Death Notes, Citizenship') {
                            $scope.deathNotesCitizenship = response.data[i].value;
                        }
                        if (response.data[i].concept.name == 'Death Notes, Religion') {
                            $scope.deathNotesReligion = response.data[i].value.shortName;
                        }
                    }
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
    }])
    .directive('admissionDetailsInfo', ['$q', 'observationsService', 'visitService', 'bedService', 'appService', 'spinner', '$sce','$http', function ($q, observationsService, visitService, bedService, appService, spinner, $sce, $http) {
        var link = function ($scope) {
            $scope.displayStuff = false;
            spinner.forPromise($q.all([bedService.getAssignedBedForPatient($scope.patient.identifier), visitService.getVisitSummary($scope.visitUuid)]).then(function (results) {
                var patientIdentifier = $scope.patient.identifier.toString();
                $q.all([getAdmissionInfo(patientIdentifier)]).then(function (response) {
                    if (response[0].data.length > 0) {
                        $scope.wardName = response[0].data[0].name;
                        $scope.bedNumber = response[0].data[0].bed_number;
                        $scope.admissionDate = response[0].data[0].date_created;
                        $scope.releaseDate = response[0].data[0].date_stopped;
                        var parentId= response[0].data[0].parent_location;
                        $q.all([getAdmissionRoomInfo(parentId)]).then(function (response) {
                            if (response[0].data.length > 0) {
                                $scope.roomName = response[0].data[0].name;
                            }
                        });
                        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/admissionDetailsInfo.html";
                    }
                });
            }));

        };
        var controller = function ($scope) {
            $scope.htmlLabel = function (label) {
                return $sce.trustAsHtml(label)
            }
        };
        var getAdmissionInfo = function (patientIdentifier) {
            var params = {
                q: "bahmni.sqlGet.bedMapInfo",
                v: "full",
                patientIdentifier: patientIdentifier
            };
            return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                method: "GET",
                params: params,
                withCredentials: true
            });
        };
        var getAdmissionRoomInfo = function (parentId) {
            var params = {
                q: "bahmni.sqlGet.bedMapRoomInfo",
                v: "full",
                parentId: parentId
            };
            return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                method: "GET",
                params: params,
                withCredentials: true
            });
        };

        return {
            restrict: 'E',
            link: link,
            controller: controller,
            template: '<ng-include src="contentUrl"/>'
        }
    }])
    .directive('deathFooter', ['observationsService', 'visitService', 'appService', 'spinner', function (observationsService, visitService, appService, spinner) {
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
    }])
    .directive('dischargeSummary', ['$q', 'observationsService', 'visitService', 'bedService', 'appService', 'spinner', function ($q, observationsService, visitService, bedService, appService, spinner) {
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
}]).directive('prescriptionFooter', ['observationsService', 'treatmentService', 'labOrderResultService', 'visitService', 'appService', 'spinner', '$q', '$http',
    function (observationsService, treatmentService, labOrderResultService, visitService, appService, spinner, $q, $http) {
        var link = function ($scope) {
            spinner.forPromise(treatmentService.getPrescribedAndActiveDrugOrders($scope.patient.uuid, undefined, false, [$scope.visitUuid]).then(function (response) {
                if (response.data.visitDrugOrders.length > 0) {
                    var visitDrugOrders = response.data.visitDrugOrders[0];
                    var provider = visitDrugOrders.provider;
                    $scope.providerName = provider.name;
                    var providerUuid = provider.uuid;

                    $q.all([getProviderDesignation(providerUuid)]).then(function (response) {
                        if (response[0].data.length > 0) {
                            for (var i = 0; i < response[0].data.length; i++) {
                                if (response[0].data[i].name == 'Designation') {
                                    $scope.providerDesignation = response[0].data[i].value_reference;
                                }
                                if (response[0].data[i].name == 'Organization') {
                                    $scope.providerOrganization = response[0].data[i].value_reference;
                                }
                            }
                        }
                        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/prescription.html";
                        $scope.curDate = new Date();
                    });
                } else {
                    var params = {
                        visitUuids: $scope.$parent.visitUuid
                    };
                    $http.get(Bahmni.Common.Constants.bahmniLabOrderResultsUrl, {
                        method: "GET",
                        params: params,
                        withCredentials: true
                    }).success(function (response) {
                        if (response.results.length > 0) {
                            var orderUuid = response.results[0].orderUuid;
                            if (orderUuid) {
                                $q.all([getProviderUuid(orderUuid)]).then(function (response) {
                                    if (response[0].data.length > 0) {
                                        var providerUuid = response[0].data[0].uuid;
                                        $scope.providerName = response[0].data[0].given_name + (response[0].data[0].middle_name ? (' ' + response[0].data[0].middle_name) : '') + ' ' + response[0].data[0].family_name;
                                        if (providerUuid) {
                                            $q.all([getProviderDesignation(providerUuid)]).then(function (response) {
                                                if (response[0].data.length > 0) {
                                                    for (var i = 0; i < response[0].data.length; i++) {
                                                        if (response[0].data[i].name == 'Designation') {
                                                            $scope.providerDesignation = response[0].data[i].value_reference;
                                                        }
                                                        if (response[0].data[i].name == 'Organization') {
                                                            $scope.providerOrganization = response[0].data[i].value_reference;
                                                        }

                                                    }
                                                }
                                                $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/prescription.html";
                                                $scope.curDate = new Date();
                                            });
                                        }
                                    }
                                });
                            }
                        } else {
                            var conceptNames = ["Consultation Note"];
                            spinner.forPromise(observationsService.fetch($scope.$parent.patient.uuid, conceptNames, "latest", undefined, $scope.$parent.visitUuid, undefined).then(function (response) {
                                if (response.data.length > 0) {
                                    var providerUuid = response.data[0].providers[0].uuid;
                                    $scope.providerName = response.data[0].providers[0].name;

                                    $q.all([getProviderDesignation(providerUuid)]).then(function (response) {
                                        if (response[0].data.length > 0) {
                                            for (var i = 0; i < response[0].data.length; i++) {

                                                if (response[0].data[i].name == 'Designation') {
                                                    $scope.providerDesignation = response[0].data[i].value_reference;
                                                }
                                                if (response[0].data[i].name == 'Organization') {
                                                    $scope.providerOrganization = response[0].data[i].value_reference;
                                                }
                                            }
                                        }
                                        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/prescription.html";
                                        $scope.curDate = new Date();
                                    });
                                }
                            }));
                        }
                    });
                }
            }));
            var getProviderDesignation = function (providerUuid) {
                var params = {
                    q: "bahmni.sqlGet.providerDesignation2",
                    v: "full",
                    providerUuid: providerUuid
                };
                return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                    method: "GET",
                    params: params,
                    withCredentials: true
                });
            };

            var getProviderUuid = function (orderUuid) {
                var params = {
                    q: "bahmni.sqlGet.orderUuid",
                    v: "full",
                    orderUuid: orderUuid
                };
                return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                    method: "GET",
                    params: params,
                    withCredentials: true
                });
            };
        }

        return {
            restrict: 'E',
            link: link,
            template: '<ng-include src="contentUrl"/>',
        }
    }]).directive('medicalFooter', ['observationsService', '$q', 'appService', 'spinner', '$http', function (observationsService, $q, appService, spinner, $http) {
    var link = function ($scope) {

        var conceptNames = ["Medical Certificate, Suffering From"];
        spinner.forPromise(observationsService.fetch($scope.$parent.patient.uuid, conceptNames, "latest", undefined, $scope.$parent.visitUuid, undefined).then(function (response) {
            if (response.data.length > 0) {
                var providerUuid = response.data[0].providers[0].uuid;
                $scope.providerName = response.data[0].providers[0].name;

                $q.all([getProviderDesignation(providerUuid)]).then(function (response) {
                    if (response[0].data.length > 0) {
                        for (var i = 0; i < response[0].data.length; i++) {
                            if (response[0].data[i].name == 'Designation') {
                                $scope.providerDesignation = response[0].data[i].value_reference;
                            }
                            if (response[0].data[i].name == 'BMDC Number') {
                                $scope.providerBMDCNumber = response[0].data[i].value_reference;
                            }
                        }
                    }
                    $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/medicalFooter.html";
                    $scope.curDate = new Date();
                });
            }
        }));
        var getProviderDesignation = function (providerUuid) {
            var params = {
                q: "bahmni.sqlGet.providerDesignation2",
                v: "full",
                providerUuid: providerUuid
            };
            return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                method: "GET",
                params: params,
                withCredentials: true
            });
        };
    }

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>',
    }
}])
    .directive('dischargedFooter', ['observationsService', '$q', 'appService', 'spinner', '$http', function (observationsService, $q, appService, spinner, $http) {
        var link = function ($scope) {

            var conceptNames = ["Inpatient Outcome"];
            spinner.forPromise(observationsService.fetch($scope.$parent.patient.uuid, conceptNames, "latest", undefined, $scope.$parent.visitUuid, undefined).then(function (response) {
                if (response.data.length > 0) {
                    var providerUuid = response.data[0].providers[0].uuid;
                    $scope.providerName = response.data[0].providers[0].name;

                    $q.all([getProviderDesignation(providerUuid)]).then(function (response) {
                        if (response[0].data.length > 0) {
                            for (var i = 0; i < response[0].data.length; i++) {
                                if (response[0].data[i].name == 'Designation') {
                                    $scope.providerDesignation = response[0].data[i].value_reference;
                                }
                                if (response[0].data[i].name == 'BMDC Number') {
                                    $scope.providerBMDCNumber = response[0].data[i].value_reference;
                                }
                            }
                        }
                        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/dischargedFooter.html";
                        $scope.curDate = new Date();
                    });
                }
            }));
            var getProviderDesignation = function (providerUuid) {
                var params = {
                    q: "bahmni.sqlGet.providerDesignation2",
                    v: "full",
                    providerUuid: providerUuid
                };
                return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                    method: "GET",
                    params: params,
                    withCredentials: true
                });
            };
        }

        return {
            restrict: 'E',
            link: link,
            template: '<ng-include src="contentUrl"/>',
        }
    }])
    .directive('endPrescription', ['treatmentService', 'visitService', 'appService', 'spinner', function (treatmentService, visitService, appService, spinner) {
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
}])
    .directive("medicineDetails", function () {
        let template = "";
        var link = function ($scope) {
            $scope.instruct = JSON.parse($scope.drugOrder.dosingInstructions.administrationInstructions);
            let doseUnits = $scope.drugOrder.dosingInstructions.doseUnits.split(" ").length > 0 ?
                $scope.drugOrder.dosingInstructions.doseUnits.split(" ")[0] : $scope.drugOrder.dosingInstructions.doseUnits;
            let dose=$scope.drugOrder.dosingInstructions.dose;
            function CheckDecimal(num)
            {
                if(Number(num) === num && num % 1 !== 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            $scope.testNumber = "";
            let numbersE = {
                0:'০',
                1:'১',
                2:'২',
                3:'৩',
                4:'৪',
                5:'৫',
                6:'৬',
                7:'৭',
                8:'৮',
                9:'৯'
            };

            $scope.replaceNumbersE2B = function (input) {
                var output = [];
                for (var i = 0; i < input.length; ++i) {
                    if (numbersE.hasOwnProperty(input[i])) {
                        output.push(numbersE[input[i]]);
                    } else {
                        output.push(input[i]);
                    }
                }
                return output.join('');
            };
            $scope.convertToBangla=function (num) {
                let dose=num;
                    if(dose===1) {
                      return dose = '<b>'+'১'+'</b>';
                    }else if(dose===2) {
                        return  dose= '<b>'+'২'+'</b>';
                    } else if(dose===3) {
                        return dose= '<b>'+'৩'+'</b>';
                    } else if(dose===4) {
                        return dose= '<b>'+'৪'+'</b>';
                    } else if(dose===5) {
                        return dose= '<b>'+'৫'+'</b>';
                    } else if(dose===6) {
                        return dose= '<b>'+'৬'+'</b>';
                    } else if(dose===7) {
                        return dose= '<b>'+'৭'+'</b>';
                    } else if(dose===8) {
                        return dose= '<b>'+'৮'+'</b>';
                    } else if(dose===9) {
                        return dose= '<b>'+'৯'+'</b>';
                    } else if(dose===0) {
                        return dose= '<b>'+'০'+'</b>';
                    }
            }
            if(CheckDecimal(dose)===true){
                //০ ১ ২ ৩ ৪ ৫ ৬ ৭ ৮ ৯
                let doseArray= new Array();
                doseArray=dose.toString().split('.');
                if(doseArray[0] === '1') {
                    doseArray[0] = '১';
                }else if(doseArray[0]=== '2') {
                    doseArray[0]= '২';
                } else if(doseArray[0] === '3') {
                    doseArray[0]= '৩';
                } else if(doseArray[0] === '4') {
                    doseArray[0]= '৪';
                } else if(doseArray[0] === '5') {
                    doseArray[0]= '৫';
                } else if(doseArray[0] === '6') {
                    doseArray[0]= '৬';
                } else if(doseArray[0] === '7') {
                    doseArray[0]= '৭';
                } else if(doseArray[0] === '8') {
                    doseArray[0]= '৮';
                } else if(doseArray[0] === '9') {
                    doseArray[0]= '৯';
                } else if(doseArray[0] === '0') {
                    doseArray[0]= '';
                }
                if(doseArray[1] === '25'){
                    dose = '<b>'+doseArray[0]+'</b>'+'<span><sup>১</sup>&frasl;<sub>৪</sub></span>';
                } else if(doseArray[1] === '33'){
                    dose = '<b>'+doseArray[0]+'</b>'+'<span><sup>১</sup>&frasl;<sub>৩</sub></span>';
                } else if(doseArray[1] === '5'){
                    dose = '<b>'+doseArray[0]+'</b>'+'<span><sup>১</sup>&frasl;<sub>২</sub></span>';
                } else if(doseArray[1] === '67'){
                    dose = '<b>'+doseArray[0]+'</b>'+'<span><sup>২</sup>&frasl;<sub>৩</sub></span>';
                } else if(doseArray[1] === '75'){
                    dose = '<b>'+doseArray[0]+'</b>'+'<span><sup>৩</sup>&frasl;<sub>৪</sub></span>';
                }
            } else{
                if(dose===1) {
                     dose = '<b>'+'১'+'</b>';
                }else if(dose===2) {
                      dose= '<b>'+'২'+'</b>';
                } else if(dose===3) {
                     dose= '<b>'+'৩'+'</b>';
                } else if(dose===4) {
                     dose= '<b>'+'৪'+'</b>';
                } else if(dose===5) {
                     dose= '<b>'+'৫'+'</b>';
                } else if(dose===6) {
                     dose= '<b>'+'৬'+'</b>';
                } else if(dose===7) {
                     dose= '<b>'+'৭'+'</b>';
                } else if(dose===8) {
                     dose= '<b>'+'৮'+'</b>';
                } else if(dose===9) {
                     dose= '<b>'+'৯'+'</b>';
                } else if(dose===0) {
                     dose= '<b>'+'০'+'</b>';
                }
            }
            let plusSign=' + ';
            let zeroSign='<b>0</b>';
            var instructionList = JSON.parse($scope.drugOrder.dosingInstructions.administrationInstructions);
            $scope.instruction = (instructionList.instructions ? instructionList.instructions : '') + ' ' + (instructionList.additionalInstructions ? instructionList.additionalInstructions : '');
            switch ($scope.drugOrder.dosingInstructions.frequency) {

                case 'Once a day (Morning)' :
                    $scope.dosageFrequency = dose + plusSign + zeroSign + plusSign + zeroSign + " (" + doseUnits + ")";
                    break;

                case 'Once a Day (Noon)' :
                    $scope.dosageFrequency = zeroSign+plusSign+ dose +plusSign+zeroSign+ " (" + doseUnits + ")";
                    break;

                case 'Once a Day (Evening)' :
                    $scope.dosageFrequency = zeroSign+plusSign+zeroSign+plusSign+ dose + "(" + doseUnits + ")";
                    break;

                case 'Twice a day' :
                    $scope.dosageFrequency = dose +plusSign+zeroSign+ plusSign+ dose + " (" + doseUnits + ")";
                    break;
                case 'Every 12 hours' :
                    $scope.dosageFrequency = dose +plusSign+zeroSign+plusSign+ dose + " (" + doseUnits + ")";
                    break;
                case 'Thrice a day' :
                    $scope.dosageFrequency = dose +plusSign+ dose + plusSign + dose + " (" + doseUnits + ")";
                    break;
                case 'Every 8 hours' :
                    $scope.dosageFrequency = dose +plusSign+ dose + plusSign + dose + " (" + doseUnits + ")";
                    break;
                case 'Every 2 hours' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( প্রতি ২ ঘন্টা পরপর )");
                    break;
                case 'Every 3 hours' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( প্রতি ৩ ঘন্টা পরপর )");
                    break;
                case 'Every 4 hours' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( প্রতি ৪ ঘন্টা পরপর )");
                    break;
                case 'Every 6 hours' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( প্রতি ৬ ঘন্টা পরপর )");
                    break;
                case 'On alternate days' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( একদিন পরপর )");
                    break;
                case 'Six days a week' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( সপ্তাহে ৬ দিন )");
                    break;
                case 'Five days a week' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( সপ্তাহে ৫ দিন )");
                    break;
                case 'Four days a week' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( সপ্তাহে ৪ দিন )");
                    break;
                case 'Five times a day' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( দিনে ৫ বার )");
                    break;
                case 'Once a month' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( মাসে ১ বার )");
                    break;
                case 'Every 3 weeks' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( ৩ সপ্তাহ পরপর )");
                    break;
                case 'Every 2 weeks' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( ২ সপ্তাহ পরপর )");
                    break;
                case 'Thrice a week' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( সপ্তাহে ৩ দিন )");
                    break;
                case 'Twice a week' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( সপ্তাহে ২ দিন )");
                    break;
                case 'Once a week' :
                    $scope.dosageFrequency = (" " + dose +
                        " " + doseUnits + " " + " ( সপ্তাহে ১ দিন )");
                    break;
                case 'Every Hour' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( প্রতি ঘণ্টায় )");
                    break;
                case 'Four times a day' :
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " ( দিনে ৪ বার )");
                    break;
                default:
                    $scope.dosageFrequency = ("" + dose +
                        " " + doseUnits + " " + " (" + $scope.drugOrder.dosingInstructions.frequency + ")");
            }
        };
        return {
            scope: {
                'drugOrder': '=',
                'index': '='
            },
            link: link,
            template: "<div style='padding-bottom: 5px'><b>{{index + 1}}.\n" +
                "<span>{{drugOrder.drugNonCoded ? drugOrder.drugNonCoded : drugOrder.drug.name}}</span></b>\n" +
                "<span>{{drugOrder.drug != null ? ('('+ drugOrder.drug.form + ')') : ''}}</span>\n" +
                "<br/></div>" +
                "<span style='padding-left: 15px' ng-if='drugOrder.dosingInstructions.dose != null' ng-bind-html='dosageFrequency'></span> " +
                "<span style='padding-left: 15px' ng-if='drugOrder.dosingInstructions.dose == null' >" +
                "<span ng-bind-html='::convertToBangla(instruct.morningDose)'></span> + " +
                "<span ng-bind-html='::convertToBangla(instruct.afternoonDose)'></span> + " +
                "<span ng-bind-html='::convertToBangla(instruct.eveningDose)'></span> <span>{{drugOrder.drug != null ? ('('+ drugOrder.drug.form + '(s)) ') : ''}}</span> </span>" +
                "<span ng-if='instruction.length > 1'>({{instruction}})</span>" + "-"+
                "<span style='padding-left: 0px;font-weight: bolder;' > {{replaceNumbersE2B((drugOrder.duration).toString())}} </span>" +
                "<span ng-if = 'drugOrder.durationUnits == \"Day(s)\"'>দিন</span>" +
                "<span ng-if = 'drugOrder.durationUnits == \"Week(s)\"'>সপ্তাহ</span>" +
                "<span ng-if = 'drugOrder.durationUnits == \"Month(s)\"'>মাস</span>" +
                "<br/><br/>"
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
}]).directive('medicalCertificate', ['observationsService', 'visitService', 'appService', 'spinner', function (observationsService, visitService, appService, spinner) {
    var link = function ($scope) {
        $scope.displayStuff = false;
        var conceptNames = ["Medical Certificate, Suffering From", "Medical, For", "Medical Certificate, Duration Coded Units",
            "Medical Certificate, Previous Complications", "Medical Certificate, Advice Name",
            "Medical Certificate, From Date", "Medical Certificate, To Date", "Medical Certificate, General Complication Name"];


        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
            if (response.data.length > 0) {
                for (var i = 0; i < response.data.length; i++) {
                    if (response.data[i].concept.name == 'Medical Certificate, Suffering From') {
                        $scope.medicalSufferingFrom = response.data[i].value;
                    }
                    if (response.data[i].concept.name == 'Medical, For') {
                        $scope.medicalSufferingFor = response.data[i].value;
                    }
                    if (response.data[i].concept.name == 'Medical Certificate, Duration Coded Units') {
                        $scope.medicalDurationCodeUnit = response.data[i].value.shortName;
                    }
                    if (response.data[i].concept.name == 'Medical Certificate, Previous Complications') {
                        $scope.medicalPreviousComplication = response.data[i].value;
                    }
                    if (response.data[i].concept.name == 'Medical Certificate, Advice Name') {
                        $scope.adviceName = response.data[i].value;
                    }
                    if (response.data[i].concept.name == 'Medical Certificate, From Date') {
                        $scope.medicalFromDate = response.data[i].value;
                    }
                    if (response.data[i].concept.name == 'Medical Certificate, To Date') {
                        $scope.medicalToDate = response.data[i].value;
                    }
                    if (response.data[i].concept.name == 'Medical Certificate, General Complication Name') {
                        $scope.medicalGeneralComplicationName = response.data[i].value.split(',');
                    }
                }
            }
            if ($scope.observations.length > 0) {
                $scope.displayStuff = true;
            }
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/medicalCertificate.html";
            $scope.curDate = new Date();
        }));
    }

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>',
    }
}])
    .directive('prescriptionHeader', ['appService', '$sce', function (appService, $sce) {
    var link = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/prescriptionHeader.html";
    };

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>'
    };
}]).directive('prescriptionBody', ['appService', '$sce', function (appService, $sce) {
    var link = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/prescriptionBody.html";
    };
    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>'
    };
}]).directive('chiefComplaintTemplate', ['observationsService','appService', 'spinner', function (observationsService, appService, spinner) {
    var link = function ($scope) {
        var conceptNames = ["Condition Complaint Template"];
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data[0];
            $scope.convertToUnits=function (minutes) {
                var durationForDisplay = Bahmni.Common.Util.DateUtil.convertToUnits(minutes);
                if (durationForDisplay["value"] && durationForDisplay["unitName"]) {
                    return "since " + durationForDisplay["value"] + " " + durationForDisplay["unitName"];
                }
            }
        }));
    };
    return {
        restrict: 'E',
        template:'<h2 class="section-title">{{config.title}}</h2>'+
            '<div><br> ' +
            '<ul><li ng-repeat="chiefComplaint in observations.groupMembers" style="padding-bottom: 5px">' +
            '<span style="padding-left: 5px"><b> {{$index + 1}}. </b>{{chiefComplaint.value.shortName}} ( {{::convertToUnits(chiefComplaint.duration)}} )</span>' +
            '</li></ul></div>',
        link: link
    };
}]).directive('physicalExaminationTemplate', ['observationsService','appService', 'spinner', function (observationsService, appService, spinner) {
    var link = function ($scope) {
        var conceptNames = ["Vitals"];
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.physicalExamObs = response.data[0];
        }));
    };
    return {
        restrict: 'E',
        template:
            '<div><br> ' +
            '<ul><li ng-repeat="results in physicalExamObs.groupMembers" style="padding-bottom: 3px">' +
            '<span style="padding-left: 5px"><b>{{results.concept.name}}</b> : {{ results.value }} {{ results.concept.units}}</span>' +
            '</li></ul></div>',
        link: link
    };
}])
    .directive('clinicalDiagnosisTemplate', ['$q', 'observationsService', 'appService', '$http',
        function ($q, observationsService, appService, $http) {
        var link = function ($scope) {
           /* let conceptNames = ["Coded Diagnosis","Diagnosis Certainty","Diagnosis Order","Bahmni Diagnosis Status", "Visit Diagnoses"];
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                $scope.obsDiagnosis = response.data;
                console.log($scope.obsDiagnosis);
            }));*/
            var params = {
                patientUuid: $scope.patient.uuid, visitUuid: $scope.visitUuid
            };
            $http.get(Bahmni.Common.Constants.bahmniDiagnosisUrl, {
                method: "GET",
                params: params,
                withCredentials: true
            }).success(function (response) {
                $scope.obsDiagnosis = response;
            });
        };

        return {
            restrict: 'E',
            link: link,
            template: '<h2 class="section-title">{{config.title}}</h2>' +
                '<div style="padding-bottom: 10px" > <br>' +
                '<span><ul>\n' +
                '        <li ng-repeat="obsGroup in obsDiagnosis">\n' +
                '            <span style="padding-left: 5px;padding-top: 3px"><b> {{$index + 1}}. </b>{{obsGroup.codedAnswer.name}}</span>\n' +
                '        </li>\n' +
                '    </ul></span></div>',
        }
    }])
    .directive('medicationTemplate', ['appService', 'treatmentService', 'visitService', 'spinner', '$sce', function (appService, treatmentService, visitService, spinner, $sce) {
    var link = function ($scope) {
        spinner.forPromise(treatmentService.getPrescribedAndActiveDrugOrders($scope.patient.uuid, undefined, false, [$scope.visitUuid]).then(function (response) {
            $scope.drugOrders = response.data;
            $scope.frequencyList = [];
            $scope.frequencyList["Once a day"] = "";
            if ($scope.drugOrders.visitDrugOrders.length == 0) {
                $scope.isDataAvailable = false;
            }
            $scope.curDate = new Date();
        }));
    }

    return {
        restrict: 'E',
        link: link,
        template: '<h2 class="section-title">{{config.title}}</h2> <br>' +
            '<div ng-repeat="drugOrder in drugOrders.visitDrugOrders" style="font-size: 14px">\n' +
            '<span ng-if="drugOrder.dateStopped === null && drugOrder.action !== \'DISCONTINUE\'">\n' +
            '<medicine-details drug-order="drugOrder" index="$index"></medicine-details>\n' +
            '\n' +
            '    </span>\n' +
            '\n' +
            '</div>'
    }
}])
    .directive('investigationTemplate', ['appService', 'labOrderResultService', 'treatmentService', 'visitService', 'spinner', '$http',
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
                $scope.curDate = new Date();
            });
        };

        return {
            restrict: 'E',
            link: link,
            template: '<h2 class="section-title">{{config.title}}</h2>' +
                '<div><br>' +
                '<ul><li ng-repeat="lab in investigationResults" style="padding-bottom: 3px">' +
                '<span style="padding-left: 5px"><b> {{$index + 1}}. </b> {{lab.testName}}</span>' +
                '</li></ul></div>'
        }
    }])
    .directive('adviceTemplate', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
        var link = function ($scope) {
            var conceptNames = ["Consultation Note"];
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            if(response.data[0]){
                $scope.obsAdvice = response.data[0].value.split(',');
            }
             }));
        };

        return {
            restrict: 'E',
            template: '<h2 class="section-title">{{config.title}}</h2>' +
                '<div style="padding-bottom: 5px" > <br>' +
                '<span>' +
                '<ul style="display: block; list-style-type: square; padding-left: 20px;">' +
                '<li ng-repeat="advice in obsAdvice" style="padding-bottom: 5px">{{advice}}</li></ul>' +
                '</span></div>',
            link: link
        }
    }]);