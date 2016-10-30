define(function (require, exports, module) {
    var tools = require('tools/tools');

    $(function () {
        tools.query(basePath + '/notice/queryNoticeList', 'content');

        $('#backBtn').click(function () {
            window.location = basePath + '/notice';
        });
    });
});