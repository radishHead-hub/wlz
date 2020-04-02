<%--
  Created by IntelliJ IDEA.
  User: WangLingzhi
  Date: 2020/3/10
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>
        数据 - AdminLTE2定制版 | Log in</title>


    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- Theme style -->
    <!-- iCheck -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
    <script src="./plugins/ajax/jquery.min.js"></script>
    <script>
        //检查用户名的唯一性
        function doVerify(){
            //获取界面的账号
            var username =  $("#username").val();
            //获取账号后的提示信息文本
            var accountText = document.getElementById("accountText");
            //如果账号输入不为空，执行该方法
            $.ajax({
                    url:"user/ajaxUsername",//后台查询验证的方法
                    contentType:"application/json;charset=UTF-8",
                    data:""+username+"",//携带的参数
                    dataType:"json",
                    type:"post",
                    success: function(data){
                        //根据后台返回前台的msg给提示信息加HTML
                        if(data.username!=null){
                            // 账号已经存在
                            accountText.innerHTML = "<font color='red'>抱歉，"+username+"已被注册，请更换！</font>"
                        }
                        else{
                            // 账号不存在
                            accountText.innerHTML = "<font color='green'>恭喜，"+username+"可以注册！</font>"
                        }
                    }
                });
        }
        function doPhone(){
            //获取界面的账号
            var phone =  $("#phone").val();
            //获取账号后的提示信息文本
            var accountText1 = document.getElementById("accountText1");
            //如果账号输入不为空，执行该方法
            $.ajax({
                url:"user/ajaxPhone",//后台查询验证的方法
                contentType:"application/json;charset=UTF-8",
                data:""+phone+"",//携带的参数
                dataType:"json",
                type:"post",
                success: function(data){
                    //根据后台返回前台的msg给提示信息加HTML
                    if(data.phone!=null){
                        // 账号已经存在
                        accountText1.innerHTML = "<font color='red'>抱歉，手机号已被注册，请更换！</font>"
                    }
                    else{
                        // 账号不存在
                        accountText1.innerHTML = "<font color='green'>恭喜，手机号可以注册！</font>"
                    }
                }
            });
        }
        function checkForm() {
            var uValue = document.getElementById("username").value;
            //alert(uValue);^\w+$
            if(!/^\w+$/.test(uValue)){
                //2.给出错误提示信息
                alert("用户名由数字、26个英文字母或者下划线组成!");
                return false;
            }
            /*校验密码*/
            var pValue = document.getElementById("password").value;
            if(!/^[a-zA-Z]\w{2,17}$/.test(pValue)){
                alert("密码必须以字母开头，长度在3-17之间，只能包含字符、数字和下划线!");
                return false;
            }
            //校验用户姓名
            var realName=document.getElementById("realName").value;
            if(!/^[\u4E00-\u9FA5]{2,10}$/.test(realName)){
                alert("请输入正确的中文名");
                return false;
            }
            //校验手机号
            var phoneValue = document.getElementById("phone").value;
            if(!/(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}/.test(phoneValue)){
                alert("手机号格式不正确!");
                return false;
            }
            /*校验邮箱*/
            var eValue = document.getElementById("email").value;
            if(!/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test(eValue)){
                alert("邮箱格式不正确!");
                return false;
            }
            /*校验地址*/
            var aValue = document.getElementById("addr-show").value;
            if(aValue==""){
                //2.给出错误提示信息
                alert("地址不能为空!");
                return false;
            }

        }
    </script>
</head>

<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">


        <a href="all-admin-index.html"><b>网上订餐管理系统</b></a>


    </div>

    <div class="register-box-body">
        <p class="login-box-msg">新用户注册</p>

        <form action="loginAndRegister/register" method="post" onsubmit="return checkForm()">
            <div class="form-group has-feedback">
                <input type="text" id="username" name="username" class="form-control" placeholder="用户名" onchange="doVerify()">
                <span class="glyphicon glyphicon-home form-control-feedback"></span>
                <span id="accountText"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="password" name="password" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" id="realName" name="realName" class="form-control" placeholder="真实姓名">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" id="phone" name="phone" class="form-control" placeholder="手机号" onchange="doPhone()">
                <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
                <span id="accountText1"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" id="email" name="email" class="form-control" placeholder="Email">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div>
                <!--省份选择-->
                <select id="prov" onchange="showCity(this)">
                    <option>选择省份</option>
                </select>
                <!--城市选择-->
                <select id="city" onchange="showCountry(this)">
                    <option>选择城市</option>
                </select>
                <!--县区选择-->
                <select id="country" onchange="selecCountry(this)">
                    <option>选择县区</option>
                </select>
                <button type="button" class="btn met1" onclick="showAddr()" id="button-show" >确定</button>
                <br/>
                <label for="addr-show">您选择的是：
                    <input type="text" value="" name="address" id="addr-show" placeholder="地址">
                </label>
            </div>
            <div class="checkbox">
                <label>
                    <input type="radio" name="role" value="Boss" checked="checked"/>商家  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </label>
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" checked="checked"> 我同意 <a href="#">协议</a>
                            <%--<input type="hidden" name="regTime" value="<%=new java.util.Date().toLocaleString() %>" readonly="true">--%>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <div class="social-auth-links text-center">
            <p>- 或者 -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-qq"></i> 腾讯QQ用户登录</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-weixin"></i> 微信用户登录</a>
        </div>

        <a href="index.jsp" class="text-center">我有账号，现在就去登录</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="js/address/city.js"></script>
<script src="js/address/method.js"></script>
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>

</html>
