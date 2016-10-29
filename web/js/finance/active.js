define(function (require, exports, module) {

    var tools = require('tools/tools');

    $(function () {
        tools.query(basePath + '/finance/queryActiveList', 'content');
    });
});