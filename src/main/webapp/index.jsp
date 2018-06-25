<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <script src="${pageContext.request.contextPath}/js/libs/jquery-1.9.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/libs/angular.min1-5.js"></script>
  <script src="${pageContext.request.contextPath}/js/libs/ui-bootstrap-tpls-2.0.1.min.js"></script>
  <script src="https://use.fontawesome.com/5a364c316b.js"></script>
  <script src="${pageContext.request.contextPath}/js/libs/firebase.js"></script>
  <script src="${pageContext.request.contextPath}/js/libs/angularfire.min.js"></script>

  <script src="${pageContext.request.contextPath}/js/libs/highstock.js"></script>
  <script src="${pageContext.request.contextPath}/js/libs/highcharts-ng.min.js"></script>

  <script src="${pageContext.request.contextPath}/js/libs/moment.min.js"></script>


  <link rel="stylesheet" type="text/css"
        href="https://www.uhc.com/etc/designs/uhcdotcom/clientlibs/responsive/themes/default.min.8d633391e39b92fcbce01bc23f2bcce4.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap4.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>

  <title>EISL - Landing Page</title>

  <style>/*https://css-tricks.com/snippets/css/css-box-shadow/*/
        .list-group-item.active {
        background-color: #196ecf;
        border-color: #196ecf;
    }
    a {
      color: #196ecf;
    }
        .myBox {
          padding: 5px;
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

  <script>


        angular.module("sampleApp",['ui.bootstrap','ngStorage','firebase','highcharts-ng']).config(function($locationProvider) {

            // enable html5Mode for pushstate ('#'-less URLs)
            $locationProvider.html5Mode(true);
            $locationProvider.hashPrefix('!');
        });

        angular.module("sampleApp").constant("moment", moment);





  </script>

  <script>
        var config = {
            apiKey: "AIzaSyBNMohLbPiSKwpGwfARopdeW_6LLXujcUo",
            authDomain: "clinfhir.firebaseapp.com",
            databaseURL: "https://clinfhir.firebaseio.com",
            storageBucket: ""
        };

        if (firebase) {
            firebase.initializeApp(config);

        }



  </script>

  <script src="${pageContext.request.contextPath}/js/appConfigSvc.js"></script>
  <script src="${pageContext.request.contextPath}/js/launcherCtl.js"></script>
  <script src="${pageContext.request.contextPath}/js/setServers.js"></script>
  <script src="${pageContext.request.contextPath}/js/libs/ngStorage.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/modalDialogSvc.js"></script>
  <script src="${pageContext.request.contextPath}/resourceBuilder/rbServices.js"></script>
  <script src="${pageContext.request.contextPath}/js/logicalModelSvc.js"></script>
  <script src="${pageContext.request.contextPath}/js/loginCtrl.js"></script>
  <script src="${pageContext.request.contextPath}/js/filters.js"></script>
</head>
<body>

<div ng-app="sampleApp" ng-controller="launcherCtrl" ng-cloak>
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="    background: white;
    box-shadow: 1px 1px 5px #888;">
    <div class="col-md-10 col-sm-10">
      <img src="https://www.uhc.com/content/dam/uhcdotcom/en/responsive/header-logo.png">
      <!--<a class="navbar-brand" href="#" style="color: white;">United Healthcare</a>-->
    </div>
  </nav>
  <div class="row" ng-show="displayMode == 'front'" style="padding:30px;background: #1a6dcf;
    color: white;">
    <div class="col-md-6 col-sm-6">
      <div style="padding: 20px 40px;">
        <h1 style="margin-bottom: 30px;">Welcome</h1>
        <h3 style="margin-bottom: 30px;">EMR Integration Service Layer (EISL)</h3>
	<h6 style="margin-bottom: 30px;">Version 1.0</h6>
        <!--<p style="    color: #555;
    font-style: italic;">
          Some description goes here. Some description goes here. Some description goes here. Some description goes
          here.
          Some description goes here. Some description goes here. Some description goes here. Some description goes
          here.
        </p>-->
      </div>
    </div>
    <div class="col-md-5 col-sm-5 align-items-center justify-content-center">
	<!--<div class="square" style="width:400px">-->
      		<!--<img style="height: 350px;" src="https://patientengagementhit.com/images/site/article_headers/_normal/doctor_computer.png">-->
		<!--<img style="height: 250px;" src="https://getreferralmd.com/wp-content/uploads/2013/10/patient-portal.png">-->
		&nbsp;&nbsp;&nbsp;&nbsp;<img style="height: 250px; width:500 text-align:center" src="./images/EISL-landing-logo.png">
	<!--</div>-->
    </div>
  </div>
  <div style="text-align:center;
    padding-top: 5px;background: whitesmoke;
    padding-bottom: 5px;">
    <!--<h2>Some punch line goes here...</h2>-->
    <p style="margin-top: 20px;" class="font-weight-bold text-secondary" >
	The EISL Platform is based on the following integration tiers:</br> 1.&nbsp;Inbound Services Tier</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.&nbsp;On-Demand Services Tier </br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.&nbsp;Application Services Tier</br> Please contact Clinical Data Services team at <a href="mailto:dataacquisitiontechsupport@uhc.com">UHC Clinical Data Acquisition</a> with any questions.</p>
  </div>
  <div class="row" style="padding-top: 5px;">
    <div class="col-md-4 col-xs-4 " style="padding-left: 40px;">
      <div class="myBox">
        <div style="text-align: center;margin-bottom: 5px;">
          <i class="fa fa-angle-double-down" style="font-size: 80px;color: #003da0;"></i>
        </div>
        <!-- <button class="btn btn-block btn-default disabled" style=" font-size: 30px;border: 1px solid lightgray;
    color: #999;
    background: whitesmoke;
    cursor: not-allowed;">In-bound Services
        </button> -->
        <a href="https://orbitbi-tableau.optum.com/t/PDCC/views/ProviderDataCommandCenterPROD/PDCCCCProdEnvironment?:embed=y&:display_count=no&:showVizHome=no#1" class="primary-button-link" target = "_blank">
          <button class="btn btn-block primary-button" style="font-size: 30px;">In-bound Services</button>
        </a>
      </div>
    </div>
    <div class="col-md-4 col-xs-4 ">
      <div class="myBox">
        <div style="text-align: center;margin-bottom: 5px;">
          <i class="fa fa-angle-double-down" style="font-size: 80px;color: #003da0;"></i>
        </div>
        <a href="${pageContext.request.contextPath}/patientViewer.jsp" class="primary-button-link" target = "_self">
          <button class="btn btn-block primary-button" style="    font-size: 30px;">On Demand Services</button>
        </a>
      </div>
    </div>
    <div class="col-md-4 col-xs-4 " style="padding-right: 40px;">
      <div class="myBox">
        <div style="text-align: center;margin-bottom: 5px;">
          <i class="fa fa-angle-double-down" style="font-size: 80px;color: #003da0;"></i>
        </div>
        <button class="btn btn-block btn-default disabled" style="    font-size: 30px;border: 1px solid lightgray;
    color: #999;
    background: whitesmoke;
    cursor: not-allowed;">App Services
        </button>
      </div>
    </div>
  </div>

</div>
</body>
</html>
