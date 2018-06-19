
<style>
    .myActive {
        background-color: red;
    }
    .tab-content{
        border-left: 1px solid lightgray;
        border-right: 1px solid lightgray;
        border-bottom: 1px solid lightgray;
        padding: 20px 20px 100px 20px;
        background: white;
    }
    .nav-tabs .active{
      border: 1px solid lightgray;
      border-bottom: 1px solid white;
      font-weight: bold;
      color: red;
      background: white;
    }
    .nav-tabs .nav-link:hover, .nav-tabs .nav-link:focus {
        border-color: transparent;
    }
    a {
    color: #196ecf;
    }
    .list-group-item.active {
        background-color: #196ecf;
        border-color: #196ecf;
    }
</style>

<uib-tabset>
    <uib-tab heading="Resource explorer">

        <div class="row" style="padding-bottom: 20px;">

            <div class="col-md-3 col-sm-3">
                <h4>Health Records</h4>
                <div class="list-group" style="    margin-top: 20px;">
                    <a href="#"  ng-click="typeSelected(type)"
                       ng-class="{'list-group-item':true,'active':type.type == outcome.selectedType}"
                       ng-repeat="type in outcome.resourceTypes ">
                        {{type.type}}
                        <span class="pull-right badge">{{type.bundle.total}}</span>
                    </a>
                </div>

                <!-- Show the vitals if there are any observations
                <div class="list-group">
                    <a ng-show="hasVitals" href="#" class="list-group-item" ng-click="getVitals()">Vitals</a>
                </div>-->
            </div>

            <div class="col-md-9 col-sm-9">

                <div class="row">
                    <div class="col-md-4 col-sm-4">

                        <h4>{{outcome.selectedType}} Resources</h4>
                        <div class="list-group" style="    margin-top: 20px;">
                            <a href="#"
                               ng-class="{'list-group-item':true,'active':entry.resource.id == outcome.selectedResource.id}"
                               ng-repeat="entry in outcome.allResourcesOfOneType.entry">
                                <div style="cursor: pointer" ng-click="resourceSelected(entry)">
                                    <ng-include src="'${pageContext.request.contextPath}/includes/resourceDisplayTemplates.html'"></ng-include>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8">

                        <div ng-show="outcome.selectedResource">

                            <div class="alert alert-warning" style="margin-top: 8px">
                                <div class="row">
                                    <div class="col-md-8 col-sm-8">

                                        <ul class="pagination" style="margin-top:1px;margin-bottom:1px" ng-show="resourceVersions && resourceVersions.entry.length > 1">
                                            <li><a href="#"><strong>Versions:</strong></a></li>

                                            <li ng-repeat="ent in resourceVersions.entry">
                                                <a href="#" ng-click="selectVersion(ent.resource)">{{resourceVersions.entry.length - $index}}</a>
                                            </li>
                                        </ul>


                                    </div>

                                    <div class="col-md-4 col-sm-4">
                                        <div class="pull-right">
                                            <!-- not sure if we'll support edit form here - do it from the scenario...
                                            <button class="btn btn-link" ng-hide="outcome.selectedResource.contained"
                                                    ng-click="editExistingResource(outcome.selectedResource)">Edit Resource
                                            </button>
                                            <div ng-show="outcome.selectedResource.contained">
                                                Can't edit with Contained
                                            </div>
