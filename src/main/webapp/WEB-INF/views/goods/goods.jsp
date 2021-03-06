<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>货物管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${ctx }/css/css.css" type="text/css" rel="stylesheet" />
	<link href="${ctx }/css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
	<link href="${ctx }/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet" type="text/css" />  
	<script src="${ctx }/js/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx }/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="${ctx }/js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
	<script src="${ctx }/js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
	<style>
		img {
			max-height: 120px;
		}
	</style>
	<script type="text/javascript">
	    $(function(){
	    	
	    	var boxs = $("input[type='checkbox'][id^='box_']");
	    	/** 给全选按钮绑定点击事件  */
	    	$("#checkAll").click(function(){
	    		// this是checkAll  this.checked是true
	    		// 所有数据行的选中状态与全选的状态一致
	    		boxs.attr("checked",this.checked);
	    	})
	    	
	    	/** 给每个数据行绑定点击事件：判断如果数据行都选中全选也应该选中，反之  */
	    	boxs.click(function(event){
	    		/** 去掉复选按钮的事件传播：点击复选会触发行点击：因为复选在行中 */
	    		event.stopPropagation();
	    		
	    		/** 判断当前选中的数据行有多少个  */
	    		var checkedBoxs = boxs.filter(":checked");
	    		/** 判断选中的总行数是否等于总行数：以便控制全选按钮的状态   */
	    		$("#checkAll").attr("checked",checkedBoxs.length == boxs.length);
	    	})
	    	
	    	/** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
	    	$("tr[id^='data_']").hover(function(){
	    		$(this).css("backgroundColor","#eeccff");
	    	},function(){
	    		$(this).css("backgroundColor","#ffffff");
	    	}).click(function(){
	    		/** 控制该行是否需要被选中 */
	    		/** 获取此行的复选框id */
	    		var checkboxId = this.id.replace("data_","box_");
	    		
	    		/** 触发本行的复选点击 */
	    		$("#"+checkboxId).trigger("click");
	    	})
	    	
	    	/** 删除货物绑定点击事件 */
	 	   $("#delete").click(function(){
	 		   /** 获取到用户选中的复选框  */
	 		   var checkedBoxs = boxs.filter(":checked");
	 		   if(checkedBoxs.length < 1){
	 			   $.ligerDialog.error("请选择一个需要删除的货物！");
	 		   }else{
	 			   /** 得到用户选中的所有的需要删除的ids */
	 			   var ids = checkedBoxs.map(function(){
	 				   return this.value;
	 			   })
	 			   
	 			   $.ligerDialog.confirm("确认要删除吗?","删除货物",function(r){
	 				   if(r){
	 					   // alert("删除："+ids.get());
	 					   // 发送请求
	 					   window.location = "${ctx }/goods/delete?ids=" + ids.get();
	 				   }
	 			   });
	 		   }
	 	   })
	    	
	    	
	    	
	    })
	    
	    function down(id){
	    	$("a[id='down_"+id+"']").trigger("click");
	    }
	    
	</script>
</head>
<body>
	<!-- 导航 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td height="10"></td></tr>
	  <tr>
	    <td width="15" height="32"><img src="${ctx }/images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="${ctx }/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：货物管理 &gt; 货物查询</td>
		<td width="15" height="32"><img src="${ctx }/images/main_locright.gif" width="15" height="32"></td>
	  </tr>
	</table>
	
	<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	  <!-- 查询区  -->
	  <tr valign="top">
	    <td height="30">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
			  <td class="fftd">
			  	<form name="documentform" method="get" id="documentform" action="${ctx }/goods/search">
				    <table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
					    <td class="font3">
					    	货物名称：<input type="text" name="name" />
							货物类型：
							<select name="type" id="type">
							<option value=""></option>
							<option value="煤">煤</option>
							<option value="石油">石油</option>
							<option value="焦炭">焦炭</option>
							<option value="金属矿石">金属矿石</option>
							<option value="钢铁及有色金属">钢铁及有色金属</option>
							<option value="非金属矿石">非金属矿石</option>
							<option value="磷矿石">磷矿石</option>
							<option value="矿物性建筑材料">矿物性建筑材料</option>
							<option value="水泥">水泥</option>
							<option value="木材">木材</option>
							<option value="粮食">粮食</option>
							<option value="棉花">棉花</option>
							<option value="化肥及农药">化肥及农药</option>
							<option value="盐">盐</option>
							<option value="化工品">化工品</option>
							<option value="金属制品">金属制品</option>
							<option value="工业机械">工业机械</option>
							<option value="电子、电气机械">电子、电气机械</option>
							<option value="农业机具">农业机具</option>
							<option value="鲜活货物">鲜活货物</option>
							<option value="农副产品">农副产品</option>
							<option value="饮食品及烟草制品">饮食品及烟草制品</option>
							<option value="纺织品。皮革、皮毛及其制品">纺织品。皮革、皮毛及其制品</option>
							<option value="纸及文教用品">纸及文教用品</option>
							<option value="医药品">医药品</option>
							<option value="其他货物">其他货物</option>
						</select>
					    	<input type="submit"  value="搜索"/>
					    	<input type="button" id="delete" value="删除">
					    </td>
					  </tr>
					</table>
				</form>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
	  
	  <!-- 数据展示区 -->
	  <tr valign="top">
	    <td height="20">
		  <table width="100%" border="1" cellpadding="5" cellspacing="0" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
		    <tr class="main_trbg_tit" align="center">
		      <td><input type="checkbox" id="checkAll" ></td>
			  <td>货物名称</td>
			  <td>货物类型</td>
			  <td>图片描述</td>
			  <td>所属客户</td>
			  <td>操作</td>
			</tr>
			<c:forEach items="${goods}" var="goods" varStatus="stat">
				<tr ondblclick="down(${goods.id});"  class="main_trbg" align="center" id="data_${stat.index}">
					<td><input type="checkbox" id="box_${stat.index}" value="${goods.id}"></td>
					 <td>${goods.name}</td>
					 <td>
						${goods.type}
					  </td>
					  <td><img src="${ctx}/${goods.image}" alt="货物图片"></td>
					  <td>
						  <c:forEach items="${goods.customers}" var="customer">
							  <a href="${ctx}/customer/update?id=${customer.id}">${customer.name} </a>
						  </c:forEach>
					  </td>
					 <td align="center" width="40px;"><a href="${ctx }/goods/update?id=${goods.id}">
							<img title="修改" src="${ctx }/images/update.gif"/></a>
					  </td>
				</tr>
			</c:forEach>
			 

		  </table>
		</td>
	  </tr>
	  <!-- 分页标签 -->
	  <tr valign="top"><td align="center" class="font3">
	  	   <fkjava:pager 
	  	      pageIndex="${pageModel.pageIndex}" 
	  	      pageSize="${pageModel.pageSize}" 
	  	      recordCount="${pageModel.recordCount}" 
	  	      submitUrl="${ctx}/goods?pageIndex={0}"
	  	      style="flickr"
	  	      />
	  </td></tr>
	</table>
	<div style="height:10px;"></div>
</body>
</html>