<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>图片中心管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
	var pageNo;
	var type;
	$("document").ready(function() {
		pageNo = "${pageNo}";
		$("#check_all").toggle(function(){
			$("[name='id']").attr("checked",'true');
		},
		function(){
			$("[name='id']").removeAttr("checked");
		})
		
		$("a[name='uploadUser']").each(function(index, item) {
		  markUser(item);
	    });

		$("a[name='identifyStatus']").each(function(index, item) {
		  markStatus(item);
	    });
	});
	
	function identifyLog_(id) {
		var url = "managePicture.do?action=viewIdentifyLog&pictureId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function identify_(id) {
		var url = "managePicture.do?action=identify&pictureId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function label_(id) {
		var url = "managePicture.do?action=label&pictureId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function delete_(id) {
		var url = "managePicture.do?action=delete&pictureId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function viewUser_(user) {
	    var uid = user.replace(/\+/g, '%2B');
	    var url = "/admin/customer/managePhoneUser.do?uid=" + uid;
		this.location.href = url;
	}

	function processed_(picId) {
        var url = "managePicture.do?action=markProcessed&pictureId=" + picId;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	
	function pushMessage_(clientId, picId) {
	    var clientId = clientId.replace(/\+/g, '%2B');
	    var url = "/admin/customer/pushMessage.do?clientId=" + clientId + "&pictureId=" + picId;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function preview_(id) {
	  $("#img_preview").attr("src", "managePicture.do?action=display&pictureId=" + id);
	  var xpos = event.clientX + 2 + "px";
	  var ypos = event.clientY + 2 + "px";
	  $("#preview_div").css({"left":xpos, "top":ypos});
	  $("#preview_div").show();
	}
	
	function dispreview_() {
	  $("#preview_div").hide();
	}
	
	function markUser(item) {
	  var user = $(item).text();
	  if (user == "a000004f76a27b" ||
	      user == "a000004fb5a009" ||
	      user == "a000004fe2a92e" ||
	      user == "+8618621534830" ||
	      user == "+8618616348766" ||
	      user == "864601022073951" ||
	      user == "867080021203397" ||
	      user == "354332070882138" ||
	      user == "867515022663321" ||
	      user == "864587026826140") {
	    $(item).removeClass().addClass('green');
	  }
	  if (user == "a000004f76a27b") 
	    user += "(Sarah)";
	  else if (user == "a000004fb5a009") 
	    user += "(Mike)";
	  else if (user == "a000004fe2a92e") 
	    user += "(唐怡)";
	  else if (user == "+8618621534830") 
	    user += "(似飞)";
	  else if (user == "+8618616348766") 
	    user += "(佐渭)";
	  else if (user == "864601022073951") 
	    user += "(佐渭)";
	  else if (user == "867080021203397")
	    user += "(小米4)";
	  else if (user == "354332070882138")
	    user += "(三星S6)";
      else if (user == "867515022663321")
	    user += "(红米Note2)";
	  else if (user == "864587026826140")
	    user += "(一加)";
	  $(item).text(user)
	}

	function markStatus(item) {
	  var status = $(item).text();
	  if (status == "kPicIdentified" ||
	      status == "kPicDownloaded" ||
	      status == "kPicReplied" ||
	      status == "kPicProcessed" ||
	      status == "kPicSeed") {
	    $(item).removeClass().addClass('green');
	  } else if (status == "kPicUnidentified" ||
	      status == "kPicNotRemote") {
	    $(item).removeClass().addClass('red');
	  } else if (status == "kPicUserIdentified") {
	    $(item).removeClass().addClass('yellow');
	  } else if (status == "kPicAdminIdentified") {
	    $(item).removeClass().addClass('blue');
      }
	}

	
</script>
</head>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">图片中心管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" class="blue">无</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="managePicture" method="post">
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
          <div align="center"> 上传者:
            <input type="text" name="user" id="user" value="${user }"/>
          </div>
        </td>
        <td>上传时间
          <input type="text" name="beginTime" value="<s:date name="beginTime" format="yyyy-MM-dd HH:mm:ss"/>" onClick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',readOnly:true});"/>-
          <input type="text" name="endTime" value="<s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/>"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true});"/>
        </td>
	    <td  height="25" bgcolor="#ffffff">
	      <div align="left"><input type="submit" value="查询" onclick="subm()"/></div>
	    </td>
      </tr>
    </table>
    
    <br>

    <table id="table1" width="90%" align="center" cellspacing="1" class="table table_all">
      <tr>
        <td><input name="checkbox" type="checkbox" class="input " value="checkbox"  id="check_all"/></td>
        <td height="25"><div align="center">文件名</div></td>
	    <td height="25"><div align="center">设备类型</div></td>
	    <td height="25"><div align="center">品牌</div></td>
	    <td height="25"><div align="center">型号</div></td>
	    <td height="25"><div align="center">个推ID</div></td>
	    <td height="25"><div align="center">上传者</div></td>
	    <td height="25"><div align="center">上传时间</div></td>
	    <td height="25"><div align="center">状态</div></td>
	    <td height="25"><div align="center">--</div></td>
	    <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center" class="blue">${rs.name}</div></td>
	    <td height="25" ><div align="center">${rs.type}</div></td>
	    <td height="25" ><div align="center">${rs.brand}</div></td>
	    <td height="25" ><div align="center">${rs.device.model}</div></td>
	    <td height="25" ><div align="center"><a href="javascript:pushMessage_('${rs.clientId}',${rs.id})">${rs.clientId}</a></div></td>
	    <td height="25" ><div align="center"><a name="uploadUser" href="javascript:viewUser_('${rs.uploadUser}')">${rs.uploadUser}</a></div></td>
	    <td height="25" ><div align="center"><s:date name="#rs.uploadTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
	    <td height="25" ><div align="center"><a name="identifyStatus">${rs.status}</a></div></td>
	    <td height="25" ><div align="center"><a href="javascript:identifyLog_(${rs.id})">识别日志</a></div></td>
	    <td height="25" >
	      <div align="center">
	        <a onclick="preview_('${rs.id}')" onmouseout="dispreview_()">预览</a> |
	        <a href="javascript:identify_(${rs.id})">识别</a> | 
	        <a href="javascript:processed_(${rs.id})">已处理</a> |
	        <a href="javascript:label_(${rs.id})">标签</a> | 
	        <a href="javascript:delete_(${rs.id})">删除</a> |
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
    
    <div id="preview_div" style="position:absolute; left:0px; top:0px; z-index:3">
      <img id="img_preview" width="100"/>
    </div>
  </s:form> 
</div>

</body>
