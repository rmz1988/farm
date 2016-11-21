<%--
反馈详情
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.feedback"/></title>
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
            <li><data:i18n key="currentLocation"/>：</li>
            <li><a href="${basePath}"><data:i18n key="home"/></a></li>
            <li><a href="${basePath}/feedback"><data:i18n key="menu.feedback"/></a></li>
            <li class="active"><data:i18n key="detail"/></li>
        </ol>
        <div class="content">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="index.title"/>：
                    </label>

                    <div class="col-md-8 form-text">
                        ${feedback.title}
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="index.releaseTime"/>：
                    </label>

                    <div class="col-md-8 form-text">
                        <data:date value="${feedback.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="status"/>：
                    </label>

                    <div class="col-md-8 form-text">
                        <data:dict dictgroup="feedbackStatus" value="${feedback.status}"/>
                    </div>
                </div>
                <c:if test="${feedback.status == 1}">
                    <div class="form-group">
                        <label class="col-md-2 control-label">
                            <data:i18n key="index.replyTime"/>：
                        </label>

                        <div class="col-md-8 form-text">
                            <data:date value="${feedback.replyTime}" fmt="yyyy-MM-dd HH:mm:ss"/>
                        </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="index.feedbackContent"/>：
                    </label>

                    <div class="col-md-8 form-text">
                        ${feedback.content}
                    </div>
                </div>
                <c:if test="${not empty feedback.pics}">
                    <div class="form-group">
                        <label class="col-md-2 control-label">
                            <data:i18n key="index.feedbackImg"/>：
                        </label>

                        <div class="col-md-8 form-text">
                            <c:forEach var="pic" items="${fn:split(feedback.pics, ';')}">
                                <div class="col-md-12">
                                    <img class="img-thumbnail img-responsive" src="${sessionScope.imageUrl}${pic}"/>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <c:if test="${feedback.status == 1}">
                    <div class="form-group">
                        <label class="col-md-2 control-label">
                            <data:i18n key="index.replyContent"/>：
                        </label>

                        <div class="col-md-8 form-text">
                                ${feedback.reply}
                        </div>
                    </div>
                </c:if>

                <button id="backBtn" type="button" class="btn btn-default">
                    <data:i18n key="back"/>
                </button>
            </form>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
