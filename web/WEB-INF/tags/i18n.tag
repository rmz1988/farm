<%@ tag import="com.jfinal.i18n.I18N" %>
<%@ tag import="com.jfinal.core.Const" %>
<%@ tag import="java.util.Locale" %>
<%@tag pageEncoding="utf-8" %>
<%@attribute name="key" required="true" rtexprvalue="true" %>

<%
    Cookie[] cookies = request.getCookies();
    String locale = Locale.CHINA.toString();
    for (Cookie cookie : cookies) {
        if (Const.I18N_LOCALE.equals(cookie.getName())) {
            locale = cookie.getValue();
            break;
        }
    }
%>
<%=I18N.getText(key, I18N.localeFromString(locale))%>

