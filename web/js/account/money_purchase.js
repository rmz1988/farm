/**
 * 金币收购
 */
define(function (require, modules, exports) {
    var validator = require('validate/validate');
    var tools = require('tools/tools');

    $(function () {
        //查询发起的请求
        var canPurchase = $('#canPurchase').val();
        if (canPurchase == true) {
            tools.query(basePath + '/account/queryPurchaseSendList', 'sendContent');
        }

        //查询收到的收购请求
        tools.query(basePath + '/account/queryPurchaseReceiveList', 'receiveContent');

        $('#purchaseBtn').click(function () {
            window.location = basePath + '/account/purchase/list'
        });
    });
});