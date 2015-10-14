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
    }]).directive('deathCertificate', ['$q','observationsService','visitService', 'bedService','appService', 'spinner','$sce', function ($q,observationsService, visitService, bedService,appService, spinner, $sce) 
    {
        var link = function ($scope) 
        {
            $scope.displayStuff = false;
            var conceptNames = ["Death Note"];
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                    $scope.observations = response.data;
                    if($scope.observations.length > 0){
			            $scope.displayStuff = true;                    
                    }

                }));
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/deathCertificate.html";
            
            spinner.forPromise($q.all([bedService.getAssignedBedForPatient($scope.patient.uuid),visitService.getVisitSummary($scope.visitUuid)]).then(function(results){
                    $scope.bedDetails = results[0];
                    $scope.visitSummary = results[1].data;
                }));
                
        };
        var controller = function($scope){
        	$scope.htmlLabel = function(label){
        		return $sce.trustAsHtml(label)
        	}
        }
        return {
            restrict: 'E',
            link: link,
            controller : controller,
            template: '<ng-include src="contentUrl"/>'
        }
    }]).directive('deathFooter', ['observationsService','visitService','appService', 'spinner', function (observationsService,visitService,appService, spinner) 
    {
       var link = function ($scope) 
        {
        	 $scope.displayStuff = false;
            var conceptNames = ["Death Note"];
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                    $scope.observations = response.data;
                    if($scope.observations.length > 0){
			            $scope.displayStuff = true;                    
                    }

                }));
            
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/deathFooter.html";
            $scope.curDate=new Date();
        };

        return {
            restrict: 'E',
            link: link,
            template: '<ng-include src="contentUrl"/>',
        }
    }]).directive('dischargeSummary', ['$q','observationsService','visitService', 'bedService','appService', 'spinner', function ($q,observationsService, visitService, bedService,appService, spinner) 
    {
        var link = function ($scope) 
        {
           $scope.displayStuff = false;
            var conceptNames = ["Discharge Summary"];
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                    $scope.observations = response.data;
                    if($scope.observations.length > 0){
			            $scope.displayStuff = true;                    
                    }

                }));
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/dischargeSummary.html";
            
            spinner.forPromise($q.all([bedService.getAssignedBedForPatient($scope.patient.uuid),visitService.getVisitSummary($scope.visitUuid)]).then(function(results){
                    $scope.bedDetails = results[0];
                    $scope.visitSummary = results[1].data;
                }));
                
        };

        return {
            restrict: 'E',
            link: link,
            template: '<ng-include src="contentUrl"/>',
        }
    }]).directive('footerSummary', ['observationsService','visitService','appService', 'spinner', function (observationsService,visitService,appService, spinner) 
    {
       var link = function ($scope) 
        {
        console.log("inside this")
           $scope.displayStuff = false;
            var conceptNames = ["Discharge Summary"];
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                    $scope.observations = response.data;
                    if($scope.observations.length > 0){
			            $scope.displayStuff = true;                    
                    }

                }));
            
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/footerSummary.html";
                spinner.forPromise(visitService.getVisitSummary($scope.visitUuid).then(function(results){
					$scope.visitSummary = results.data;
					console.log('$scope.visitSummary',$scope.visitSummary)
					$scope.curDate=new Date();
                }));
        };

        return {
            restrict: 'E',
            link: link,
            template: '<ng-include src="contentUrl"/>',
        }
    }]).directive('commonFooter', ['observationsService','visitService','appService', 'spinner', function (observationsService,visitService,appService, spinner) 
    {
       var link = function ($scope) 
        {
        
        	$scope.displayStuff = false;
            
            $scope.displayStuff = false;
            var conceptNames = [$scope.conceptName];
            spinner.forPromise(observationsService.fetch($scope.$parent.patient.uuid, conceptNames, "latest", undefined, $scope.$parent.visitUuid, undefined).then(function (response) {
                    $scope.observations = response.data;
                    console.log($scope.observations);
                    if($scope.observations.length > 0){
			            $scope.displayStuff = true;                    
                    }

                }));
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/commonFooter.html";
            $scope.curDate=new Date();
        };

        return {
            restrict: 'E',
            link: link,
            scope: {
               conceptName:"@"
            },
            template: '<ng-include src="contentUrl"/>',
        }
    }]).directive('prescriptionFooter', ['observationsService','visitService','appService', 'spinner', function (observationsService,visitService,appService, spinner) 
    {
       var link = function ($scope) 
        {
        $scope.displayStuff = false;
            var conceptNames = ["Diagnosis Set of Sets"];
        
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            	$scope.observations = response.data;
	            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/prescription.html";
    	        $scope.curDate=new Date();
        	}));
        }

        return {
            restrict: 'E',
            link: link,
            template: '<ng-include src="contentUrl"/>',
        }
    }]);