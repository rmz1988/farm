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

    <link rel="stylesheet" href="${basePath}/js/frame/bootstrap/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="${basePath}/js/frame/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
    <link rel="stylesheet" href="${basePath}/css/style.css"/>
    <link rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css"/>
    <link rel="stylesheet" href="${basePath}/css/jquery.fileupload.css"/>

    <script src="${basePath}/js/frame/jquery-1.10.2.min.js"></script>

    <script src="${basePath}/js/frame/vendor/jquery.ui.widget.js"></script>
    <script src="${basePath}/js/frame/jquery.fileupload.js"></script>
    <script src="${basePath}/js/frame/jquery.iframe-transport.js"></script>
    <script src="${basePath}/js/frame/jquery.fileupload-process.js"></script>
    <script src="${basePath}/js/frame/jquery.fileupload-validate.js"></script>

    <script src="${basePath}/js/frame/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/frame/html5shiv.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/frame/respond.min.js"></script>

    <script type="text/javascript" src="${basePath}/js/frame/sea.js"></script>
    <script>
        var basePath = '${basePath}';
        var locale = '${locale}';

        seajs.config({
            base: '${basePath}/js/',
            alias: {
                jquery: 'frame/jquery-1.10.2.min.js',
                jqueryValidate: 'frame/jquery.validate.min.js',
                bootstrap: 'frame/bootstrap/js/bootstrap.min.js',
                jqueryFileupload: 'frame/jquery.fileupload.js',
                jqueryFileuploadProcess: 'frame/jquery.fileupload-process.js',
                jqueryFileuploadTransport: 'frame/jquery.iframe-transport.js',
                jqueryFileuploadValidate: 'frame/jquery.fileupload-validate.js',
                jqueryUiWidget: 'frame/vendor/jquery.ui.widget.js'
            },
            charset: 'UTF-8'
        });

    </script>
</head>
<body>

</body>
</html>
