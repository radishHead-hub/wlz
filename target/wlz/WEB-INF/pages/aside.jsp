<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
					 class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>${sessionScope.username}</p>
				<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">

			<li id="admin-index"><a
					href="main.jsp"><i
					class="fa fa-dashboard"></i> <span>首页</span></a></li>

			<li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
				<span>数据管理</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>

				<ul class="treeview-menu">
                    <%--suppress XmlDuplicatedId --%>
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/user/findAll"> <i
							class="fa fa-circle-o"></i> 用户管理
					</a></li>
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/user/findAll?page=1&size=3"> <i
							class="fa fa-circle-o"></i> 商家管理
					</a></li>
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/shop/findAll?page=1&size=3">
						<i class="fa fa-circle-o"></i> 店铺管理
					</a></li>

				</ul>
			</li>
            <li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
                <span>添加数据</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>
                <ul class="treeview-menu">
                    <%--suppress XmlDuplicatedId --%>
                    <li id="system-setting">
                        <a href="${pageContext.request.contextPath}/sysLog/findAll"> <i class="fa fa-circle-o"></i> 添加菜品</a>
                    </li>
                </ul>
                <ul class="treeview-menu">
                    <%--suppress XmlDuplicatedId --%>
                    <li id="system-setting">
                        <a href="${pageContext.request.contextPath}/shop/addJsp"> <i class="fa fa-circle-o"></i> 添加店铺</a>
                    </li>
                </ul>
            </li>
			<li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
				<span>基础数据</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
                    <%--suppress XmlDuplicatedId --%>
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/food/findAll">
						<i class="fa fa-circle-o"></i> 菜品管理
					</a></li>
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/order/findAll"> <i
							class="fa fa-circle-o"></i> 订单管理
					</a></li>
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/count/findAll"> <i
							class="fa fa-circle-o"></i> 优惠管理
					</a></li>
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/feedback/findAll?page=1&pageSize=3"> <i
							class="fa fa-circle-o"></i> 评论管理
					</a></li>

				</ul>
			</li>
			<li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
				<span>图表分析</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/shop/findAll"> <i
							class="fa fa-circle-o"></i> 销售分析
					</a></li>
                    <%--suppress XmlDuplicatedId --%>
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/shop/findAll"> <i
							class="fa fa-circle-o"></i> 菜品分析
					</a></li>
				</ul>
			</li>

			<li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
				<span>系统说明</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
<%--suppress XmlDuplicatedId --%>
					<li id="system-setting">
						<a href="${pageContext.request.contextPath}/sysLog/findAll"> <i
								class="fa fa-circle-o"></i>开发者说明</a>
					</li>
				</ul>
			</li>

		</ul>
	</section>
	<!-- /.sidebar -->
</aside>