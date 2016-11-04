<%--
  申请激活中心
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-申请激活中心</title>
    <script>
        seajs.use('account/active_apply');
    </script>
</head>
<body>
<div class="container" style="border-radius: 0;">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li>账号管理</li>
            <li class="active">申请激活中心</li>
        </ol>
        <div class="content table-responsive">
            <c:choose>
                <c:when test="${not empty activeNo}">
                    <span class="rule-tip-lg">您已具备激活中心权限，请点击菜单【账号管理】-【激活管理】进行操作！</span>
                </c:when>
                <c:when test="${recommendCount < 10}">
                    <span class="rule-tip-lg">您的推荐人数不足10人，暂不能申请激活中心！</span>
                </c:when>
                <c:when test="${not empty activeAuthApply}">
                    <%--展示激活申请列表--%>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>玩家编号</th>
                            <th>姓名</th>
                            <th>激活中心编号</th>
                            <th>申请时间</th>
                            <th>状态</th>
                            <c:if test="${activeAuthApply.status != 0}">
                                <th>审核时间</th>
                            </c:if>
                            <c:if test="${activeAuthApply.status == 2}">
                                <th>操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${activeAuthApply.userId}</td>
                            <td>${activeAuthApply.name}</td>
                            <td>${activeAuthApply.activeNo}</td>
                            <td><data:date value="${activeAuthApply.applyTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><data:dict dictgroup="activeApplyStatus" value="${activeAuthApply.status}"/></td>
                            <c:if test="${activeAuthApply.status != 0}">
                                <td><data:date value="${activeAuthApply.statusTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
                            </c:if>
                            <c:if test="${activeAuthApply.status == 2}">
                                <td>
                                    <button id="editBtn" name="${activeAuthApply.applyId}" type="button" class="btn btn-info btn-sm">
                                        编辑
                                    </button>
                                </td>
                            </c:if>
                        </tr>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <%--展示申请表单--%>
                    <form id="applyForm" class="form-horizontal" role="form" method="post">
                        <input type="hidden" id="userId" value="${user.userId}">
                        <div class="form-group">
                            <label class="control-label col-md-3">
                                玩家编号：
                            </label>
                            <div class="col-md-5 form-text">
                                    ${user.userId}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">
                                姓名：
                            </label>
                            <div class="col-md-5 form-text">
                                    ${user.name}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">
                                推荐人数：
                            </label>
                            <div class="col-md-4 form-text">
                                    ${recommendCount}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                申请激活码：
                            </label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="activeNo" name="activeNo" maxlength="3"
                                       placeholder="请输入3位数字，系统内唯一">
                            </div>
                        </div>
                        <button id="applyBtn" class="btn btn-success" type="button">提 交</button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
