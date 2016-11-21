<%@ tag import="com.ingkoo.farm.model.Pet" %>
<%@ tag import="com.jfinal.core.Const" %>
<%@ tag import="java.util.Locale" %>
<%@tag pageEncoding="utf-8" %>
<%@attribute name="petNo" required="true" rtexprvalue="true" %>

<%
    Pet pet = Pet.dao.findById(petNo);
    Cookie[] cookies = request.getCookies();
    String locale = Locale.CHINA.toString();
    for (Cookie cookie : cookies) {
        if (Const.I18N_LOCALE.equals(cookie.getName())) {
            locale = cookie.getValue();
            break;
        }
    }
%>
<%="zh_CN".equals(locale) ? pet.getStr("name") : pet.getStr("englishName")%>
