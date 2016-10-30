define(function (require, exports, module) {
    var tools = require('tools/tools');

    $(function () {
        tools.query(basePath + '/feedback/queryFeedbackList', 'content');

        $('#feedbackBtn').click(function () {
            window.location = basePath + '/feedback/publish';
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/feedback';
        });
    });
});