<%--
    激活明细
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-激活收入明细</title>
    <script>
        seajs.use('finance/active');
    </script>
</head>
<body>
<div class="container" style="border-radius: 0;">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li>财务管理</li>
            <li class="active">激活收入明细</li>
        </ol>
        <div id="content" class="content table-responsive">
            <jsp:include page="active_list.jsp" flush="true"/>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
