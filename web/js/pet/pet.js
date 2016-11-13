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
            alert('由于人数过多，收益或延时到账！');
            $(this).attr('disabled',true);
            $('#feedTip').html('正在喂养，请不要走开...');
            window.location = basePath + '/pet/feed';
        });

        //复购
        $('#repurchaseBtn').click(function () {
            alert('由于人数过多，复购或延时生效！');
            $(this).attr('disabled',true);
            $('#repurchaseTip').html('正在复购，请不要走开...');
            if (confirm('复购将扣除您' + $('#petPrice').val() + '奖励币，是否继续？')) {
                window.location = basePath + '/pet/repurchase';
            }
        })
    });

});