<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/jsp/common.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

 
    <style type="text/css">
    
    	
    </style>
  </head>
<body > 
    <div   class ="container "> 
		<jsp:include page="../nav.jsp"></jsp:include>
     	
		<div class="panel panel-default">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		         我的课程
		      </h3>
		   </div>
		   <div class="panel-body">
		      
		
       
       <table class="table">
		   <thead>
		      <tr>
		         <th>课程名</th>
		         <th>课程类别</th>
		         <th>课程地点</th>
		         <th>联系人</th>
		         <th>联系电话</th>
		         <th>报名时间</th>
		         <th>状态</th>
		         <th>操作</th>
		      </tr>
		   </thead>
		   <tbody>
		    
		      <c:forEach items="${courseList}" var="crs" varStatus="s">
		      	 <tr  class="active">
			         <td>${crs.courseName }</td>
			         <td>${crs.courseTypeName }</td>
			         <td>${crs.courseAddress }</td>
			         <td>${crs.contactPerson }</td>
			         <td>${crs.contactTel }</td>
			         <td>${crs.applyTime }</td>
			         <td>
			         	<c:if test="${crs.applyStatus  == 0}">待审核</c:if>
			         	<c:if test="${crs.applyStatus  == 1}">审核通过</c:if>
			         	<c:if test="${crs.applyStatus  == 2}">审核未通过</c:if>
			         </td>
			         <td>
			         	<button type="button" class="btn  btn-default  btn-detail"  refid="detail_${crs.tid }" >详细</button>
			         </td>
			      </tr>
			      <tr id="detail_${crs.tid}" style="display: none;" >
			      	<td colspan="12">
			      		<table class="table table-condensed">
			      				  <c:forEach items="${crs.detail}" var="d" varStatus="s">
					        	<tr  class="success">
						        	  <td>${d.courseName }</td>
							         <td>${d.startTime }</td>
							         <td>${d.endTime }</td>
					        	 </tr>
					       </c:forEach>
			      		</table>
			      	</td>
			      </tr>
			     
		      	
		      </c:forEach>
		   </tbody>
		</table>
		   </div>
		</div>
    </div>   


    <script type="text/javascript">
    	
    	$(document).ready(function(){
    		
    		$(".btn-detail").click(function(){
    			var refid = $(this).attr("refid");
    			if($("#"+refid).css("display")=="none") {
    				$("#"+refid).css("display","");
    			} else {
    				$("#"+refid).css("display","none");
    			}
    			
    		});
    		$(".btn-submit").click(function(){
    			var refid = $(this).attr("refid");
    			window.location.href ="${ctx}/crs/detail/"+refid+".do?auth=y";
    		});
       });
    </script>
  </body>
</html>
