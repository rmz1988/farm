define(function (require, exports, module) {
    var tools = require('tools/tools');

    $(function () {
        if ($('#overIncome').val() == 'true') {
            alert(tools.getText('pet.incomeUpToLimit'));
        }


        //查询宠物周期
        tools.query(basePath + '/pet/queryLifecycleList', 'content');

        //喂养
        $('#feedBtn').click(function () {
            //alert('由于人数过多，收益或延时到账！');
            $(this).attr('disabled', true);
            $('#feedTip').html(tools.getText('pet.feeding'));
            window.location = basePath + '/pet/feed';
        });

        //复购
        $('#repurchaseBtn').click(function () {
            //alert('由于人数过多，复购或延时生效！');
            $(this).attr('disabled', true);
            $('#repurchaseTip').html(tools.getText('pet.repurchasing'));
            if (confirm(tools.getText('pet.repurchaseTip1') + $('#petPrice').val() + tools.getText('pet.repurchaseTip2'))) {
                window.location = basePath + '/pet/repurchase';
            }
        })
    });

});