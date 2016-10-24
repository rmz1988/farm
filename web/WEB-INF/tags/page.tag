<%@tag pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="contentId" required="true" rtexprvalue="true" %>
<%@ attribute name="url" required="true" rtexprvalue="true" %>
<%@ attribute name="params" required="false" rtexprvalue="true" %>
<script>
    var tools;
    seajs.use('tools/tools', function (t) {
        tools = t
    });

    var pageNumber = Number('${page.pageNumber}') || 1;
    var totalPage = Number('${page.totalPage}') || 0;
    var totalRow = Number('${page.totalRow}') || 0;

    function go(pageNo) {
        if (/^\d+$/.test(pageNo) && pageNo > 0 && pageNo <= totalPage) {
            var url = '${url}';
            var params = '${params}';
            if (params.indexOf('content=') != 0) {
                if (params != '') {
                    url += '?' + params;
                }
                if (url.lastIndexOf('?') == -1) {
                    url += '?';
                } else {
                    url += '&';
                }

                url = url + 'pageNumber=' + pageNo + '&pageSize=20';

                tools.query(url, '<%=contentId%>');
            } else {
                var paramJson = {content: params.substring(8)};
                tools.query(url + '?pageNumber=' + pageNo + '&pageSize=20', '<%=contentId%>', paramJson);
            }
        } else {
            alert('请输入正确的页码');
            $('#currentPage').val(pageNumber);
        }
    }

    function goFirst() {
        if (pageNumber > 1) {
            go(1);
        }
    }

    function goPrev() {
        if (pageNumber > 1) {
            go(pageNumber - 1);
        }
    }

    function goNext() {
        if (pageNumber < totalPage) {
            go(pageNumber + 1);
        }
    }

    function goLast() {
        if (pageNumber < totalPage) {
            go(totalPage);
        }
    }

    $(function () {
        $('#currentPage').keypress(function (e) {
            if (e.keyCode == 13) {
                go($(this).val());
            }
        });
    })

</script>

<div style="display: block;position:relative;height:50px;clear:both;">
    <div class="pagination pull-right form-group form-inline" style="margin-top: 0;margin-left:20px;">
        <div class="input-group">
            <input id="currentPage" class="form-control" type="text"
                   style="width:50px;padding:6px 2px;"
                    <c:choose>
                        <c:when test="${empty page}">
                            value="1"
                        </c:when>
                        <c:otherwise>
                            value="${page.pageNumber}"
                        </c:otherwise>
                    </c:choose> />
            <span class="input-group-btn">
                <button class="btn btn-default" onclick="go($('#currentPage').val())">
                    go
                </button>
            </span>
        </div>

        共
        <c:choose>
            <c:when test="${empty page}">
                0
            </c:when>
            <c:otherwise>
                ${page.totalPage}
            </c:otherwise>
        </c:choose>
        页&nbsp;&nbsp;每页显示20条,共<c:choose>
        <c:when test="${empty page}">
            0
        </c:when>
        <c:otherwise>
            ${page.totalRow}
        </c:otherwise>
    </c:choose>条记录
    </div>
    <!--</div>-->
    <ul class="pagination pull-right" style="margin-top:0;">
        <li <c:if test="${empty page || page.pageNumber == 1}">class="disabled"</c:if>><a href="#" onclick="goFirst()">首页</a>
        </li>
        <li <c:if test="${empty page || page.pageNumber == 1}">class="disabled"</c:if>><a href="#" onclick="goPrev()">上一页</a>
        </li>
        <c:choose>
            <c:when test="${page.pageNumber > 2 && page.pageNumber < page.totalPage - 2}">
                <c:forEach var="pageNo" begin="${page.pageNumber - 2}" end="${page.pageNumber + 2}">
                    <li <c:if test="${page.pageNumber == pageNo}">class="active"</c:if>><a href="#"
                                                                                           onclick="go('${pageNo}')">${pageNo}</a>
                    </li>
                </c:forEach>
            </c:when>
            <c:when test="${page.pageNumber <= 2}">
                <c:forEach var="pageNo" begin="1" end="${page.totalPage > 5 ? 5 : page.totalPage}">
                    <li <c:if test="${page.pageNumber == pageNo}">class="active"</c:if>><a href="#"
                                                                                           onclick="go('${pageNo}')">${pageNo}</a>
                    </li>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <c:forEach var="pageNo" begin="${page.totalPage - 4 < 1 ? 1 : page.totalPage - 4}"
                           end="${page.pageNumber}">
                    <li <c:if test="${page.pageNumber == pageNo}">class="active"</c:if>><a href="#"
                                                                                           onclick="go('${pageNo}')">${pageNo}</a>
                    </li>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <li <c:if test="${empty page || page.pageNumber >= page.totalPage}">class="disabled"</c:if>><a href="#"
                                                                                                       onclick="goNext()">下一页</a>
        </li>
        <li <c:if test="${empty page || page.pageNumber >= page.totalPage}">class="disabled"</c:if>><a href="#"
                                                                                                       onclick="goLast()">尾页</a>
        </li>
    </ul>
</div>