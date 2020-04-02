<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">


	<title>数据 - AdminLTE2定制版 | Log in</title>


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

	<link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../plugins/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
	<link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">
    <script src="../../plugins/ajax/jquery.min.js"></script>
	<script>
        function checkForm() {
        var regUser = new RegExp("^\\w+$");
        var regPwd = new RegExp("^\\w{2,17}$");//[a-zA-Z]
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        if(username==""||username==null){
                document.getElementById("text1").style.color='#ff0000';
                document.getElementById("text1").innerText="不能为空";
                return false;
            }
        else if(!regUser.test(username)){
                document.getElementById("text1").style.color='#ff0000';
                document.getElementById("text1").innerText="由数字、26个英文字母或者下划线组成!";
                return false;
            }
        else
            {
                document.getElementById("text1").style.color='#008000';
                document.getElementById("text1").innerText="输入格式正确！";
            }
        //密码
            if(password==""||password==null){
                document.getElementById("text2").style.color='#ff0000';
                document.getElementById("text2").innerText="不能为空";
                return false;
            }
            else if(!regPwd.test(password)){
                document.getElementById("text2").style.color='#ff0000';
                document.getElementById("text2").innerText="以字母开头，长度在3-18之间，只能包含字符、数字和下划线!";
                return false;
            }else
            {
                document.getElementById("text2").style.color='#008000';
                document.getElementById("text2").innerText="输入格式正确！";
            }
        }
    </script>
</head>

<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-logo">


		<a href="all-admin-index.html"><b>网上订餐管理系统</b></a>


	</div>
	<!-- /.login-logo -->
	<div class="login-box-body">
		<p class="login-box-msg">登录系统</p>
		<span id="msg" style="color: #ff0000">${msg}</span>
		<form action="/loginAndRegister/login" method="post" onsubmit="return checkForm()">
			<div class="form-group has-feedback">
				<%--<input type="email" name="username" class="form-control" placeholder="Email">--%>
				<input id="username" type="text" name="username" class="form-control" placeholder="用户名" onblur="checkForm()">
				<span  class="glyphicon glyphicon-user form-control-feedback"></span><span id="text1"></span>
			</div>
			<div class="form-group has-feedback">
				<input id="password" type="password" name="password" class="form-control" placeholder="密码" onblur="checkForm()">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span><span id="text2"></span>
			</div>
			<div class="checkbox">
				<label>
                    &nbsp;&nbsp;&nbsp;
					<input type="radio" name="role" value="Boss" checked="checked"/>商家 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="role" value="Admin">管理员
				</label>
			</div>
			<div class="row">
				<!-- /.col -->
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block btn-flat" onclick="">登录</button>
				</div>
				<div class="col-xs-4">
					<button type="button" class="btn btn-primary btn-block btn-flat" onclick="window.location.href='../register.jsp'"> 注册</button>
				</div>
				<!-- /.col -->
			</div>
		</form>

		<div class="social-auth-links text-center">
			<p>- 或者 -</p>
			<a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-qq"></i> 腾讯QQ用户登录</a>
			<a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-weixin"></i> 微信用户登录</a>
		</div>
		<!-- /.social-auth-links -->

		<a href="#">忘记密码</a><br>

	</div>
	<!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../../plugins/iCheck/icheck.min.js"></script>
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