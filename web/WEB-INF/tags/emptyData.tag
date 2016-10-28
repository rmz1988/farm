<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="cols" required="true" rtexprvalue="true" %>

<c:if test="${empty page || page.totalRow == 0}">
    <tr>
        <td colspan="${cols}" class="text-center">没有符合条件的数据</td>
    </tr>
</c:if>