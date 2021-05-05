<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>修改个人信息</title>
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
	<script type="text/javascript">
	
	$(function(){

		<c:if test="${message != null}">
		$.ligerDialog.alert("${message}");
		</c:if>


    	/** 个人信息表单提交 */
		$("#userForm").submit(function(){
			var name = $("#name");
			var oldPassowrd = $("#oldPassword");
			var newPassword = $("#newPassword");
			var passwordConfirmation = $("#passwordConfirmation");
			var msg = "";
			if ($.trim(name.val()) == ""){
				msg = "姓名不能为空！";
				name.focus();
			}
			if ($.trim(oldPassowrd.val()) != "" || $.trim(newPassword.val()) != "" || $.trim(passwordConfirmation.val()) != "") {
				if ($.trim(oldPassowrd.val()) == ""){
					msg = "原密码不能为空！";
					oldPassowrd.focus();
				}else if ($.trim(newPassword.val()) == ""){
					msg = "新密码不能为空！";
					newPassword.focus();
				}else if ($.trim(passwordConfirmation.val()) != $.trim(newPassword.val())){
					msg = "两次输入不一致";
					passwordConfirmation.focus();
				}
			}

			if (msg != ""){
				$.ligerDialog.error(msg);
				return false;
			}else{
				return true;
			}
			$("#userForm").submit();
		});
    });
		

	</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="10"></td></tr>
  <tr>
    <td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
	<td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：用户管理  &gt; 修改用户</td>
	<td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
  </tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	 <form action="${ctx}/updateInfo" id="userForm" method="post">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr><td class="font3 fftd">
		    	<table>
		    		<tr>
		    			<td class="font3 fftd">姓名：<input type="text" name="name" id="name" size="20" value="${user.name}"/></td>
		    		</tr>
		    			
		    		<tr>
		    			<td class="font3 fftd">原密码：<input name="old_password" id="oldPassword" size="20" value="" type="password"/></td>
		    		</tr>
					<tr>
						<td class="font3 fftd">新密码：<input name="new_password" id="newPassword" size="20" value="" type="password"/></td>
					</tr>
					<tr>
						<td class="font3 fftd">再次确认：<input name="password_confirmation" id="passwordConfirmation" size="20" value="" type="password"/></td>
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