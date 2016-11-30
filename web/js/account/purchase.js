/**
 * 金币收购
 */
define(function (require, modules, exports) {
    var tools = require('tools/tools');

    $(function () {
        $('#content').on('click', 'button[name="purchaseBtn"]', function () {
            var userId = $(this).attr('id');
            window.location = basePath + '/account/purchase/apply?userId=' + userId;
        });

        $('#queryBtn').click(function () {
            tools.query(basePath + '/account/queryPurchaseList', 'content', {
                userId: $.trim($('#userId').val())
            });
        }).click();

        $('#backBtn').click(function () {
            window.location = basePath + '/account/purchase';
        });
    });
});