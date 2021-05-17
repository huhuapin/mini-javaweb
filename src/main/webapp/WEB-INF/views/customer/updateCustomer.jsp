<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>修改客户信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
	<link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.jss" type="text/javascript"></script>
	<link href="${ctx}/css/pager.css" type="text/css" rel="stylesheet" />
	<script language="javascript" type="text/javascript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">


		$(function(){

			<c:if test="${message != null}">
			$.ligerDialog.success("${message}");
			</c:if>

			/** 客户表单提交 */
			$("#customerForm").submit(function(){
				var name = $("#name");
				var email = $("#email");
				var tel = $("#tel");
				var address = $("#address");
				var birthday = $("#birthday");
				var star = $("#star");
				var description = $("#description");
				var msg = "";
				if ($.trim(name.val()) == ""){
					msg = "姓名不能为空！";
					name.focus();
				} else if ($.trim(birthday.val()) == ""){
					msg = "出生日期不能为空！";
					birthday.focus();
				}else if ($.trim(tel.val()) == ""){
					msg = "手机号码不能为空！";
					tel.focus();
				}else if (!/^1[0-9]{10}$/.test($.trim(tel.val()))){
					msg = "手机号码格式不正确！";
					tel.focus();
				}else if ($.trim(address.val()) == ""){
					msg = "地址不能为空！";
					address.focus();
				}else if ($.trim(email.val()) == ""){
					msg = "邮箱不能为空！";
					email.focus();
				}else if (!/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,5}$/.test($.trim(email.val()))){
					msg = "邮箱格式不正确！";
					email.focus();
				}else if ($.trim(star.val()) == ""){
					msg = "星级不能为空！";
					star.focus();
				}
				if (msg != ""){
					$.ligerDialog.error(msg);
					return false;
				}else{
					return true;
				}
				$("#customerForm").submit();
			});
		});


	</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td height="10"></td></tr>
	<tr>
		<td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：客户管理  &gt; 修改客户信息</td>
		<td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
	</tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	<tr valign="top">
		<td>
			<form action="${ctx}/customer/update" id="customerForm" method="post">
				<!-- 隐藏表单，flag表示添加标记 -->
				<input type="hidden" name="id" value="${customer.id}">
				<table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
					<tr><td class="font3 fftd">
						<table>
							<tr>
								<td class="font3 fftd">姓&nbsp;&nbsp;名：<input type="text" name="name" id="name" size="20" value="${customer.name}"/></td>
								<td class="font3 fftd">性&nbsp;&nbsp;别：
									<select name="sex" style="width:143px;">
										<option value="0" disabled>--请选择性别--</option>
										<option value="1" <c:if test="${customer.sex == 1}"> selected </c:if> >男</option>
										<option value="2" <c:if test="${customer.sex == 2}"> selected </c:if> >女</option>
									</select></td>
							</tr>
							<tr>
								<td class="font3 fftd">出生日期：<input cssClass="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'});"
																   name="birthday" id="birthday" size="20" value="<f:formatDate value="${customer.birthday}" pattern="yyyy-MM-dd"  type="date"/>"/>&nbsp;&nbsp;
								</td>
							</tr>
							<tr><td class="main_tdbor"></td><td class="main_tdbor"></td></tr>
							<tr>
								<td class="font3 fftd">联系方式：<input name="tel" id="tel" size="20" value="${customer.tel}" /></td>
								<td class="font3 fftd">地&nbsp;&nbsp;址：<input name="address" id="address" size="40" value="${customer.address}"/></td>
							</tr>
							<tr>
								<td class="font3 fftd">邮&nbsp;&nbsp;箱：<input name="email" id="email" size="20" value="${customer.email}"/></td>
							</tr>
							<tr><td class="main_tdbor"></td><td class="main_tdbor"></td></tr>

							<tr>
								<td class="font3 fftd">
									星&nbsp;&nbsp;级：<select name="star" id="star" style="width: 160px;">
									<option value="1" <c:if test="${customer.star == 1}">selected</c:if> >1</option>
									<option value="2" <c:if test="${customer.star == 2}">selected</c:if> >2</option>
									<option value="3" <c:if test="${customer.star == 3}">selected</c:if> >3</option>
									<option value="4" <c:if test="${customer.star == 4}">selected</c:if> >4</option>
									<option value="5" <c:if test="${customer.star == 5}">selected</c:if> >5</option>
								</select>
								</td>
								<td class="font3 fftd">
								</td>
							</tr>
							<tr><td class="main_tdbor"></td><td class="main_tdbor"></td></tr>
							<tr><td class="font3 fftd">简&nbsp;&nbsp;介: <textarea name="description" id="description" style="vertical-align:top">${customer.description}</textarea></td></tr>

							<tr><td align="left" class="fftd">
								<input type="submit" value="修改">&nbsp;&nbsp;<input type="reset" value="取消 "></td></tr>
						</table>
					</td></tr>

				</table>
			</form>
		</td>
	</tr>
</table>
<div style="height:10px;"></div>
</body>
</html>