<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/6
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="../../plugins/ajax/jquery.min.js"></script>
    <script>
        // 页面加载，绑定单击事件
        $(function(){
            $("#btn").click(function(){
                // alert("hello btn");
                // var theyear = document.getElementById("theyear").value;
                // var ywlx = document.getElementById("ywlx").value;
                // 发送ajax请求
                $.ajax({
                    // 编写json格式，设置属性和值
                    url:"ajaxjson",
                    contentType:"application/json;charset=UTF-8",
                    data:'',
                    // data:{ theyear:theyear , ywlx:ywlx },
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        var res = '';
                        jQuery.each(data,function (i,item){
                            res = $("<input type='button' name='item.name' readonly='true'/>");
                            res.attr('value', item.name);
                            $('#res').append(res);

                        });
                        // data服务器端响应的json的数据，进行解析
                        // jQuery.each(data,function (i,item){
                        //      res = res + '<tr>';
                        //      res = res + '<td>' + '<button id="item" value="item.name">'+item.name+'</button>'+'</td>';
                        //      res = res + '</tr>';
                        // });
                        // // $(this).val("");//清空上次input框里的数据
                        //  $('#res').html(res1);//通过jquery方式获取table，并把tr,td的html输出到table中

                    }
                });
            });
        });
    </script>
</head>
<body>
    <h3>查询所有的帐户</h3>
    <button id="btn">发送ajax的请求用户名</button>
    <table id="res">

    </table>

</body>
</html>
