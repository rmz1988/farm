<%@tag pageEncoding="utf-8" import="com.ingkoo.utils.date.DateUtil" %>
<%@ tag import="com.ingkoo.utils.exception.FormatException" %>
<%@ tag import="java.util.Date" %>
<%@ tag import="com.jfinal.kit.StrKit" %>
<%@attribute name="value" required="true" rtexprvalue="true" %>
<%@attribute name="fmt" required="true" rtexprvalue="false" %>

<%
    String date = "";
    if (StrKit.notBlank(value)) {
        long time = Long.parseLong(value);
        try {
            date = DateUtil.formatDate2String(new Date(time), fmt);
        } catch (FormatException e) {
            e.printStackTrace();
        }
    }
%>
<%=date%>


