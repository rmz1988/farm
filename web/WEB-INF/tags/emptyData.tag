<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="cols" required="true" rtexprvalue="true" %>

<c:if test="${empty page || page.totalRow == 0}">
    <tr>
        <td colspan="${cols}" class="text-center">
            <c:if test="${locale == 'zh_CN'}">
                没有符合条件的数据
            </c:if>
            <c:if test="${locale == 'en_US'}">
                No items...
            </c:if>
        </td>
    </tr>
</c:if>