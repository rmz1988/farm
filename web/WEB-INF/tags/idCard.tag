<%@ tag import="com.ingkoo.farm.utils.AES" %>
<%@tag %>
<%@attribute name="value" required="true" rtexprvalue="true" %>

<%
    String decryptIdCard = AES.decrypt(value);
%>
<%=decryptIdCard.substring(0,4)+"**********"+decryptIdCard.substring(14)%>