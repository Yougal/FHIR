<!DOCTYPE html>
<html>
<head lang="en">
    <base href="/" />
    <meta charset="UTF-8">

	<script type="text/javascript">
	    var _contextPath = "${pageContext.request.contextPath}";
	</script>
    <script src="${pageContext.request.contextPath}/js/libs/jquery-1.9.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/libs/angular.min1-5.js"></script>

    <script src="${pageContext.request.contextPath}/js/libs/ui-bootstrap-tpls-2.0.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/libs/lodash.core.js"></script>
    <script src="${pageContext.request.contextPath}/js/libs/moment.min.js"></script>

  	<script src="${pageContext.request.contextPath}/js/libs/lodash.core.js"></script>
    <script src="${pageContext.request.contextPath}/js/libs/moment.min.js"></script>
     <link rel="stylesheet" type="text/css"
          href="https://www.uhc.com/etc/designs/uhcdotcom/clientlibs/responsive/themes/default.min.8d633391e39b92fcbce01bc23f2bcce4.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animateLoader.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jsTreeStyle.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jsTreeThemes/proton/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vis.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-datepicker3.min.css"/>
    <style>/*https://css-tricks.com/snippets/css/css-box-shadow/*/
          .list-group-item.active {
        background-color: #196ecf;
        border-color: #196ecf;
    }
      a {
        color: #196ecf;
      }
      #historyTable .active{
	     border: 1px solid cornflowerblue;
         font-weight: bold;
         background: white !important;
         }
        .myBox {
          padding: 30px;
          border: 1px solid lightgray;
          margin: 15px;
        }
        .clickableDEP {
            color: rgb(79, 155, 214);
            cursor: pointer;
        }
        .pass {
            color:green;
        }
        .fail {
            color:red;
        }
        .primary-button{
          background: #196ecf none repeat scroll 0 0;
          border-radius: 0px;
          border: none;
          color: white;
        }
        .primary-button:hover{
          background: #122377 none repeat scroll 0 0;
          color: white;
        }
        .primary-button-link:hover{
          color: white;
          text-decoration: none !important;
        }
        #footer-menu .footer-menu-column h3{
          font-size: 22px !important; font-family:'News Cycle' !important;     font-weight: bolder !important;
        }
#footer-menu .footer-menu-column .footer-menu-list li, .footer-menu-wrapper #footer-menu .footer-menu-column .footer-menu-list a {
      padding: 6px 0 0 0 !important;
      font-size: 18px !important; font-family:'News Cycle' !important;
}


  </style>


    <style>
        #mynetwork {
            width: 100%;
            height: 600px;
            border: 1px solid lightgray;
        }

        #documentGraph {
            width: 100%;
            height: 600px;
            border: 1px solid lightgray;
        }


        #encTimeline {
            width: 100%;
            height: 200px;
            border: 1px solid lightgray;
        }

        #resourcenetwork {
            width: 100%;
            height: 400px;
            border: 1px solid lightgray;
        }
    </style>

    <script src="${pageContext.request.contextPath}/js/libs/angular-sanitize.js"></script>

    <script src="${pageContext.request.contextPath}/js/libs/angular-bootstrap-checkbox.js"></script>

    <script>
        angular.module("sampleApp",['ui.checkbox','ui.bootstrap','ngStorage','ngSanitize']).config(function($locationProvider) {

            // enable html5Mode for pushstate ('#'-less URLs)
            $locationProvider.html5Mode(true);
            $locationProvider.hashPrefix('!');
        });
    //    angular.module("sampleApp",['ui.checkbox','ui.bootstrap','ngStorage','ngSanitize'])
        angular.module("sampleApp").constant("moment", moment);

        //http://www.devblogrbmz.com/angular-default-request-headers-and-interceptors/
        //http://www.webdeveasy.com/interceptors-in-angularjs-and-useful-examples/
        angular.module("sampleApp").factory('authIntercept',['sessionSvc',function(sessionSvc){
            return {
                'request': function(config){
                    //console.log('intercept '+ sessionSvc.getAuthToken());
                    if (sessionSvc.getAuthToken()) {
                        config.headers['Authorization'] = sessionSvc.getAuthToken();
                        config.headers['myAuth'] = sessionSvc.getAuthToken();

                    }
                    return config
                }

            }
        }]).config(function($httpProvider){
            $httpProvider.interceptors.push('authIntercept')
        });
    </script>

    <script src="${pageContext.request.contextPath}/js/libs/ngStorage.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/services.js"></script>
    <script src="${pageContext.request.contextPath}/js/libs/jstree.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/appConfigSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/queryCtrl.js"></script>
 	<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>


    <script src="${pageContext.request.contextPath}/js/modalDialogSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/profileCreatorSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/resourceCreatorSvc.js"></script>
    <script src="${pageContext.request.contextPath}/resourceBuilder/rbServices.js"></script>
    <script src="${pageContext.request.contextPath}/js/resourceSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/filters.js"></script>
    <script src="${pageContext.request.contextPath}/directive/loading/http-loading.js"></script>
    <script src="${pageContext.request.contextPath}/js/resourceViewerCtl.js"></script>
    <script src="${pageContext.request.contextPath}/js/observationsDisplayCtrl.js"></script>

    <script src="${pageContext.request.contextPath}/js/findPatientCtrl.js"></script>

    <script src="${pageContext.request.contextPath}/js/libs/vis.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/components/dataTypes.js"></script>
    <script src="${pageContext.request.contextPath}/directive/fhirpath/fhirpath.js"></script>
    <script src="${pageContext.request.contextPath}/js/builderSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/sessionSvc.js"></script>

    <script src="${pageContext.request.contextPath}/js/questionnaireSvc.js"></script>
    <script src="${pageContext.request.contextPath}/directive/questionnaire/questionnaireCtl.js"></script>

    <script src="${pageContext.request.contextPath}/resourceBuilder/vsBrowser.js"></script>
    <title>Patient Viewer</title>

