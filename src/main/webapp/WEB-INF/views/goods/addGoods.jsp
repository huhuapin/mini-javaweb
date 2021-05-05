<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>添加货物</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link href="fkjava.ico" rel="shortcut icon" type="image/x-icon" />
		<link href="${ctx }/css/css.css" type="text/css" rel="stylesheet" />
		<link href="${ctx }/css/ySelect.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
        <script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
		<script type="text/javascript" src="${ctx}/js/tiny_mce/tiny_mce.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
		<script type="text/javascript" src="${ctx}/js/ySelect.js"></script>
		<script type="text/javascript">
		
	    $(document).ready(function() {

	        /** 表单提交的校验 */
	        $("#btn").click(function(){
	        	var name = $("#name").val();
	            var type = $("#type").val();
	   			var image = $("#image").val();
	   			var customers = $("#customers").ySelectedValues(",");
				console.log(customers)

				if($.trim(name) == ""){
	        		alert("请输入货物名称");
	        		return ;
	        	}else if($.trim(type) == ""){
	        		alert("请输入货物类型！");
	        		return ;
	        	}else if($.trim(image)=="") {
	        		alert("请选择图片")
					return ;
				}else if($.trim(customers)=="") {
	        		alert("请选择所属客户");
	        		return ;
				}
	        	
	        	$("#documentForm").submit();
	        	
	        })
	    });
		$(function() {
			$('#customers').ySelect(
					{
						placeholder: '请选择客户',
						searchText: '搜索',
						showSearch: true,
						numDisplayed: 4,
						overflowText: '已选中 {n}项',
						isCheck:false
					}
			);

			// $("#current").click(function(){
			// 	alert($("#m1").ySelectedValues(","));
			// 	alert($("#m1").ySelectedTexts(","));
			// });

		});
			
			
		</script>
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			 <tr><td height="10"></td></tr>
			 <tr>
			    <td width="15" height="32"><img src="${ctx }/images/main_locleft.gif" width="15" height="32"></td>
				<td class="main_locbg font2"><img src="${ctx }/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：货物管理  &gt; 添加货物
</td>
				<td width="15" height="32"><img src="${ctx }/images/main_locright.gif" width="15" height="32"></td>
			 </tr>
		</table>
	
		<table width="100%" height="90%" border="0" cellpadding="10" cellspacing="0" class="main_tabbor">
		  	<tr valign="top">
			    <td>
			    
				 <form id="documentForm" enctype="multipart/form-data" name="documentForm" action="${ctx }/goods/add" method="post">
				  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
                        
					    <tr><td class="font3 fftd">
					              
					                
					                货物名称：<input type="text" name="name" size="30" id="name"/></td>
					    </tr>
						<tr><td class="main_tdbor"></td></tr>
						
						
						<tr><td class="font3 fftd">货物类型：
							<input type="text" name="type" size="30" id="type">
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
						
							<tr><td class="font3 fftd">货物图片：<br/>
							<input type="file" name="file" id="image"  size="30"/>
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>

					  <tr><td class="font3 fftd">所属客户：<br/>
						  <select name="customersId" id="customers" multiple="multiple" class="customers">
							  <c:forEach items="${customers}" var="customer">
								  <option value="${customer.id}">${customer.name}</option>
							  </c:forEach>
						  </select>
					  </td></tr>
						
						<tr><td class="font3 fftd">
								<input type="button" id="btn" value="添加">
								<input type="reset" value="重置">
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
					

				  </table>
				  </form>
				</td>
		  	</tr>
		</table>
		<div style="height:10px;"></div>
	</body>
</html>