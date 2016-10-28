<%@tag pageEncoding="utf-8" import="com.ingkoo.farm.utils.DateUtils" %>
<%@ tag import="com.jfinal.kit.StrKit" %>
<%@ tag import="java.util.Date" %>
<%@attribute name="value" required="true" rtexprvalue="true" %>
<%@attribute name="fmt" required="true" rtexprvalue="false" %>

<%
    String date = "";
    if (StrKit.notBlank(value)) {
        long time = Long.parseLong(value);
        date = DateUtils.format(new Date(time), fmt);
    }
%>
<%=date%>


