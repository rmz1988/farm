/**
 * 金币收购
 */
define(function (require, modules, exports) {
    var tools = require('tools/tools');

    $(function () {
        //查询发起的请求
        var canPurchase = $('#canPurchase').val();
        if (canPurchase == 'true') {
            tools.query(basePath + '/account/queryPurchaseSendList', 'sendContent');
        }

        //查询收到的收购请求
        tools.query(basePath + '/account/queryPurchaseReceiveList', 'receiveContent');

        $('#purchaseBtn').click(function () {
            window.location = basePath + '/account/purchase/list'
        });

        $('#sendContent').on('click', 'button[name="payBtn"]', function () {
            var applyId = $(this).attr('id');
            $.post(basePath + '/account/doPurchasePay', {
                applyId: applyId
            }, function (response) {
                if (response) {
                    alert(tools.getText('purchase.paymentTip'));
                    tools.query(basePath + '/account/queryPurchaseSendList', 'sendContent');
                } else {
                    alert(tools.getText('systemError'));
                }
            }, 'json');
        });

        $('#receiveContent').on('click', 'button[name="agreeBtn"]', function () {
            var applyId = $(this).attr("id").substring('agree'.length);
            $.post(basePath + '/account/checkBalance', {
                applyId: applyId
            }, function (response) {
                if (response) {
                    window.location = basePath + '/account/purchase/agree?applyId=' + applyId;
                } else {
                    alert(tools.getText('purchase.balanceTip'));
                }
            }, 'json');
        });
        $('#receiveContent').on('click', 'button[name="disagreeBtn"]', function () {
            var applyId = $(this).attr('id').substring('disagree'.length);
            $.post(basePath + '/account/purchaseDisagree', {
                applyId: applyId
            }, function (response) {
                if (response) {
                    alert(tools.getText('purchase.success'));
                    tools.query(basePath + '/account/queryPurchaseReceiveList', 'receiveContent');
                } else {
                    alert(tools.getText('systemError'));
                }
            }, 'json');
        });
        $('#receiveContent').on('click', 'button[name="confirmBtn"]', function () {
            var applyId = $(this).attr('id').substring('confirm'.length);
            $.post(basePath + '/account/doPurchaseConfirm', {
                applyId: applyId
            }, function (response) {
                if (response) {
                    alert(tools.getText('purchase.finish'));
                    tools.query(basePath + '/account/queryPurchaseReceiveList', 'receiveContent');
                } else {
                    alert(tools.getText('systemError'));
                }
            }, 'json');
        });
    });
});