<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>修改货物</title>
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
				if($.trim(name) == ""){
					alert("请输入货物名称");
					return ;
				}else if($.trim(type) == ""){
					alert("请输入货物类型！");
					return ;
				}else if($.trim(image)=="") {
					alert("未选择图片将不修改图片")
				}else if($.trim(customers)=="") {
					alert("请选择所属客户")
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
		<td class="main_locbg font2"><img src="${ctx }/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：货物管理  &gt; 修改货物
		</td>
		<td width="15" height="32"><img src="${ctx }/images/main_locright.gif" width="15" height="32"></td>
	</tr>
</table>

<table width="100%" height="90%" border="0" cellpadding="10" cellspacing="0" class="main_tabbor">
	<tr valign="top">
		<td>

			<form id="documentForm" enctype="multipart/form-data" name="documentForm" action="${ctx }/goods/update" method="post">
				<input type="hidden" name="id" value="${goods.id}">
				<table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">

					<tr><td class="font3 fftd">


						货物名称：<input type="text" name="name" size="30" id="name" value="${goods.name}"/></td>
					</tr>
					<tr><td class="main_tdbor"></td></tr>


					<tr><td class="font3 fftd">货物类型：
						<select name="type" id="type">
							<option value="煤" <c:if test="${goods.type == '煤'}"> selected </c:if>> 煤</option>
							<option value="石油" <c:if test="${goods.type == '石油'}"> selected </c:if>> 石油</option>
							<option value="焦炭" <c:if test="${goods.type == '焦炭'}"> selected </c:if>> 焦炭</option>
							<option value="金属矿石" <c:if test="${goods.type == '金属矿石'}"> selected </c:if>> 金属矿石</option>
							<option value="钢铁及有色金属" <c:if test="${goods.type == '钢铁及有色金属'}"> selected </c:if>> 钢铁及有色金属</option>
							<option value="非金属矿石" <c:if test="${goods.type == '非金属矿石'}"> selected </c:if>> 非金属矿石</option>
							<option value="磷矿石" <c:if test="${goods.type == '磷矿石'}"> selected </c:if>> 磷矿石</option>
							<option value="矿物性建筑材料" <c:if test="${goods.type == '矿物性建筑材料'}"> selected </c:if>> 矿物性建筑材料</option>
							<option value="水泥" <c:if test="${goods.type == '水泥'}"> selected </c:if>> 水泥</option>
							<option value="木材" <c:if test="${goods.type == '木材'}"> selected </c:if>> 木材</option>
							<option value="粮食" <c:if test="${goods.type == '粮食'}"> selected </c:if>> 粮食</option>
							<option value="棉花" <c:if test="${goods.type == '棉花'}"> selected </c:if>> 棉花</option>
							<option value="化肥及农药" <c:if test="${goods.type == '化肥及农药'}"> selected </c:if>> 化肥及农药</option>
							<option value="盐" <c:if test="${goods.type == '盐'}"> selected </c:if>> 盐</option>
							<option value="化工品" <c:if test="${goods.type == '化工品'}"> selected </c:if>> 化工品</option>
							<option value="金属制品" <c:if test="${goods.type == '金属制品'}"> selected </c:if>> 金属制品</option>
							<option value="工业机械" <c:if test="${goods.type == '工业机械'}"> selected </c:if>> 工业机械</option>
							<option value="电子、电气机械" <c:if test="${goods.type == '电子、电气机械'}"> selected </c:if>> 电子、电气机械</option>
							<option value="农业机具" <c:if test="${goods.type == '农业机具'}"> selected </c:if>> 农业机具</option>
							<option value="鲜活货物" <c:if test="${goods.type == '鲜活货物'}"> selected </c:if>> 鲜活货物</option>
							<option value="农副产品" <c:if test="${goods.type == '农副产品'}"> selected </c:if>> 农副产品</option>
							<option value="饮食品及烟草制品" <c:if test="${goods.type == '饮食品及烟草制品'}"> selected </c:if>> 饮食品及烟草制品</option>
							<option value="纺织品。皮革、皮毛及其制品" <c:if test="${goods.type == '纺织品。皮革、皮毛及其制品'}"> selected </c:if>> 纺织品。皮革、皮毛及其制品</option>
							<option value="纸及文教用品" <c:if test="${goods.type == '纸及文教用品'}"> selected </c:if>> 纸及文教用品</option>
							<option value="医药品" <c:if test="${goods.type == '医药品'}"> selected </c:if>> 医药品</option>
							<option value="其他货物" <c:if test="${goods.type == '其他货物'}"> selected </c:if>> 其他货物</option>
						</select>
<%--						<input type="text" name="type" size="30" id="type" value="${goods.type}">--%>
					</td></tr>
					<tr><td class="main_tdbor"></td></tr>

					<tr><td class="font3 fftd">货物图片：<br/>
						<input type="file" name="file" id="file"  size="30"/>
					</td></tr>
					<tr><td class="main_tdbor"></td></tr>

					<tr><td class="font3 fftd">所属客户：<br/>
						<select name="customersId" id="customers" multiple="multiple" class="customers">
							<c:forEach items="${customers}" var="customer">
								<option value="${customer.id}" <c:if test="${ids.contains(customer.id)}"> selected </c:if> >${customer.name}</option>
							</c:forEach>
						</select>
					</td></tr>

					<tr><td class="font3 fftd">
						<input type="button" id="btn" value="修改">
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