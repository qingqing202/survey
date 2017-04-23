<%@ page language="java" import="java.util.*" pageEncoding="GBK" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script>
	function jumpPage(pageNo) {
		$("#pageNo").val(pageNo);
		$("form").submit();
	}
	function jumpPage1() {
		$("#pageNo").val($("#pageNum").val());
		$("form").submit();
	}
</script>

<div>
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	<span style="margin-right:10px;">Each page: ${page.pageSize} records, </span>
	<span style="margin-right:10px;">Total: ${page.totalCount} records, </span>
	<span style="margin-right:10px;">Current Page: ${page.pageNo}/${page.totalPages} </span> 
	<span style="margin-right:10px;">
	<s:if test="page.pageNo==1">
		<span class="disabled">First</span>
		<span class="disabled">Prev</span>
	</s:if>
	<s:else>
		<a href="javascript:jumpPage(1)" class="cr_link">First</a>
		<a href="javascript:jumpPage(${page.pageNo-1})" class="cr_link">Prev</a>
	</s:else>
	
	<s:if test="page.pageNo>=page.totalPages">
		<span class="disabled">Next</span> 
		<span class="disabled">Last</span>
	</s:if>
	<s:else>
		<a href="javascript:jumpPage(${page.pageNo+1})" class="cr_link">Next</a>
		<a href="javascript:jumpPage(${page.totalPages})" class="cr_link">Last</a>
	</s:else>
	</span> 
	<input type="text" name="pageNum" style="width: 30px" id="pageNum" value="${page.pageNo}" />  
	<input type="button" value="go" onclick="jumpPage1();"/>
</div>
