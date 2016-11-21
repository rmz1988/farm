<%@ tag import="com.ingkoo.farm.model.Dict" %>
<%@ tag import="java.util.Locale" %>
<%@ tag import="com.jfinal.core.Const" %>
<%@tag pageEncoding="utf-8" %>
<%@attribute name="dictgroup" required="true" rtexprvalue="false" %>
<%@attribute name="value" required="true" rtexprvalue="true" %>

<%
    Dict dict = Dict.dao.findFirst("select * from dict where dictGroup = ? and dictName = ?", dictgroup, value);
    String dictValue = "";
    if (dict != null) {
        Cookie[] cookies = request.getCookies();
        String locale = Locale.CHINA.toString();
        for (Cookie cookie : cookies) {
            if (Const.I18N_LOCALE.equals(cookie.getName())) {
                locale = cookie.getValue();
                break;
            }
        }
        dictValue = "zh_CN".equals(locale) ? dict.getStr("dictValue") : dict.getStr("englishValue");
    }
%>
<%=dictValue %>