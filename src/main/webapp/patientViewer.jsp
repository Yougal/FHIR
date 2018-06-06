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

     <link rel="stylesheet" type="text/css"
          href="https://www.uhc.com/etc/designs/uhcdotcom/clientlibs/responsive/themes/default.min.8d633391e39b92fcbce01bc23f2bcce4.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jsTreeStyle.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jsTreeThemes/proton/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vis.min.css"/>
    <style>/*https://css-tricks.com/snippets/css/css-box-shadow/*/
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
        })


    </script>

    <script src="${pageContext.request.contextPath}/js/libs/ngStorage.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/services.js"></script>
    <script src="${pageContext.request.contextPath}/js/libs/jstree.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/appConfigSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/queryCtrl.js"></script>


    <script src="${pageContext.request.contextPath}/js/modalDialogSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/profileCreatorSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/resourceCreatorSvc.js"></script>
    <script src="${pageContext.request.contextPath}/resourceBuilder/rbServices.js"></script>
    <script src="${pageContext.request.contextPath}/js/resourceSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/filters.js"></script>
    <script src="${pageContext.request.contextPath}/js/resourceViewerCtl.js"></script>
    <script src="${pageContext.request.contextPath}/js/observationsDisplayCtrl.js"></script>

    <script src="${pageContext.request.contextPath}/js/findPatientCtrl.js"></script>

    <script src="${pageContext.request.contextPath}/js/libs/vis.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/components/dataTypes.js"></script>
    <script src="${pageContext.request.contextPath}/directive/fhirpath/fhirpath.js"></script>
    <script src="${pageContext.request.contextPath}/directive/graphql/graphql.js"></script>
    <script src="${pageContext.request.contextPath}/js/builderSvc.js"></script>
    <script src="${pageContext.request.contextPath}/js/sessionSvc.js"></script>

    <script src="${pageContext.request.contextPath}/js/questionnaireSvc.js"></script>
    <script src="${pageContext.request.contextPath}/directive/questionnaire/questionnaireCtl.js"></script>

    <script src="${pageContext.request.contextPath}/resourceBuilder/vsBrowser.js"></script>

    <title>Patient Viewer</title>

</head>


<body>

