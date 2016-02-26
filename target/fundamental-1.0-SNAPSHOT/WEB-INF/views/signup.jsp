

<%--
  Created by IntelliJ IDEA.
  User: sai
  Date: 2/17/16
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noarchive" />
    <title>Sign In</title>
    <link rel="shortcut icon" href="https://launchpad-asset2.37signals.com/favicon.ico?1455655021" />
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

    <script>
        angular.module('myApp', [])

                .controller('SignUpCtrl', ['$scope', '$rootScope','$http',
                    function ($scope, $rootScope,$http) {
                        $scope.roles = [];
                        $scope.user = [];
                        $http.post('roles')
                                .success(function (response) {
                                    if(response.length==0) {

                                    }
                                    else
                                    {
                                        $scope.roles = response
                                    }

                                        //window.location.href="sign_up"
                                });
                        $scope.signUp = function()
                        {

                            if($scope.validateForm() == true)
                            {
                                var d = Date.parse(document.getElementById('calendar').value);
                                $http.post('signupCtrl', {
                                    name: $scope.user.name,
                                    lname:$scope.user.lname,
                                    email: $scope.user.email,
                                    pwsd: $scope.user.pwsd,
                                    id: $scope.user.id,
                                    role:$scope.user.role,
                                    dob:d
                                })
                                        .success(function (response) {
                                            console.log(response);
                                            console.log(response.length);
                                            if (response.length == 0) {
                                                document.getElementById('lbltipAddedComment').innerHTML = 'Error is Signing up!! Please try again';

                                            }
                                            else {
                                                document.getElementById('lbltipAddedComment').innerHTML = 'Successfully Signed Up';
                                                alert("Please verify your account by opening the link sent to your email and then try Signing in");
                                                window.location.href = "/"
                                            }
                                        });
                                //httpost
                            }
                        };
                        $scope.validateForm = function()
                        {
                            //console.log($scope.user);

                            if($scope.user.name == "" || $scope.user.name == undefined)
                            {
                                document.getElementById('lbltipAddedComment').innerHTML = 'First Name cannot be empty';
                                return false;
                            }
                            if($scope.user.lname == "" || $scope.user.lname == undefined)
                            {
                                document.getElementById('lbltipAddedComment').innerHTML = 'Last Name cannot be empty';
                                return false;
                            }
                            if($scope.user.email == "" || $scope.user.email == undefined)
                            {
                                document.getElementById('lbltipAddedComment').innerHTML = 'Email id cannot be empty';
                                return false;
                            }
                            else
                            {
                                if($scope.validateEmail()== false)
                                {
                                    return false;
                                }
                            }
                            if($scope.user.pwsd == "" || $scope.user.pwsd == undefined)
                            {
                                document.getElementById('lbltipAddedComment').innerHTML = 'Password field cannot be empty';
                                return false;
                            }
                            if($scope.pswd2 == "" || $scope.pswd2 == undefined)
                            {
                                document.getElementById('lbltipAddedComment').innerHTML = 'Confirm Password cannot be empty';
                                return false;
                            }
                            if($scope.user.pwsd != $scope.pswd2)
                            {
                                document.getElementById('lbltipAddedComment').innerHTML = 'Passwords doesnot match';
                                return false;
                            }
                            if($scope.user.role == "" || $scope.user.role == undefined)
                            {
                                document.getElementById('lbltipAddedComment').innerHTML = 'Role should be selected';
                                return false;
                            }
                            if(document.getElementById('roleid').disabled == false && ($scope.user.id =="" || $scope.user.id == undefined))
                            {
                                document.getElementById('lbltipAddedComment').innerHTML = 'Id is required if you are a ' + $scope.user.role;
                                return false;
                            }
                            return true;
                        };
                        $scope.validateEmail = function(){

                            var x = $scope.user.email;
                            var atpos = x.indexOf("@");
                            var dotpos = x.lastIndexOf(".");
                            if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
                                document.getElementById('lbltipAddedComment').innerHTML = 'Invalid Email id entered!!';
                                return false;
                            }
                            return true;
                        };
                        $scope.update = function()
                        {
                            if($scope.user.role == "Manager" || $scope.user.role == "Admin" )
                            {
                                console.log($scope.user);
                                document.getElementById('roleid').disabled = false;
                            }
                            else{
                                document.getElementById('roleid').disabled = true;
                            }
                        };

                    }]);
    </script>
    <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
    <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <style type="text/css">
        .colorgraph {
            height: 5px;
            border-top: 0;
            background: #c4e17f;
            border-radius: 5px;
            background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
        }

        .navbar-default .navbar-brand{
            color:#fff;
            font-size:30px;
            font-weight:bold;
        }
        .form .form-control { margin-bottom: 10px; }
        @media (min-width:768px) {
            #home{
                margin-top:50px;
            }
            #home .slogan{
                color: #0e385f;
                line-height: 29px;
                font-weight:bold;
            }
        }
    </style>




</head>
<body ng-app="myApp">

<div class="container">
    <div class="row" style="margin-top:20px" >
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3" ng-controller="SignUpCtrl as sgnctrl">
            <form  role="form" ng-submit="signUp()">
                <fieldset>
                    <h2>Sign Up</h2>
                    <hr class="colorgraph">

                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <input type="text" autocapitalize="off" autocomplete="off" name="firstname" value="" class="form-control input-lg" placeholder="First Name"  ng-model="user.name"/>                        </div>
                    <div class="col-xs-6 col-md-6">
                        <input type="text" autocapitalize="off" autocomplete="off" name="lastname" value="" class="form-control input-lg" placeholder="Last Name"  ng-model="user.lname"/>                        </div>
                </div>
                    <br/>
                <input type="text" autocapitalize="off" autocomplete="off" name="email" value="" class="form-control input-lg" placeholder="Your Email" ng-model="user.email"/>
                <br/>
                    <input type="password" name="password" value="" class="form-control input-lg" placeholder="Password" ng-model = "user.pwsd"/>
                <br/>
                    <input type="password" name="confirm_password" value="" class="form-control input-lg" placeholder="Confirm Password" ng-model = "pswd2"/>
                <br/>
                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <select name="role" value="" class="form-control input-lg" ng-model = "user.role" ng-change="update()">
                            <option value="">Please select Role</option>
                            <option id="{{rol}}" ng-repeat="rol in roles" value="{{rol}}">{{rol}}</option>
                        </select>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <input  id = "roleid" type="text" autocapitalize="off" autocomplete="off" name="id" value="" class="form-control input-lg" placeholder="Assigned ID" disabled  ng-model = "user.id"/>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <select name="gender" value="" class="form-control input-lg" placeholder="Gender" ng-model="user.gender">
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                        </select>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <div class='input-group date' id='datepicker1'>
                                <input type="text" id ="calendar" class="form-control input-lg" ng-model = "parent.checkOut"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                             <label id="lbltipAddedComment"></label>
                        </div>
                    </div>
                </div>
                    <hr class="colorgraph">
                <button class="btn btn-lg btn-success btn-block" type="submit">
                    Create account</button>
            </fieldset>

            </form>
        </div>
    </div>
</div>
</div>
<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

<script>

    $(function() {
        $( "#calendar" ).datepicker();
    });
</script>
</body>
</html>