-->
                                        </div>
                                    </div>
                                </div>





                            </div>

                            <div class="row">
                                <div class="col-md-8 col-sm-8">

                                    <uib-tabset>
                                        <uib-tab heading="Tree">
                                            <div id="resourceTree"></div>

                                        </uib-tab>
                                        <uib-tab heading="Text" >
                                            <p ng-bind-html="outcome.selectedResource.text.div"></p>
                                        </uib-tab>
                                        <uib-tab heading="Json">
                                            <div class="row">
                                                <div class="col-md-10 col-sm-10">
                                                    <h4>{{outcome.selectedResource.resourceType}}/{{outcome.selectedResource.id}}</h4>
                                                </div>
                                                <div class="col-md-2 col-sm-2">
                                                    <a class="pull-right" download="{{downloadLinkJsonName}}.json"
                                                       href="{{downloadLinkJsonContent}}">Download</a>
                                                </div>
                                            </div>
                                            <pre>{{outcome.selectedResource | json:2}}</pre>
                                        </uib-tab>

                                        <uib-tab heading="XML">

                                            <div class="row">
                                                <div class="col-md-10 col-sm-10">
                                                    <h4>{{outcome.selectedResource.resourceType}}/{{outcome.selectedResource.id}}</h4>
                                                </div>
                                                <div class="col-md-2 col-sm-2">
                                                    <a class="pull-right" download="{{downloadLinkXmlName}}" href="{{downloadLinkXmlContent}}">Download</a>
                                                </div>
                                            </div>


                                            <pre>{{xmlResource}}</pre>
                                        </uib-tab>

                                        <uib-tab heading="Display"
                                                 ng-show="hasDetailedView.indexOf(outcome.selectedResource.resourceType) > -1">


                                            <ng-include ng-show="outcome.selectedResource.resourceType=='Observation'"
                                                        src="'${pageContext.request.contextPath}/displayTemplates/observation.html'"></ng-include>

                                            <ng-include ng-show="outcome.selectedResource.resourceType=='Encounter'"
                                                        src="'${pageContext.request.contextPath}/displayTemplates/encounter.html'"></ng-include>

                                            <ng-include ng-show="outcome.selectedResource.resourceType=='Condition'"
                                                        src="'${pageContext.request.contextPath}/displayTemplates/condition.html'"></ng-include>


                                        </uib-tab>

                                        <uib-tab heading="References" select="fitGraphInContainer('resourcenetwork')">
                                            <div id="resourcenetwork"></div>
                                        </uib-tab>

                                        <uib-tab heading="Sections" ng-show="outcome.selectedResource.resourceType=='Composition'">
                                            <div ng-repeat = "section in outcome.selectedResource.section">
                                                <h5>{{section.title}}
                                                    (<span ng-repeat = "code in section.code.coding">{{code.code}}</span>)
                                                </h5>
                                                <div class="row">
                                                    <div class="col-sm-8 col-md-8">
                                                        <div style="margin-left: 10px">
                                                            <div ng-repeat = "entry in section.entry">
                                                                --> {{entry.reference}}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4 col-md-4">

                                                        <div class="pull-right clickable"
                                                             ng-click="showText(section)">View Text</div>

                                                    </div>
                                                </div>


                                            </div>



                                        </uib-tab>




                                    </uib-tabset>





                                </div>

                                <div class="col-md-4 col-sm-4">
                                    <h4>Outward references</h4>

                                    <div class="list-group" style="    margin-top: 20px;">
                                        <a href="#"class="list-group-item"
                                           ng-repeat="reference in resourceReferences.outwardLinks"
                                           ng-click="selectNewResource(reference,$event)">

                                            <div>{{reference.element}} ==> {{reference.reference}}</div>
                                            <div><p ng-bind-html="reference.resource.text.div"></p></div>

                                        </a>
                                    </div>

                                    <h4>Inward references</h4>

                                    <div class="list-group" style="    margin-top: 20px;">
                                        <a href="#" class="list-group-item"
                                           ng-repeat="reference in resourceReferences.inwardLinks"
                                           ng-click="selectNewResource(reference,$event)">

                                            <div>{{reference.resource.resourceType}}/{{reference.resource.id}}.
                                                {{reference.name}}</div>
                                            <div><p ng-bind-html="reference.resource.text.div"></p></div>

                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>




        </div>

        <a href='#' ng-show="showPatientJson" ng-click="showPatientJson=false">Hide Patient Json</a>
        <a href="#" ng-hide="showPatientJson" ng-click="showPatientJson=true">Show Patient Json</a>
        <div ng-show="showPatientJson" style="overflow-y:scroll; height:400px;">
            <pre>{{appConfigSvc.getCurrentPatient() | json}}</pre>
        </div>

    </uib-tab>

    <uib-tab heading="Resource references graph"  select="fitGraphInContainer('mynetwork')" ng-click="showPatientJson=false">
        <br/>
        <div class="row">
            <div class="col-md-8 col-sm-8">
                <div id="mynetwork"></div>
                <div><em>Note that the Patient is not displayed in this graph.</em></div>
            </div>
            <div class="col-md-4 col-sm-4">
                <uib-tabset>
                    <uib-tab heading="Tree">
                        <div id="graphResourceTree"></div>
                    </uib-tab>
                    <uib-tab heading="Text">
                        <p ng-bind-html="selectedGraphNode.resource.text.div"></p>
                    </uib-tab>
                    <uib-tab heading="Json">
                        <pre>{{selectedGraphNode.resource | json}}</pre>
                    </uib-tab>
                </uib-tabset>


            </div>
        </div>


    </uib-tab>

    <uib-tab heading="Numeric Observations/Vitals" ng-click="showPatientJson=false">
        <br/>
        <div ng-controller="observationsDisplayCtrl">
            <div class="row">
                <div class="col-md-2 col-sm-2">
                    <div class="list-group">
                        <a href="#"  ng-click="obsSelected(key,value)"
                           ng-class="{'list-group-item':true,'active':1==2}"
                           ng-repeat="(key,value) in observations ">
                            {{value.display}}
                            <span class="pull-right badge">{{value.list.length}}</span>
                        </a>
                    </div>


                    <!-- Show the vitals if there are any observations-->

                    <div ng-show="hasVitals">
                        <div class="rounded-box">
                            <div class="list-group">
                                <a href="#" class="list-group-item" ng-click="getVitals()">
                                    <span ng-hide="vitalsTable">Show Vitals</span>
                                    <span ng-show="vitalsTable">Hide Vitals</span>
                                </a>
                            </div>

                            <select class="form-control">
                                <option>Vitals Profile</option>
                            </select>
                        </div>

                    </div>





                </div>
                <div class="col-md-10 col-sm-10">
                    <div ng-hide="observations">
                        <p>This patient has no numeric observations (where Observation.valueQuantity has a value).</p>
                    </div>

                    <!-- The vitals table -->
                    <table class="table table-bordered" ng-show="vitalsTable">
                        <tr>
                            <td>Item</td>
                            <td ng-repeat="date in vitalsTable.dates track by $index">
                                <div>{{date | date : 'dd-MMM-yy hh:mm'}}</div>
                                <div>{{date | getAge}}</div>
                            </td>
                        </tr>

                        <tr ng-repeat="row in vitalsTable.rows track by $index" >
                            <td title="{{row.code}}">{{row.display}}  ({{row.unit}})</td>

                            <td ng-repeat="item in row.cols track by $index">
                                {{item.value}}
                            </td>
                        </tr>
                    </table>

                    <div ng-show="observations">
                        <div style="width: 100%; height: 300px; border: 1px solid lightgray;"
                             id="observationsChart"></div>
                    </div>




                </div>

            </div>



        </div>
    </uib-tab>

    <uib-tab heading="Encounter timeline" ng-click="showPatientJson=false">
        <br/>
        <div class="row">
            <div class="col-md-2 col-sm-2">
                <div style="height: 700px; overflow-y: scroll;">
                    <div class="list-group">
                        <a href="#" class="list-group-item" ng-click="filterTimeLineByCondition()">All Conditions</a>
                        <a href="#" class="list-group-item"
                           ng-click="filterTimeLineByCondition(key)"
                           ng-repeat="(key,item) in conditions">
                            <!--{{item}}  {{key}}-->
                            <span class="pull-right badge">{{item.count}}</span>
                            {{ResourceUtilsSvc.getOneLineSummaryOfResource(item.resource)}}
                            <!--
                            <codeable-concept cc="item.resource.code"></codeable-concept>
