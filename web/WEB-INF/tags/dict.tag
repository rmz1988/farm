<%@ tag import="com.ingkoo.farm.model.Dict" %>
<%@tag pageEncoding="utf-8" %>
<%@attribute name="dictgroup" required="true" rtexprvalue="false" %>
<%@attribute name="value" required="true" rtexprvalue="true" %>

<%
    Dict dict = Dict.dao.findFirst("select * from dict where dictGroup = ? and dictName = ?", dictgroup, value);
    String dictValue = "";
    if (dict != null) {
        dictValue = dict.getStr("dictValue");
    }
%>
<%=dictValue %>