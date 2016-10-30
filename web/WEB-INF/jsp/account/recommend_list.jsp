<%--
  推荐列表
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-推荐列表</title>
</head>
<body>
<div class="container" style="border-radius: 0;">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li>账号管理</li>
            <li class="active">推荐列表</li>
        </ol>
        <div class="content">
            <p>
                <span class="rule-tip-lg">仅展示10代以内的推荐列表</span>
            </p>
            <c:forEach var="recommendList" items="${recommendLevelList}" varStatus="st">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        第${st.index + 1}代
                    </div>
                    <div class="panel-body">
                        <table class="table table-responsive">
                            <thead>
                            <tr>
                                <th>玩家编号</th>
                                <th>姓名</th>
                                <th>状态</th>
                                <th>注册日期</th>
                                <th>推荐人</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="recommendUser" items="${recommendList}">
                                <tr>
                                    <td>${recommendUser.userId}</td>
                                    <td>${recommendUser.name}</td>
                                    <td><data:dict dictgroup="userStatus" value="${recommendUser.status}"/></td>
                                    <td><data:date fmt="yyyy-MM-dd" value="${recommendUser.registerTime}"/></td>
                                    <td>${recommendUser.recommendUserId}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>