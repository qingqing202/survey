<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<title>Nimbus - Web Manager System</title>
<link href="skin/01/css/main.css" rel="stylesheet" type="text/css"/>
<script src="skin/01/js/jquery-1.3.2.js" type="text/javascript"></script>
<script src="skin/01/js/betvalidate.js"></script>
<script language="javascript">
  jQuery(document).ready(function() {
    var msg = "${message}";
    if(msg) {
      alert(msg);
	}
	$("#login").keypress( function(e) {
	  if(e.which == 13) {
		login();
	  }
    });
  });
  
  function login() {
    if ($("#username").val() == "" || $("#password").val() == "") {
      alert("Need : username and password!");
      return;
    }
    if ($("#captcha").val() == "") {
      alert("Need : captcha");
      return;
    }
    $("#form").submit();
  }
  
  
</script>
<style>
	body {text-align:center;}
</style>

</head>
<body>
<div id="login">
 <form id="form" name="form" method="post" action="adminLogin.do" >
  <div class="logo">
    <div class="dd">
	<table width="100%" border="0">
	  <tr class = "input">
		<td>User name:</td>
		<td><input name="username" type="text" class="input" id="username" value="" size="10" maxlength="50"  /></td>
		<td>Password:</td>
		<td><input name="password" type="password" class="input" id="password" value="" size="10" maxlength="50" /></td>
		<td>Valid：</td>
		<td><input type="text" class="input" id="captcha" name="captcha" style="width:40px"/></td>
        <td><img src="/jcaptcha.jpg" class="hand" id="captchaImg" width="50" height="28" onclick="refreshCaptcha();"/></td>
		<td><a href="javascript:login()"><img class="hand" src="./skin/01/images/btlogin.gif" /></a></td>
	  </tr>
	  </table>
    </div>
  </div>
 </form>
</div>
</body>
