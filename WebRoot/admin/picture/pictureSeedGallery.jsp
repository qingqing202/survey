<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>图片墙</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
	var type;
	var brand;
	var sortBy;
	$("document").ready(function() {
		type = "${type}";
		brand = "${brand}";
		sortBy = "${sortBy}";
		select_(sortBy);
	});
	
	function view_(id) {
	    var url = "managePictureSeed.do?action=view&pictureSeedId=" + id;
	    this.location.href = url;
	}
	
	function sortBy_(value) {
	  $("#sortBy").val(value);
	  $("#form1").submit();
	}
	
	function select_(value) {
	  if (value == "uploadTime") {
	    $("#sortBySelect").val("上传时间");
	  } else if (value == "device.model") {
        $("#sortBySelect").val("型号");
      } else {
        $("#sortBySelect").val("");
      }
	}
</script>
</head>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">图片Gallery</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" class="blue">无</a>
      </td>
    </tr>
  </table>
  <br>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr>
      <td height="10">排序方式:
        <select id="sortBySelect" onchange="sortBy_(this.value)">
          <option value="">-默认-</option>
          <option value="uploadTime">上传时间</option>
          <option value="device.model">型号</option>
        </select>
      </td>
    </tr>
  </table>
  <br>
  <s:form id="form1" action="managePictureSeed" method="post">
    <s:hidden name="action" id="action" value="viewGallery"/>
    <s:hidden name="sortBy" id="sortBy"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all hidden">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td height="25" >
          <div align="center">设备类型:
            <input type="text" name="type" value="${type }"/>
          </div>
        </td>
        <td height="25" >
          <div align="center">品牌:
            <input type="text" name="brand" value="${brand }"/>
          </div>
        </td>
        <td height="25" >
          <div align="center"> 上传者:
            <input type="text" name="user" id="user" value="${user }"/>
          </div>
        </td>
        <td>上传时间
          <input type="text" name="beginTime" value="<s:date name="beginTime" format="yyyy-MM-dd HH:mm:ss"/>" onClick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',readOnly:true});"/>-
          <input type="text" name="endTime" value="<s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/>"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true});"/>
        </td>
      </tr>
    </table>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <s:iterator id="rs" value="page.result" status='st'>
      <s:if test="#st.index % 4 == 0">
        <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
      </s:if>
      
        <td bgcolor="#ffffff">
	      <div align="center">
	        <img width="25%" src="managePictureSeed.do?action=display&pictureSeedId=${rs.id}" />
	      </div>
	      <div align="center">
	        <a href="javascript:view_('${rs.id}')">${rs.device.type }/${rs.device.brand.name }/${rs.device.model }</a> 
	      </div>
	      <div align="center">
	        <s:date name="#rs.uploadTime" format="yyyy-MM-dd HH:mm:ss"/>
	      </div>
	    </td>
      
      <s:if test="#st.index % 4 == 3">
        </tr>
      </s:if>
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
