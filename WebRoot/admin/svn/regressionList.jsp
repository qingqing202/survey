<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>Regression</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<link href="../styles/base.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
	function browseLogs_(id) {
		var url = "regressionManager.do?action=logs&regression_id=" + id;
		this.location.href = url;
	}
	function viewTrends_(id) {
		alert("sorry, not implement yet!");
	}
</script>
</head>
<body>
 <div class="tab">
<s:form  action="regressionManager" method="post">
<table width="60%">
<caption class="red bold">Regression view</caption>
  <tr>
  	<td height="25">type :<select name="type">
	  	<s:if test="type.length()>0"><option value="${type}" selected="selected">${type}</option></s:if>
	    <option value="" >all..</option>
	    <option value="full_flow" >full_flow</option>
	    <option value="dr_flow" >dr_flow</option>
	    <option value="gr_flow" >gr_flow</option>
  	</select></td>
    <td height="25">name :<input type="text" name="name" value="${name }"/>
    </td>
    <td>time :<input type="text" name="str_stime" value="<s:date name="stime" format="yyyy-MM-dd HH:mm:ss"/>"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',readOnly:true});"/>-
    <input type="text" name="str_etime" value="<s:date name="etime" format="yyyy-MM-dd HH:mm:ss"/>"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',readOnly:true});"/>
    </td>
	<td  height="25" bgcolor="#ffffff"><div align="left">
	<input type="submit" value="submit" />
	</div></td>
  </tr>
</table>
<br>
<p>Success : ${success_num}, <span class="red bold"> Failed : ${failed_num}</span></p>
<table>
  <tr>
    <td height="25"><div align="center">type</div></td>
    <td height="25"><div align="center">name</div></td>
    <td height="25"><div align="center">status</div></td>
    <td height="25"><div align="center">trend</div></td>
    <td height="25"><div align="center">logs</div></td>
  </tr>
  <s:iterator id="rs" value="page.result">
  <tr>
     <td height="25" ><div align="center">${rs.type}</div></td>
     <td height="25" ><div align="center">${rs.name}</div></td>
     <td height="25" >
     <s:if test="#rs.status=='FAIL' || #rs.status=='CRASH'">
		<div align="center" class="red">${rs.status}</div>
	 </s:if>
	 <s:else>
		<div align="center" class="blue">${rs.status}</div>
	 </s:else>
     
     </td>
     <td height="25" ><div align="center"> <a href="javascript:viewTrends_(${rs.id})">view</a></div></td>
     <td height="25" ><div align="center"> <a href="javascript:browseLogs_(${rs.id})">log</a></div></td>
  </tr>
 </s:iterator>
</table>
  <table width="90%" border="0" align="center">
    <tr>
    <td><jsp:include page="../../util/page.jsp"></jsp:include></td>
    </tr>
  </table>
</s:form>
</div>

</body>
