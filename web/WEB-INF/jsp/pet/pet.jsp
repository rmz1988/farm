<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-牧场管理</title>
</head>
<body>
<div class="container">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li class="active">牧场管理</li>
        </ol>
        <div class="content">
            <div class="panel panel-success">
                <div class="panel-heading">
                    我的宠物
                </div>
                <div class="panel-body">
                    <div class="pet col-md-4 col-sm-12 col-xs-12">
                        <img src="${basePath}/images/tiane.gif" alt="天鹅">
                    </div>
                    <div class="pet-info col-md-8 col-sm-12 col-xs-12">
                        <p>
                            宠物名称：天鹅
                        </p>
                        <p>
                            <button type="button" class="btn btn-success btn-lg">
                                喂养
                            </button>
                            <span class="rule-tip">今天喂养将产生30枚金币，每天只能喂养1次</span>
                        </p>
                        <p>
                            <button type="button" class="btn btn-info btn-lg">
                                复购
                            </button>
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-success">
                <div class="panel-heading">
                    宠物明细
                </div>
                <div class="panel-body">
                    <table class="table table-responsive">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>领养日期</th>
                            <th>领养天数</th>
                            <th>产币量</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>第1轮</td>
                            <td>2016-10-01</td>
                            <td>15</td>
                            <td>450</td>
                        </tr> <tr>
                            <td>第2轮</td>
                            <td>2016-10-14</td>
                            <td>5</td>
                            <td>150</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
