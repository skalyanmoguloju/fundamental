<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Daniel Dao
  Date: 3/26/16
  Time: 5:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-cookies.js"></script>
<script>
    angular.module('myApp', ['ngCookies'])

            .controller('HomeCtrl', ['$scope', '$rootScope','$http','$cookies','$filter',
                function ($scope, $rootScope,$http,$cookies,$filter) {
                    console.log("jj");
                    document.getElementById('lbManagerID').innerHTML = '<br><br>';
                    var user = $cookies.get("user").toString();
                    $http.post('userInfo', {id: user})
                            .success(function (response) {
                                var date = new Date();
                                $scope.userInfo = response[0];
                                $scope.userInfo.dob= $filter('date')(response[0].dob , "dd/MM/yyyy");
                                $http.post('rights', {role: response[0].role})
                                        .success(function (data) {
                                            $scope.rights = data;
                                            $scope.listManagers();
                                        });
                            });
                    $scope.addAdmin= function(){
                        $http.post('addAdmin')
                                .success(function (response) {
                                    if (response.length == 0) {
                                        document.getElementById('lbAdminID').innerHTML = 'Failed to add new admin! Please try again!';
                                    } else {
                                        document.getElementById('lbAdminID').innerHTML = 'Successfully added new admin!' + '<br>' + 'Assigned ID for New Admin = ' + response[0];
                                    }
                                });
                    };
                    $scope.addManager= function(){
                        $http.post('addManager')
                                .success(function (response) {
                                    if (response.length == 0) {
                                        document.getElementById('lbManagerID').innerHTML = 'Failed to add new manager! Please try again!';
                                    } else {
                                        document.getElementById('lbManagerID').innerHTML = 'Successfully added new manager!' + '<br>' + 'Assigned ID for New Manager = ' + response[0];
                                    }
                                });
                    };
                    $scope.listManagers= function(){
                        $http.post('listManagers')
                                .success(function (data) {
                                    $scope.list = data;
                                    console.log($scope.list);
                                });
                    };
                    $scope.promoteManager= function(vw){
                        $http.post('promoteManager', vw)
                                .success(function (response) {
                                    if (response == null || response == "" || response == undefined) {
                                        alert("Something is wrong! please try again!");
                                    } else {
                                        alert("Successfully promoted Manager No." + response + " to Admin");
                                    }
                                    $scope.listManagers();
                                    window.location.href = "/manage users";
                                });
                    };

                }]);
</script>
<style type="text/css">

    .modal-footer .btn-group button {
        height:40px;
        border-top-left-radius : 0;
        border-top-right-radius : 0;
        border: none;
        border-right: 1px solid #ddd;
    }

    .modal-footer .btn-group:last-child > button {
        border-right: 0;
    }
</style>
<head>
    <title>Manage Managers</title>
    <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
</head>
<body>
<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<div class="container" ng-app="myApp">
    <div  ng-controller="HomeCtrl as hmectrl" >
        <jsp:include page="header.jsp" />
        <br/>
        <table style="width:100%">
            <tr>
                <td>
                    <form class="well span8 center-block" style="width: 500px; align-content: center" ng-submit="addAdmin()">
                        <div class="admin_id">
                        <span class="button-checkbox center-block" align="center">
                            <label id="lbAdminID"><br/><br/> </label>
                        </span>
                        </div>

                        <button class="btn btn-primary center-block"  type="submit">Add New Admin</button>
                    </form>
                </td>
                <td>
                    <form class="well span8 center-block" style="width: 500px; align-content: center" ng-submit="addManager()">
                        <div class="manager_id">
                        <span class="button-checkbox center-block" align="center">
                            <label id="lbManagerID"> </label>
                        </span>
                        </div>
                        <button class="btn btn-primary center-block"  type="submit">Add New Manager</button>
                    </form>
                </td>
            </tr>
        </table>

        <h4 style="text-align: center;"><b style='color:#FF0000'>List of all registered managers:</b></h4>
        <div id="regManagers" style="height:405px;width:500px;margin-left: 320px;border:1px solid #ccc;font:16px/26px Georgia, Garamond, Serif;overflow:auto;">
            <section class="col-xs-12 col-sm-6 col-md-20" style="width:500px" ng-model = "list">
                <br>
                <article class="row" ng-repeat = "vw in list">
                    <form id="promoteManager{{vw.id}}" class="well span8 center-block" ng-submit="promoteManager(vw.id)">
                        <h5>Manager No.{{vw.id}}'s Info:</h5>
                        <ul>
                            <li><span>ID: {{vw.id}}</span></li>
                            <li><span>Name: {{vw.lname}}, {{vw.name}}</span></li>
                            <li><span>Email: {{vw.email}}</span></li>
                        </ul>
                        <button class="btn btn-success center-block"  type="submit">Promote to Admin</button>
                    </form>
                </article>
            </section>
        </div>

    </div>
</div>
</body>
</html>
