<%@ tag import="com.jfinal.kit.StrKit" %>
<%@tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="id" required="true" rtexprvalue="false" %>
<%@attribute name="name" required="true" rtexprvalue="false" %>
<%@attribute name="imgNote" required="false" rtexprvalue="true" %>
<%@attribute name="imgName" required="false" rtexprvalue="true" %>
<%@attribute name="imgUrl" required="false" rtexprvalue="true" %>

<c:set var="basePath" value="${pageContext.request.contextPath}"/>

<div class="upload-area">
    <input type="file" id="<%=id%>"/>

    <div class="upload-area-img">
        <c:if test="${empty imgUrl}">
            <img id="<%=id%>Img" src="${basePath}/images/default_img.gif" alt="上传图片"/>
        </c:if>
        <c:if test="${not empty imgUrl}">
            <img id="<%=id%>Img" src="${imgUrl}" alt="上传图片"/>
        </c:if>
    </div>
    <div class="progress active">
        <div id="<%=id%>Progress" class="progress-bar progress-bar-success" style="width:0;">

        </div>
    </div>
    <%--<span class="btn btn-success btn-block">--%>
    <%--上传图片--%>
    <%--</span>--%>
</div>
<input type="hidden" id="uploadedCount" value="0"/>
<input type="hidden" id="uploadedPics" value=""/>
<%--<input id="<%=id%>Name" class="uploaded-name" type="text" name="<%=name%>" value="${imgName}"/>--%>
<%--<span class="img-tip" style="position: absolute;bottom:0;"><%=StrKit.notBlank(imgNote) ? imgNote : ""%></span>--%>
<%--<img id="pic1" name="" class="img-thumbnail img-responsive" src="" alt="" style="display:none;width:60px;height:60px;vertical-align: top;margin-left:5px;"/>--%>
<%--<img id="pic2" name="" class="img-thumbnail img-responsive" src="" alt="" style="display:none;width:60px;height:60px;vertical-align: top;margin-left:5px;"/>--%>
<%--<img id="pic3" name="" class="img-thumbnail img-responsive" src="" alt="" style="display:none;width:60px;height:60px;vertical-align: top;margin-left:5px;"/>--%>
<%--<img id="pic4" name="" class="img-thumbnail img-responsive" src="" alt="" style="display:none;width:60px;height:60px;vertical-align: top;margin-left:5px;"/>--%>
<%--<img id="pic5" name="" class="img-thumbnail img-responsive" src="" alt="" style="display:none;width:60px;height:60px;vertical-align: top;margin-left:5px;"/>--%>

