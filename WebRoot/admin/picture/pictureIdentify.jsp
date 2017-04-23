<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>图片识别</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<link href="../styles/base.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var pictureId;
    $("document").ready(function() {
        pictureId = "${picture.id}";
        $("#tr_new_model").hide();
	});
	
	function saveAsSeed() {
	  var model = $("#deviceModel").val();
	  if (model == "") {
	    alert("识别的型号不能为空.");
	    return false;
	  }
	  
	  var ratio = $("#td_ratio").text();
	  if (ratio.trim() == "") {
	    alert("图片特征信息不能为空（长宽比).");
	    return false;
	  } 
	  
	  var colors = $("#td_colors").text();
	  if (colors == "") {
	    alert("图片特征信息不能为空（背景).");
	    return false;
	  }
	  var bkg_color = $("#td_bkg_color").text();
	  if (bkg_color == "") {
	    alert("图片特征信息不能为空（前景).");
	    return false;
	  }
	  var surf = $("#td_surf").text();
	  if (surf == "") {
	    alert("图片特征信息不能为空（Surf).");
	    return false;
	  }
	  
	  $("#action").val("saveSeed");
	  $("#form1").submit();
	}
	
	function redoPiFeature() {
	  $("#action").val("redoPiFeature");
	  $("#form1").submit();
	}
	
	function toDupNewModel(deviceId) {
	  if (deviceId == null || deviceId == "") {
	    alert("获取device出错...");
	    return;
	  }
	  var url = "/admin/data/manageDevice.do?action=dupDevice&deviceId=" + deviceId;
	  this.location.href = url;
	}
	
	function displayOrignalPic(url) {
	  window.open(url);
	}
	
	function deletePic(picId) {
	  var url = "managePicture.do?action=deleteAndViewNextIdentify&pictureId=" + picId;
	  this.location.href = url;
	}
	
	function nextPic(picId) {
	  var url = "managePicture.do?action=viewNextIdentify&pictureId=" + picId;
	  this.location.href = url;
	}
</script>
</head>
<body>

<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">图片识别</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
     </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"><br></td></tr>
  </table>
  
  <s:form id="form1" action="managePicture" method="post">
    <s:hidden name="action" id="action" value="save"/>
    <s:hidden name="pictureId" id="pictureId"/>
    <s:hidden name="pageNo" id="pageNo"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">人工图片识别
        <c:if test="${fn:length(errMsg)>0}">+++[错误：${errMsg}]</c:if>
        </th>
      </tr>
      <tr class="td_bg">
        <td width="20%"  align="center">图片名称：</td>
        <td width="80%">${picture.name }</td>
      </tr>
      <tr class="td_bg">
        <td width="20%"  align="center">上传时间：</td>
        <td width="80%"><s:date name="picture.uploadTime" format="yyyy-MM-dd HH:mm:ss"/></td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备类型：</td>
        <td width="80%" >
	      <input name="type" type="text" id="deviceType" value="${type}" size="20" maxlength="16" class="input" 
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备品牌：</td>
        <td width="80%" >
          <input name="brand" type="text" id="deviceBrand" value="${brand}" size="35" maxlength="25" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
          比如: SAMSUNG
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">识别的设备型号：</td>
        <td width="80%" >
          <input name="model" type="text" id="deviceModel" value="${model}" size="35" maxlength="35" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
             <span class="red bold">若识别的型号与图片型号不符，
               <a href="javascript:toDupNewModel(${picture.device.id})">点击此处复制设备</a>
             </span>
        </td>
      </tr>
      <tr class="td_bg">
        <td width="20%"  align="center">图片：</td>
	    <td bgcolor="#ffffff">
	      <div align="center"><img width="100%"src="managePicture.do?action=display&pictureId=${pictureId}" /></div>
	    </td>
      </tr>
      <tr class="td_bg">
        <td width="20%"  align="center">图片1/6：</td>
	    <td bgcolor="#ffffff">
	      <div align="center"><img src="managePicture.do?action=display2&pictureId=${pictureId}" /></div>
	    </td>
      </tr>
      <c:if test="${fn:length(picture.name3)>0}">
      <tr class="td_bg">
        <td width="20%"  align="center">原图：</td>
	    <td bgcolor="#ffffff">
	      <div align="center"><img src="managePicture.do?action=display3&pictureId=${pictureId}" /></div>
	    </td>
      </tr>
      </c:if>
      <tr >
        <td width="20%"  align="center">长宽比：</td>
	    <td id="td_ratio" bgcolor="#ffffff"> ${picture.ratio}</td>
      </tr>
      <tr>
        <td width="20%"  align="center">颜色分布：</td>
	    <td id="td_colors" bgcolor="#ffffff"> ${picture.colors}</td>
      </tr>
      <tr>
        <td width="20%"  align="center">背景色：</td>
	    <td id="td_bkg_color" bgcolor="#ffffff"> ${picture.bkgColor}</td>
      </tr>
      <tr>
        <td width="20%"  align="center">Surf信息：</td>
	    <td id="td_surf" bgcolor="#ffffff"> ${surfInfo}</td>
      </tr>
      <tr>
        <td width="20%"  align="center">*****</td>
	    <td bgcolor="#ffffff">
	      <input type="button" value="重新提取图片种子特征" onclick="redoPiFeature()"/>　
	      保存到图库时，该图片的长宽比，颜色分布，背景色和surf信息必须不能为空，若没有这些信息，请点击此按钮
	    </td>
      </tr>
    </table>
    
    <table height="75" border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
      <tr>
        <td align="center"> 
          <input name="Submit2" type="submit" value="保 存" class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" />　
          <input name="Submit20" type="button" value="存到图库" class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="saveAsSeed()"/>
          <input name="Submit11" type="button" value="删 除"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="deletePic(${pictureId})"/>
          <input name="Submit12" type="button" value="下一张"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="nextPic(${pictureId})"/>　　
          <input name="Submit22" type="button" value="取 消"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="history.back()"/>　
        </td>
      </tr>
  </table>
  
  </s:form>
</div>

</body>
