<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>图片种子信息查看</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<link href="../styles/base.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var pictureSeedId;
    $("document").ready(function() {
        pictureSeedId = "${pictureSeed.id}";
	});
	
	function redoPiFeature() {
	  $("#action").val("redoPiFeature");
	  $("#form1").submit();
	}
</script>
</head>
<body>

<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">图片种子信息查看</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
     </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="managePictureSeed" method="post">
    <s:hidden name="action" id="action" value="save"/>
    <s:hidden name="pictureSeedId" id="pictureSeedId"/>
    <s:hidden name="pageNo" id="pageNo"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">图片种子信息
        <c:if test="${fn:length(errMsg)>0}">+++[错误：${errMsg}]</c:if>
        </th>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备类型：</td>
        <td width="80%" > ${pictureSeed.type} </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备品牌：</td>
        <td width="80%" > ${pictureSeed.brand} </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备型号：</td>
        <td width="80%" > ${pictureSeed.device.model} </td>
      </tr>
      <tr>
        <td width="20%"  align="center">图片：</td>
	    <td bgcolor="#ffffff">
	      <div align="center"><img src="managePictureSeed.do?action=display&pictureSeedId=${pictureSeedId}" /></div>
	    </td>
      </tr>
      <tr>
        <td width="20%"  align="center">长宽比：</td>
	    <td bgcolor="#ffffff"> ${pictureSeed.ratio}</td>
      </tr>
      <tr>
        <td width="20%"  align="center">颜色分布：</td>
	    <td bgcolor="#ffffff"> ${pictureSeed.colors}</td>
      </tr>
      <tr>
        <td width="20%"  align="center">背景色：</td>
	    <td bgcolor="#ffffff"> ${pictureSeed.bkgColor}</td>
      </tr>
      <tr>
        <td width="20%"  align="center">Surf信息：</td>
	    <td bgcolor="#ffffff"> ${surfInfo}</td>
      </tr>
      <tr>
        <td width="20%"  align="center">*****</td>
	    <td bgcolor="#ffffff">
	      <input type="button" value="重新提取图片种子特征" onclick="redoPiFeature()"/>　
	      提取成功之后会自动保存这些图片特征信息
	    </td>
      </tr>
      <tr>
        <td width="20%"  align="center">OCR辅助信息：</td>
	    <td bgcolor="#ffffff"> 
	     <input name="ocrInfo" type="text" value="${pictureSeed.ocrInfo}" size="64" maxlength="64" class="input" 
                onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
         点击‘保存’按钮提交修改
	    </td>
      </tr>
    </table>  
    
    <table height="75" border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
      <tr>
        <td align="center"> 
          <input name="Submit2" type="submit" value="保 存" class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" />　
          <input name="Submit22" type="button" value="取 消"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="history.back()"/>　
        </td>
      </tr>
  </table>
  </s:form>
</div>

</body>
