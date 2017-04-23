<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>注册用户管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
	var pageNo;
	$("document").ready(function(){
		pageNo = "${pageNo}";
	});
	
	function delete_(id) {
		var url = "manageCustomer.do?action=delete&customerId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function view_(id) {
	    var url = "manageCustomer.do?action=view&customerId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
</script>
</head>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">注册用户管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" class="blue">无</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="manageCustomer" method="post">
    <s:hidden name="action" id="action" value="index"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td height="25" >
          <div align="center"> 用户名:
            <input type="text" name="name" id="name" value="${name }"/>
          </div>
        </td>
        <td height="25" >
          <div align="center"> 邮箱:
            <input type="text" name="email" id="email" value="${email }"/>
          </div>
        </td>
        <td>注册时间
          <input type="text" name="beginTime" value="<s:date name="beginTime" format="yyyy-MM-dd HH:mm:ss"/>" onClick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',readOnly:true});"/>-
          <input type="text" name="endTime" value="<s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/>"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true});"/>
        </td>
	    <td  height="25" bgcolor="#ffffff">
	      <div align="left"><input type="submit" value="查询"/></div>
	    </td>
      </tr>
    </table>
    
    <br>

    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr>
        <td><input name="checkbox" type="checkbox" class="input " value="checkbox"  id="check_all"/></td>
        <td height="25"><div align="center">PID</div></td>
	    <td height="25"><div align="center">用户名</div></td>
	    <td height="25"><div align="center">昵称</div></td>
	    <td height="25"><div align="center">邮箱</div></td>
	    <td height="25"><div align="center">注册时间</div></td>
	    <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center" class="blue">${rs.id+10000}</div></td>
	    <td height="25" ><div align="center">${rs.name}</div></td>
	    <td height="25" ><div align="center">${rs.nickName}</div></td>
	    <td height="25" ><div align="center">${rs.email}</div></td>
	    <td height="25" ><div align="center"><s:date name="#rs.registerTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
	    <td height="25" >
	      <div align="center">
	        <a href="javascript:view_(${rs.id})">详细</a> | 
	        <a href="javascript:delete_(${rs.id})">删除</a>
	      </div>
	    </td>
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
