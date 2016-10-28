<%@ tag import="com.ingkoo.farm.utils.AES" %>
<%@tag %>
<%@attribute name="value" required="true" rtexprvalue="true" %>

<%
    String decryptBankcard = AES.decrypt(value);
%>
<%=decryptBankcard.length() > 8 ?
        decryptBankcard.substring(0, 4) + " **** **** " + decryptBankcard.substring(decryptBankcard.length() - 4) :
        decryptBankcard%>