-->
                        </a>
                    </div>
                </div>
            </div>


            <div class="col-md-10 col-sm-10">
                <div id="encTimeline"></div>
                <hr />

                <div ng-show="outcome.selectedResource">
                    <div class="banner">
                        <strong>Encounter:</strong> {{outcome.selectedResource.id}}
                    </div>



                    <uib-tabset>
                        <uib-tab heading="Display">



                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <ng-include ng-show="outcome.selectedResource.resourceType=='Encounter'"
                                                src="'./displayTemplates/encounter.html'"></ng-include>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <pre>
                                        {{outcome.selectedResource | json}}
                                    </pre>
                                </div>

                            </div>







                        </uib-tab>
                        <uib-tab heading="References/Json" select="fitGraphInContainer('resourcenetworkgraphtl')">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div style="width: 100%; height: 400px; border: 1px solid lightgray;"
                                         id="resourcenetworkgraphtl"></div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <pre>
                                        {{outcome.selectedResource | json}}
                                    </pre>
                                </div>

                            </div>
                        </uib-tab>

                    </uib-tabset>


                </div>

            </div>

        </div>


    </uib-tab>

    <uib-tab heading="FHIRPath" ng-click="showPatientJson=false">
        <br/>
        <div class="row">
            <div class="col-md-2">

                <uib-tabset>
                    <uib-tab heading="By Type">
                        <br/>
                        <uib-accordion>

                            <div uib-accordion-group class="panel-default" heading="{{key}}"

                                 ng-show = "value.entry.length > 0"
                                 ng-repeat="(key,value)  in allResources">
                                <ul class="list-group">
                                    <li ng-class="{'list-group-item':1==1,'list-group-item-info':entry.resource.id == outcome.selectedResource.id}"
                                        style = "cursor: pointer"
                                        ng-repeat = "entry in value.entry" ng-click="selectFPResource(entry)">
                                        <ng-include src="'./includes/resourceDisplayTemplates.html'"></ng-include>

                                    </li>
                                </ul>

                            </div>

                        </uib-accordion>
                    </uib-tab>
                    <uib-tab heading="Bundle">
                        <br/>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <span class="clickable pull-right" ng-click="selectSingleBundle(singleBundle)">Show all</span>
                            </div>

                        </div>

                        <ul class="list-group">

                            <li ng-class="{'list-group-item':1==1,'list-group-item-info':entry.resource.id == outcome.selectedResource.id}"
                                style = "cursor: pointer"
                                ng-repeat = "entry in singleBundle.entry" ng-click="selectFPResource(entry)">
                                <ng-include src="'${pageContext.request.contextPath}/includes/resourceDisplayTemplates.html'"></ng-include>

                            </li>
                        </ul>



                    </uib-tab>
                </uib-tabset>



            </div>

            <div class="col-md-5 col-sm-5">
                <pre>{{fpResource | json}}</pre>
            </div>

            <div class="col-md-5 col-sm-5">
                <fhirpath resource="fpResource"></fhirpath>
            </div>

        </div>


    </uib-tab>

    <uib-tab ng-show="showGQL" heading="GraphQL">
        <br/>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <graphql resource="currentPatient"></graphql>
            </div>
        </div>
    </uib-tab>

