define(function (require, exports, module) {
    var tools = require('tools/tools');

    $(function () {
        //查询宠物周期
        tools.query(basePath + '/pet/queryLifecycleList', 'content');

        //喂养
        $('#feedBtn').click(function () {
            $(this).disable();
            window.location = basePath + '/pet/feed';
        });

        //复购
        $('#repurchaseBtn').click(function () {
            $(this).disable();
            window.location = basePath + '/pet/repurchase';
        })
    });

});