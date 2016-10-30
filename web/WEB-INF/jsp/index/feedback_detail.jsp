<%--
反馈详情
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-反馈</title>
    <script>
        seajs.use('user/feedback');
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li><a href="${basePath}">首页</a></li>
            <li><a href="${basePath}/feedback">反馈</a></li>
            <li class="active">详情</li>
        </ol>
        <div class="content">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        标题：
                    </label>
                    <div class="col-md-8 form-text">
                        ${feedback.title}
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        反馈时间：
                    </label>
                    <div class="col-md-8 form-text">
                        <data:date value="${feedback.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        状态：
                    </label>
                    <div class="col-md-8 form-text">
                        <data:dict dictgroup="feedbackStatus" value="${feedback.status}"/>
                    </div>
                </div>
                <c:if test="${feedback.status == 1}">
                    <div class="form-group">
                        <label class="col-md-2 control-label">
                            回复时间：
                        </label>
                        <div class="col-md-8 form-text">
                            <data:date value="${feedback.replyTime}" fmt="yyyy-MM-dd HH:mm:ss"/>
                        </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        反馈内容：
                    </label>
                    <div class="col-md-8 form-text">
                        ${feedback.content}
                    </div>
                </div>
                <c:if test="${feedback.status == 1}">
                    <div class="form-group">
                        <label class="col-md-2 control-label">
                            回复内容：
                        </label>
                        <div class="col-md-8 form-text">
                                ${feedback.reply}
                        </div>
                    </div>
                </c:if>

                <button id="backBtn" type="button" class="btn btn-default">
                    返 回
                </button>
            </form>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