</head>


<body style="background: whitesmoke">

<div ng-app="sampleApp" ng-controller="resourceViewerCtrl"
     style="padding-right: 0px;">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="    background: white;
    box-shadow: 1px 1px 5px #888;">
        <div class="col-md-10 col-sm-10">
            <img src="https://www.uhc.com/content/dam/uhcdotcom/en/responsive/header-logo.png">
            <!--<a class="navbar-brand" href="#" style="color: white;">United Healthcare</a>-->
        </div>
    </nav>


    <!--<form ng-hideDEP = "appConfigSvc.getCurrentDataServer().smart && ! oauthAccessToken" class="navbar-form navbar-right">
        <button class="btn btn-primary" ng-click="findPatient()">Select Patient</button>
    </form>


    <div ng-show="appConfigSvc.getCurrentPatient()">
        <ng-include src="'/includes/resourceViewer.html'"></ng-include>
    </div>

    <div ng-hide="appConfigSvc.getCurrentPatient()">
        <p>Please select a patient using the 'Select Patient' button at the upper right</p>
        <p>If you want to add a new patient, then click the 'Select Patient' button, and in the modal dialog
        that appears, there's a link to add a new patient.</p>
    </div>-->

    <div class="row">
        <form style="    width: 90%;padding: 30px;padding-bottom: 0px;" name="filter1">
            <div class="form-group row">
                <div class="col-sm-2">
                  <label class="col-form-label">Search Patient : </label>
                </div>
                <div class="col-sm-8">
                <div class="row">
                    <div class="col-xs-8">
                      <input type="text" placeholder="First Name" class="form-control" id="patientFirstName"
                             ng-model="input.patientFirstName" value="">
                    </div>
                    <div class="col-xs-8">
                      <input type="text" placeholder="Last Name" class="form-control" id="patientLastName"
                             ng-model="input.patientLastName" value="">
                    </div>
                  </div>
                  <br/>
                  <div class="row">
                    <div class="col-xs-8">
                      <input type="text" placeholder="UHG Id" class="form-control" id="patientUHGId"
                             ng-model="input.patientUHGId" value="">
                    </div>
                    <div class="col-xs-8">
                      <input type="text" placeholder="Date of Birth (MM-DD-YYYY)" class="form-control" id="patientDOB"
                             ng-model="input.patientDOB" value="" data-date-format="mm-dd-yyyy" data-provide="datepicker">
                    </div>
                  </div>
                </div>
                <div class="col-sm-1">
                   <button type="button" class="btn primary-button"
                            ng-click="findPatient(input.patientFirstName, input.patientLastName, input.patientUHGId, input.patientDOB,input.startDate,input.endDate)">
                      Find
                   </button>
                </div>
                <div class="col-sm-1">
                   <button type="reset" class="btn secondary-button" ng-click="formReset()">
                   	Clear
                   </button>
                </div>
            </div>
        </form>
    </div>

    <div ng-show="hasSearchedMember()" style="padding: 15px;    background: white; border-bottom: 1px solid lightgray; border-top: 1px solid lightgray;">
     <h3>
          <a href="#historyTable" data-toggle="collapse" onclick="$('.collapse').addClass('show');">
            Visit History : ({{getName()}})
            <i class="fa fa-caret-down" ng-show="appConfigSvc.getCurrentPatient()"
               style="font-size: 30px;padding-left: 10px;"></i>
         </a>
          <span  ng-show="appConfigSvc.getCurrentPatient()" style="font-size: 20px; color: #1a6dcf; background: aliceblue;padding: 0px 16px;
		    margin: 30px;
		    font-weight: normal;"> {{displayEHR}}</span>
		  </h3>
		  
		<form name="filter2" id="filter2">
        <div id="historyTable" class="collapse show">
         <div class="row toolbar" style="padding: 10px 0px; background: whitesmoke; margin: 0px;">
            <div class="col-xs-16">
              <a ng-class="{'active' : showFilter}" ng-click="setAttribute('showFilter', !showFilter)" href="" style="    margin-right: 20px; background: whitesmoke; padding: 5px 20px;">Filter</a>
              <a ng-class="{'active' : showAdditionalHospital}" ng-click="setAttribute('showAdditionalHospital', !showAdditionalHospital)" href="" style="    margin-right: 20px; background: whitesmoke; padding: 5px 20px;">Additional Provider</a>
            </div>
          </div>
          <div ng-show="showFilter" class="row toolbar" style="padding: 15px 0px;  background: floralwhite; margin: 0px; border-top: 1px solid lightgray;">
            <div class="col-xs-4">
              <input type="text" placeholder="Start Date (MM-DD-YYYY)" class="form-control" id="startDate"
                     ng-model="input.startDate" value="" data-date-format="mm-dd-yyyy" data-provide="datepicker">
            </div>
            <div class="col-xs-4">
              <input type="text" placeholder="End Date (MM-DD-YYYY)" class="form-control" id="endDate"
                     ng-model="input.endDate" value="" data-date-format="mm-dd-yyyy" data-provide="datepicker">
            </div>
            <div class="col-xs-4">
              <button type="button" class="btn primary-button"
                      ng-click="filterPatient(input.startDate,input.endDate)">
                Filter
              </button>
            </div>
          </div>
          <div ng-show="showAdditionalHospital" class="row toolbar" style="padding: 15px 0px; background: floralwhite; margin: 0px; border-top: 1px solid lightgray;" id="showAdditionalHospitalContainer">
            <div class="col-xs-4">
