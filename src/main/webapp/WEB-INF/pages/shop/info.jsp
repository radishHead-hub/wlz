<%--
  Created by IntelliJ IDEA.
  User: WangLingzhi
  Date: 2020/3/24
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>饿度子—网上订餐系统后台管理</title>
    <meta name="description" content="饿度子—网上订餐系统后台管理">
    <meta name="keywords" content="饿度子—网上订餐系统后台管理">




    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <script src="../../../plugins/ajax/jquery.min.js"></script>
    <script>
        // 页面加载，绑定单击事件
        function search(){
            var search = document.getElementById("search").value;
            $.ajax({
                // 编写json格式，设置属性和值
                url:"ajaxSearch",
                contentType:"application/json;charset=UTF-8",
                // data:"{\"search\":\""+search+"\"}",//json是一个字符串
                data:""+search+"",
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data.id==null){
                        alert("搜索失败！");
                    }else{
                        location.href="../boss/search.jsp";
                        // var tr;
                        // tr='<td><input name="ids" type="checkbox"></td>'+
                        //     '<td>'+data.id+'</td>'+
                        //     '<td>'+data.username+'</td>'+
                        //     '<td>'+data.role+'</td>'+
                        //     '<td>'+data.vip+'</td>'+
                        //     '<td>'+data.regTime+'</td>'+
                        //     '<td>'+data.status+'</td>'+
                        //     '<td class="text-center">'+
                        //     '<input type="button" class="btn bg-olive btn-xs" value="详情" onclick="user/findByIds?id='+data.id+'"/>'+
                        //     '<input type="button" class="btn bg-orange btn-xs" value="更新" onclick="user/findById?id='+data.id+'"/>'+
                        //     '<input type="button" class="btn bg-maroon btn-xs" value="删除" onclick="user/deleteById?id='+data.id+'"/>'+
                        //     '</td>'
                        //
                        // $("#res").append(tr)
                    }


                }
            });
        }
    </script>

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->








    <!-- jQuery 2.2.3 -->
    <!-- jQuery UI 1.11.4 -->
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- Bootstrap 3.3.6 -->
    <!-- Morris.js charts -->
    <!-- Sparkline -->
    <!-- jvectormap -->
    <!-- jQuery Knob Chart -->
    <!-- daterangepicker -->
    <!-- datepicker -->
    <!-- Bootstrap WYSIHTML5 -->
    <!-- Slimscroll -->
    <!-- FastClick -->
    <!-- iCheck -->
    <!-- AdminLTE App -->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- bootstrap color picker -->
    <!-- bootstrap time picker -->
    <%--<!--<script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>-->--%>
    <!-- Bootstrap WYSIHTML5 -->
    <!--bootstrap-markdown-->
    <!-- CK Editor -->
    <!-- InputMask -->
    <!-- DataTables -->
    <!-- ChartJS 1.0.1 -->
    <!-- FLOT CHARTS -->
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
    <!-- jQuery Knob -->
    <!-- Sparkline -->
    <!-- Morris.js charts -->
    <!-- Ion Slider -->
    <!-- Bootstrap slider -->
    <!-- bootstrap-datetimepicker -->
    <!-- 页面meta /-->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="../header.jsp"></jsp:include>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="../aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                数据管理
                <small>数据表单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="../main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">数据管理</a></li>
                <li class="active">数据表单</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <div class="box-body">
                <!--tab页-->
                <div class="nav-tabs-custom">
                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-label" data-toggle="tab">店铺详情</a>
                        </li>
                    </ul>
                    <!--tab头/-->
                    <%--<div class="pull-left">--%>
                        <%--<div class="form-group form-inline">--%>
                            <%--<div class="btn-group">--%>
                                <%--&lt;%&ndash;<button type="button" class="btn btn-default" title="新建" onclick='location.href="all-order-manage-edit.html"'><i class="fa fa-file-o"></i> 新建</button>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<button type="button" class="btn btn-default" title="删除" onclick='confirm("你确认要删除吗？")'><i class="fa fa-trash-o"></i> 删除</button>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<button type="button" class="btn btn-default" title="开启" onclick="openUser()"><i class="fa fa-check"></i>开启</button>&ndash;%&gt;--%>
                                <%--<button type="button" class="btn btn-default" title="返回" onclick="history.back(-1);"><i class="fa fa-ban"></i>返回</button>--%>
                                <%--<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <!--tab内容-->
                    <div class="tab-content">

                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-label">
                            <div class="row data-type">
                                <div class="col-md-2 title">ID</div>
                                <div class="col-md-4 data text">
                                    ${shop.id}
                                </div>
                                <div class="col-md-2 title">店铺名称</div>
                                <div class="col-md-4 data text">
                                    ${shop.shopName}
                                </div>
                                <div class="col-md-2 title">店铺类型</div>
                                <div class="col-md-4 data text">
                                    ${shop.shopType}
                                </div>
                                <div class="col-md-2 title">店铺座机号/手机号</div>
                                <div class="col-md-4 data text">
                                    ${shop.shopPhone}
                                </div>
                                <div class="col-md-2 title">申请开店时间</div>
                                <div class="col-md-4 data text">
                                    ${shop.openTime}
                                </div>
                                <div class="col-md-2 title">所属商家账户</div>
                                <div class="col-md-4 data text">
                                    ${shop.boss_name}
                                </div>
                                <div class="col-md-2 title">营业执照号</div>
                                <div class="col-md-4 data text">
                                    ${shop.shopNo}
                                </div>
                                <div class="col-md-2 title">店铺详细地址</div>
                                <div class="col-md-4 data text">
                                    ${shop.shopAddress}
                                </div>
                                <div class="col-md-2 title rowHeight2x">店铺图片</div>
                                <div class="col-md-4 data rowHeight2x" align="center">
                                    <img src="${pageContext.request.contextPath}/upload/${shop.shopImg}" width="80px" height="80px"/>
                                </div>
                                <div class="col-md-2 title rowHeight2x">店铺介绍</div>
                                <div class="col-md-4 data rowHeight2x">
                                    ${shop.shopInfo}
                                </div>

                                <div class="col-md-2 title"></div>
                                <% if(session.getAttribute("role").equals("Admin")) {%>
                                <div class="col-md-10 data text-center">
                                    <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/shop/pass?id=${shop.id}'">通过</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/shop/ban?id=${shop.id}'">驳回</button>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-default" title="返回" onclick="history.back(-1);">返回</button>
                                </div>
                                <%}else{%>
                                <div class="col-md-10 data text-center">
                                    <button type="button" class="btn bg-maroon" onclick="window.location.reload();">刷新</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2020-2022 <a
                href="http://www.itcast.cn">饿度子研发部</a>.
        </strong> All rights reserved. </footer>
    <!-- 底部导航 /-->

</div>
<script type="text/javascript">
    /* 批量开启 */
    //首先定义一个字符串用来拼接存储复选框值
    var uid = '';
    function openUser() {
        //获取指定复选框集
        var list = document.getElementsByName("ids");
        //循环遍历每一个复选框
        for ( var i = 0; i < list.length; i++) {
            //如果某个复选框被选中
            if (list[i].checked) {
                //将该复选框的value值拼接到字符串childrenId后
                uid = uid+list[i].value+",";
            }
        }
        //如果最后childrenId的值为空串，说明界面一个复选框都未选中
        if(uid==''){
            //则提示信息
            alert("请选择要开启的数据!");
        }
        else{
            //如果有选中的则触发请求进行删除
            window.location.href = "openUserById?id="+uid;
        }
    }

</script>
<script type="text/javascript">
    /* 批量锁定 */
    //首先定义一个字符串用来拼接存储复选框值
    var uid = '';
    function lockUser() {
        //获取指定复选框集
        var list = document.getElementsByName("ids");
        //循环遍历每一个复选框
        for ( var i = 0; i < list.length; i++) {
            //如果某个复选框被选中
            if (list[i].checked) {
                //将该复选框的value值拼接到字符串childrenId后
                uid = uid+list[i].value+",";
            }
        }
        //如果最后childrenId的值为空串，说明界面一个复选框都未选中
        if(uid==''){
            //则提示信息
            alert("请选择要删除的数据!");
        }
        else{
            //如果有选中的则触发请求进行删除
            window.location.href = "lockUserById?id="+uid;
        }
    }
    lockUser
</script>
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("order-manage");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>

</html>