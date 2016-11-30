<%@ tag import="com.ingkoo.farm.utils.AES" %>
<%@tag %>
<%@attribute name="value" required="true" rtexprvalue="true" %>
<%@attribute name="hidden" required="false" rtexprvalue="false" type="java.lang.Boolean" %>

<%
    String decryptBankcard = AES.decrypt(value);
    hidden = hidden != null ? hidden : false;
%>
<%=hidden ? (decryptBankcard.length() > 8 ?
        decryptBankcard.substring(0, 4) + " **** **** " + decryptBankcard.substring(decryptBankcard.length() - 4) :
        decryptBankcard) : decryptBankcard%>