<!--               <input type="text" placeholder="EHR Name" class="form-control" id="patientDOB"
                     ng-model="input.patientDOB" value=""> -->
<!--               <select class="form-control" ng-model="selectedEHR" ng-options="ehr.name for ehr in ehrArray" ng-change="onEhrNameChange()">
              	<option value="">Select EHR Name</option>
              </select> -->
              <input type="text" ng-model="selectedEHR" placeholder="EHR Name" uib-typeahead="ehr.name for ehr in ehrArray | filter:{name:$viewValue}" 
              		class="form-control" typeahead-show-hint="true" typeahead-min-length="0" ng-change="onEhrNameChange()" typeahead-on-select="onEhrNameChange()">
            </div>
            <div class="col-xs-4">
<!--               <input type="text" placeholder="Hospital Name" class="form-control" id="patientDOB"
                     ng-model="input.patientDOB" value=""> -->
			 <!-- <select class="form-control" ng-disabled="!selectedEHR" ng-model="selectedHospital" ng-options="hospital.name for hospital in hospitalArray">
              	<option value="">Select Hospital Name</option>
              </select> -->
             <input type="text" ng-model="selectedHospital" placeholder="Hospital Name" uib-typeahead="hospital.name for hospital in hospitalArray | filter:{name:$viewValue}" 
              		class="form-control" typeahead-show-hint="true" typeahead-min-length="0" ng-change="onHospitalNameChange()" typeahead-on-select="onHospitalNameChange()">
            </div>
            <div class="col-xs-4">
              <button type="reset" class="btn primary-button" ng-disabled="selectedEHR.name==='Meditech EHR' || selectedEHR==='Meditech EHR'" ng-click="addHospital()">
                Add Hospital
              </button>
           </div>

          </div>
          
          <div class="row" style="padding: 0px 30px;" ng-show="hasVistedHistory()">
	            <table class="table table-hover"  style="background: white;">
	            		<thead>
	            		<tr>
					     <th>Hospital Name</th>
					     <th>EHR Name</th>
					     <th>Hospital Id</th>
					     <th>Last Visited Date</th>
					  </tr>
					 </thead>
	                <tbody ng-repeat="history in getVisitHistory()">
	                		
	                    <tr ng-if= "history.enable=='true'" ng-click ="selectEHR(history.patientId,history.hospitalName,history.ehrName,history.ehrId)">
	                        <td>{{history.hospitalName}}</td>
	                        <td><img  style="width: 100px;" src="{{history.url}}"></td>
	                        <td>{{history.hospitalId}}</td>
		                    <td>{{history.lastVisitDate | date:'medium'}}</td>
	                    </tr>
	                     <tr ng-if= "history.enable=='false'" style="background-color: grey;">
	                        <td>{{history.hospitalName}}</td>
	                        <td><img  style="width: 100px;" src="{{history.url}}"></td>
	                        <td>{{history.hospitalId}}</td>
		                    <td>{{history.lastVisitDate | date:'medium'}}</td>
	                    </tr>
	                </tbody>
	                <tbody ng-show="!getVisitHistory().length">
	                		<tr>
	                			<td>No patient found</td>
	                		</tr>
	                </tbody>
	            </table>
            </div>
             <div class="row" style="padding: 0px 30px;" ng-hide="hasVistedHistory()">
             	No patient found
             </div>
        </div>
        </form>
    </div>
    <!--<div class="row" style="padding: 0px 30px;" ng-show="appConfigSvc.getCurrentPatient()">
        <h3>
            {{getName()}}
        </h3>
    </div>-->
	<loading></loading>
    <div class="row" style="padding: 15px 30px;" ng-show="appConfigSvc.getCurrentPatient()" >
    		
        <ng-include src="'${pageContext.request.contextPath}/includes/resourceViewer.jsp'" style="width: 100%"></ng-include>
    </div>



</div>
</body>
</html>