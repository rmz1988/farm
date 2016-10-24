<%@ tag import="com.ingkoo.utils.jfinal.model.Dict" %>
<%@tag pageEncoding="utf-8" %>
<%@attribute name="dictgroup" required="true" rtexprvalue="false" %>
<%@attribute name="value" required="true" rtexprvalue="true" %>

<%=Dict.dao.getDictValue(dictgroup, value)%>