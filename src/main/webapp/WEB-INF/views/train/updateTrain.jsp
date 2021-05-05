<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>修改车辆</title>
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
			//更新完成弹出框
			<c:if test="${message != null}">
			$.ligerDialog.success("${message}");
			</c:if>

			/** 车辆表单提交 */
			$("#deptForm").submit(function(){
				var number = $("#number");
				var site = $("#site");
				var carriage_num = $("#carriage_num")
				var bearing = $("#bearing")
				var created_time = $("#created_time")
				var msg = "";
				if ($.trim(number.val()) == ""){
					msg = "车辆号不能为空！";
					number.focus();
				}else if ($.trim(site.val()) == ""){
					msg = "途径地点不能为空！";
					site.focus();
				}else if ($.trim(carriage_num.val()) == ""){
					msg = "车厢数量不能为空！";
					carriage_num.focus();
				}else if ($.trim(bearing.val()) == ""){
					msg = "最大承重不能为空！";
					bearing.focus();
				}else if ($.trim(created_time.val()) == ""){
					msg = "投产时间不能为空";
					created_time.focus();
				}
				if (msg != ""){
					$.ligerDialog.error(msg);
					return false;
				}else{
					return true;
				}
				$("#deptForm").submit();
			});
		});


	</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td height="10"></td></tr>
	<tr>
		<td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：车辆管理  &gt; 添加车辆</td>
		<td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
	</tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	<tr valign="top">
		<td>
			<form action="${ctx}/train/update" id="deptForm" method="post">
				<input type="hidden" name="id" value="${train.id}">
				<table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
					<tr><td class="font3 fftd">
						<table>
							<tr>
								<td class="font3 fftd">车辆号：&nbsp;<input type="text" name="trainNumber" id="number" size="20" value="${train.trainNumber}"/></td>
								<td class="font3 fftd">车辆类型：<select name="type_id" id=""type style="width: 160px;">
									<c:forEach items="${types}" var="type">
										<option value="${type.id}" <c:if test="${type.id == train.type.id}"> selected </c:if> >${type.type}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr><td class="main_tdbor"></td><td class="main_tdbor"></td></tr>
							<tr>
								<td class="font3 fftd" colspan="2">途径地点：<input type="text" name="site" id="site" size="55" value="${train.site}"/></td>
							</tr>
							<tr><td class="main_tdbor"></td><td class="main_tdbor"></td></tr>
							<tr>
								<td class="font3 fftd">车厢数量：<input type="number" name="carriageNum" id="carriage_num"  size="20" value="${train.carriageNum}"/></td>
								<td class="font3 fftd">最大承重：<input type="number" name="bearing" id="bearing" size="20" value="${train.bearing}" /></td>
							</tr>
							<tr>
								<td class="font3 fftd">投产日期：<input cssClass="Wdate" autocomplete="off" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'});"
																   name="createdTime" id="created_time" size="20" value="<f:formatDate value="${train.createdTime}" pattern="yyyy-MM-dd"  type="date"/>"/></td>
							</tr>
						</table>
					</td></tr>
					<tr><td class="main_tdbor"></td></tr>

					<tr><td align="left" class="fftd"><input type="submit" value="修改 ">&nbsp;&nbsp;<input type="reset" value="取消 "></td></tr>
				</table>
			</form>
		</td>
	</tr>
</table>
<div style="height:10px;"></div>
</body>
</html>