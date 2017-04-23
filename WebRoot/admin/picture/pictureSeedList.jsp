<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>图片库管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
	var pageNo;
	var type;
	$("document").ready(function(){
		pageNo = "${pageNo}";
		$("#check_all").toggle(function(){
			$("[name='id']").attr("checked",'true');
		},
		function(){
			$("[name='id']").removeAttr("checked");
		})
		
		$("#deviceType option").each(function() {
		    if ($(this).val() == "TV") {
		      $(this).text("电视机");
		    } else if ($(this).val() == "STB") {
		      $(this).text("机顶盒");
		    } else if ($(this).val() == "PROJECTOR") {
		      $(this).text("投影仪");
		    } else if ($(this).val() == "AIRCONDITIONAL") {
		      $(this).text("空调");
		    } else if ($(this).val() == "DVD") {
		      $(this).text("DVD");
		    } else if ($(this).val() == "FAN") {
		      $(this).text("电风扇");
		    } else if ($(this).val() == "MUSICPLAYER") {
		      $(this).text("音乐播放器");
		    }
		});  
		
		type = "${type}";
		if (type != "") {
		  listBrands(type);
		}
	});
	
	function view_(id) {
		var url = "managePictureSeed.do?action=view&pictureSeedId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function duplicate_(id) {
		var url = "managePictureSeed.do?action=duplicate&pictureSeedId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function delete_(id) {
		var url = "managePictureSeed.do?action=delete&pictureSeedId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function enterGallery() {
	  $("#action").val("viewGallery");
	  $("#form1").submit();
	}
	
	function subm() {
	  $("#action").val("index");
	  $("#form1").submit();
	}
	
</script>
</head>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">图片库管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" class="blue">无</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="managePictureSeed" method="post">
    <s:hidden name="action" id="action" value="index"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
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
          <div align="center">型号:
            <input type="text" name="model" value="${model }"/>
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
        <td  height="25" bgcolor="#ffffff">
          <div align="left"><input type="button" value="进入图片墙" onclick="enterGallery()"/></div>
        </td>
	    <td  height="25" bgcolor="#ffffff">
	      <div align="left"><input type="button" value="查询" onclick="subm()"/></div>
	    </td>
      </tr>
    </table>
    
    <br>

    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr>
        <td><input name="checkbox" type="checkbox" class="input " value="checkbox"  id="check_all"/></td>
        <td height="25"><div align="center">文件名</div></td>
	    <td height="25"><div align="center">设备类型</div></td>
	    <td height="25"><div align="center">品牌</div></td>
	    <td height="25"><div align="center">型号</div></td>
	    <td height="25"><div align="center">长宽比</div></td>
	    <td height="25"><div align="center">OCR辅助信息</div></td>
	    <td height="25"><div align="center">上传者</div></td>
	    <td height="25"><div align="center">上传时间</div></td>
	    <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center" class="blue">${rs.name}</div></td>
	    <td height="25" ><div align="center">${rs.type}</div></td>
	    <td height="25" ><div align="center">${rs.brand}</div></td>
	    <td height="25" ><div align="center">${rs.device.model}</div></td>
	    <td height="25" ><div align="center">${rs.ratio}</div></td>
	    <td height="25" ><div align="center">${rs.ocrInfo}</div></td>
	    <td height="25" ><div align="center">${rs.uploadUser}</div></td>
	    <td height="25" ><div align="center"><s:date name="#rs.uploadTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
	    <td height="25" >
	      <div align="center">
	        <a href="javascript:view_(${rs.id})">查看</a> | 
	        <a href="javascript:duplicate_(${rs.id})">批量复制</a> | 
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