<!--    <uib-tab heading="Documents">

        <div class="row">

            <div class="col-md-2 col-sm-2">
                <h4>Documents</h4>
                <div class="list-group">
                    <a href="#"  ng-click="selectDocument(entry.resource)"
                       ng-class="{'list-group-item':true,'active':documentReference.id == entry.resource.id}"
                       ng-repeat="entry in documentReferenceList">
                        {{entry.resource.type.text}}
                    </a>
                </div>
            </div>

            <div class="col-md-10 col-sm-10">
                <br/>
                <uib-tabset ng-show="docAttachment">

                    <uib-tab heading="Document tree">

                        <div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div id="docTreeView1"></div>
                            </div>
                            <div class="col-sm-6 col-md-6">

                                <p ng-bind-html="docSectionText.div"></p>

                                <pre ng-show="docSection">{{docSection | json}}</pre>



                                <pre ng-show="docTreeResource">{{docTreeResource | json}}</pre>
                            </div>
                        </div>



                        <em>Note that this view only includes the resources that are directly connected to the Composition.section.entry
                            element, and to any List resources referenced by a section. To see the complete list, and all the references
                            between resources (such as to the Patient) then use the Graph tab.</em>

                    </uib-tab>


                    <uib-tab heading="Document Graph" select="redrawChart()">
                        <br/>
                        <div class="row">

                            <div class="col-md-7 col-sm-7">
                                <div id="documentGraph"></div>
                                <em>The Patient resource is not displayed</em>
                            </div>
                            <div class="col-md-5 col-sm-5">

                                <pre>{{graphDocResource | json}}</pre>
                            </div>
                        </div>
                    </uib-tab>



                    <uib-tab heading="Document Text">
                        <p ng-bind-html="docAttachment.html  "></p>
                    </uib-tab>

                    <uib-tab heading="Document Quality Report">
                        <div>There are {{docQuality.cntNodes}} resources in this document.</div>
                        <div>There are {{docQuality.cntEdges}} references between them.</div>

                        <div ng-show="docQuality.orphans.length > 0">
                            There are {{docQuality.orphans.length}} resources that have no reference to them:

                            <table class="table table-bordered">
                                <tr ng-repeat="orphan in docQuality.orphans">
                                    <td>{{orphan.resourceType}}</td>
                                    <td>{{orphan.id}}</td>
                                    <td><p ng-bind-html="orphan.text.div"></p> </td>
                                </tr>
                            </table>
                        </div>


                    </uib-tab>

                    <uib-tab heading="Bundle Json">
                        <pre>{{docAttachment.bundle | json}}</pre>
                    </uib-tab>


                    <uib-tab heading="DocumentReference Json">
                        <pre>{{documentReference | json}}</pre>
                    </uib-tab>



                </uib-tabset>


            </div>
        </div>




    </uib-tab>

    <uib-tab heading="Questionnaires">

        <div class="row">

            <div class="col-md-2 col-sm-2">
                <h4>Questionnaires</h4>
                <div class="list-group">
                    <a href="#"  ng-click="selectQ(entry.resource)"
                       ng-class="{'list-group-item':true,'active':currentQ.id == entry.resource.id}"
                       ng-repeat="entry in QBundle.entry">
                        {{entry.resource.id}}
                    </a>
                </div>
            </div>

            <div class="col-md-10 col-sm-10">
                <br/>
                <questionnaire model="currentQ" resourcehash="allResources"></questionnaire>
            </div>
        </div>
    </uib-tab>-->




</uib-tabset>