<div ng-app="sampleApp" ng-controller="resourceViewerCtrl" class="container-fluid" style="padding-right: 0px;">
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
        <form style="    width: 90%;padding: 30px;">
            <div class="form-group row">
                <div class="col-sm-2">
                    <label for="patientName" class="col-form-label">Select Patient : </label>
                </div>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="patientName" ng-model="input.patientName" 
                           value="">
                </div>
                <div class="col-sm-1">
                    <button type="button" class="btn primary-button" ng-click="findPatient(input.patientName)"> Find </button>
                </div>
            </div>
        </form>
    </div>

    <div ng-show="hasSearchedMember()">
        <h3><a href="#historyTable" data-toggle="collapse" onclick="$('.collapse').addClass('show');">Visit History : ({{getName()}})</a></h3>
        <div id="historyTable" class="collapse show">
	        <table class="table table-hover" >
	            <tbody ng-repeat="history in getVisitHistory()">
	                <tr ng-click ="selectEHR(history.patientId,history.hospitalName,history.ehrName)">
	                    <td>{{history.hospitalName}}</td>
	                    <td><img  style="width: 100px;" src="{{history.url}}"></td>
	                </tr>
	            </tbody>
	        </table>
        </div>
    </div>
    
    <div class="row" style="padding: 0px 30px;" ng-show="appConfigSvc.getCurrentPatient()">
        <h3>
            {{getName()}} <span style="font-size: 20px;
    color: #1a6dcf;
    background: aliceblue;
    padding: 0px 16px;
    margin: 30px;
    font-weight: normal;"> {{displayEHR}}</span>
        </h3>
    </div>

    <div class="row" style="padding: 15px 30px;" ng-show="appConfigSvc.getCurrentPatient()">
        <ng-include src="'${pageContext.request.contextPath}/includes/resourceViewer.jsp'"></ng-include>
    </div>

    <div>
        <div class="footer_bottom_par parsys">
            <div class="reference parbase section">
                <div class="cq-dd-paragraph">
                    <div class="popularlinks_62f popularlinks">
                        <section class="footer-menu-wrapper">
                            <div id="footer-menu" style="    max-width: 90% !important;">
                                <h2 style="font-size: 28px; font-family:'News Cycle';     font-weight: bolder;"> Popular Links</h2>
                                <div class="footer-menu-column-wrapper">

                                    <div class="col-sm-4 footer-menu-column">
                                        <h3>Products<span class="plus-icon"></span></h3>
                                        <div class="footer-menu-list ">
                                            <ul>


                                                <li lang="en"><a
                                                    href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/individual-and-family/understanding-health-insurance/how-insurance-works/health-insurance-marketplace"
                                                    target="_self">Marketplace Insurance Plans</a></li>


                                                <li lang="en"><a href="https://www.uhcmedicaresolutions.com/?WT.mc_id=880332" target="_self">Medicare</a>
                                                </li>


                                                <li lang="en"><a
                                                    href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/individual-and-family/health-insurance-plans/medicare-medicaid/what-is-medicaid"
                                                    target="_self">Medicaid</a></li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/employer" target="_self">Employer Group
                                                    Plans</a></li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/individual-and-family/dental-insurance"
                                                                 target="_self">Dental Insurance</a></li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/individual-and-family/insurance-plans/vision"
                                                                 target="_self">Vision Insurance</a></li>


                                                <li lang="en"><a
                                                    href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/individual-and-family/short-term-health-insurance"
                                                    target="_self">Short Term Health Insurance</a></li>


                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-sm-4 footer-menu-column">
                                        <h3>Healthy Living<span class="plus-icon"></span></h3>
                                        <div class="footer-menu-list inactive">
                                            <ul>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/health-and-wellness/fitness" target="_self">Fitness</a>
                                                </li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/health-and-wellness/nutrition" target="_self">Nutrition</a>
                                                </li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/health-and-wellness/health-topics"
                                                                 target="_self">Health Topics</a></li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/health-and-wellness/take-control-of-your-care"
                                                                 target="_self">Take Control of Your Care</a></li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/health-and-wellness" target="_self">Health and
                                                    Wellness</a></li>


                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-sm-4 footer-menu-column">
                                        <h3>Featured Links<span class="plus-icon"></span></h3>
                                        <div class="footer-menu-list inactive">
                                            <ul>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/individual-and-family/member-resources"
                                                                 target="_self">Member Resources</a></li>


                                                <li lang="en"><a
                                                    href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/individual-and-family/member-resources/health-care-tools"
                                                    target="_self">Program &amp; Tools</a></li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/about-us" target="_self">About Us</a></li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/united-for-reform" target="_self">United For
                                                    Reform</a></li>


                                                <li lang="en"><a href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/valuebasedcare" target="_self">Value-Based
                                                    Care</a></li>


                                                <li lang="en"><a href="http://www.myuhc.com/" target="_self">View Drug List</a></li>


                                                <li lang="en"><a
                                                    href="${pageContext.request.contextPath}/content/uhcdotcom/en/home/individual-and-family/member-resources/health-care-tools/health4me"
                                                    target="_self">Download Health4Me App</a></li>


                                                <li lang="en"><a href="https://www.uhc.com/broker" target="_self">Broker Resources</a></li>


                                                <li lang="en"><a href="http://www.justplainclear.com?srcName=uhc_com-FeaturedLink"
                                                                 target="_self">Just Plain Clear® Glossary</a></li>


                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
            <div class="reference parbase section">
                <div class="cq-dd-paragraph">
                    <div class="htmlscript_c138 htmlscript">
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>