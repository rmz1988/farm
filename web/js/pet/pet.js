define(function (require, exports, module) {
    var tools = require('tools/tools');

    $(function () {
        if ($('#overIncome').val() == 'true') {
            alert('您今日收入已达上限，今日喂养将不再产生收益！');
        }


        //查询宠物周期
        tools.query(basePath + '/pet/queryLifecycleList', 'content');

        //喂养
        $('#feedBtn').click(function () {
            window.location = basePath + '/pet/feed';
            $(this).disable();
        });

        //复购
        $('#repurchaseBtn').click(function () {
            if (confirm('复购将扣除您' + $('#petPrice').val() + '奖励币，是否继续？')) {
                window.location = basePath + '/pet/repurchase';
                $(this).disable();
            }
        })
    });

});