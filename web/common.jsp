
<%--
  公共
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="taglib.jsp" %>
<%
    // 设置 HTTP/1.1 no-cache 头
    response.setHeader("Cache-Control", "no-store,no-cache,must-revalidate");
    // 设置 IE 扩展 HTTP/1.1 no-cache headers， 用户自己添加
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    // 设置标准 HTTP/1.0 no-cache header.
    response.setHeader("Pragma", "no-cache");
%>
<html>
<head lang="zh-CN">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${basePath}/images/farm.ico" type="image/x-icon" rel="shortcut icon" media="screen">
    <link href="${basePath}/images/farm.ico" type="image/x-icon" rel="icon">
    <link href="${basePath}/images/farm.ico" type="image/x-icon" rel="bookmark">

    <link href="${basePath}/js/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${basePath}/js/bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet">
    <link href="${basePath}/css/style.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="${basePath}/js/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var basePath = '${basePath}';
    </script>

    <!--[if lte IE 9]>
    <script type="text/javascript" src="${basePath}/js/frameworks/html5shiv.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/frameworks/respond.min.js"></script>
    <![endif]-->
</head>
<body>

</body>
</html>
