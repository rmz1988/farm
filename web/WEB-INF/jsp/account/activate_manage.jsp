<%--
  激活管理
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-激活管理</title>
    <script>
        seajs.use('account/active_manage');
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li>账号管理</li>
            <li class="active">激活中心</li>
        </ol>
        <div class="content">
            <c:choose>
                <c:when test="${canVisit == false}">
                    <span class="rule-tip-lg">
                        激活管理允许访问时间：每天7:00 —— 24:00
                    </span>
                </c:when>
                <c:when test="${empty user.activeNo}">
               <span class="rule-tip-lg">
                   您暂不具备激活中心管理权限，请点击菜单【账号管理】-【申请激活中心】进行申请。
               </span>
                </c:when>
                <c:otherwise>
                    <form class="form-inline" role="form">
                        <div class="form-group">
                            <label class="label-control">用户编号：</label>
                            <input type="text" class="form-control" id="userId" name="userId">
                        </div>
                        <div class="form-group">
                            <label class="label-control">状态：</label>
                            <select name="status" id="status" class="form-control">
                                <option value="">全部</option>
                                <option value="0">等待激活</option>
                                <option value="1">已激活</option>
                            </select>
                        </div>
                        <button id="queryBtn" type="button" class="btn btn-success">查 询</button>
                    </form>
                    <hr>
                    <div id="content" class="table-responsive">
                        <jsp:include page="activate_manage_list.jsp" flush="true"/>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
