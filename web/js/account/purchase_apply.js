/**
 * 金币收购
 */
define(function (require, modules, exports) {
    var validator = require('validate/validate');
    var tools = require('tools/tools');

    $(function () {
        $('#purchaseForm').validate({
            rules: {
                purchaseMoney: {
                    required: true,
                    min: Number($('#min').val()),
                    maxOfTimes: [$('#max').val(), $('#times').val()]
                },
                tradePwd: {
                    required: true,
                    tradePwd: true
                }
            }, messages: {
                purchaseMoney: {
                    required: tools.getText('purchase.moneyRequired'),
                    min: tools.getText('purchase.minTip') + $('#min').val(),
                    maxOfTimes: tools.getText('purchase.maxOfTimesTip1') + $('#times').val() + tools.getText('purchase.maxOfTimesTip2') + $('#max').val()
                },
                tradePwd: {
                    required: tools.getText('transfer.tradePwdRequired'),
                    tradePwd: tools.getText('transfer.tradePwdInvalid')
                }
            }
        });

        $('#purchaseMoney,#tradePwd').blur(function () {
            $(this).valid();
        });

        $('#submitBtn').click(function () {
            var $btn = $(this);
            $btn.attr('disabled', true);
            if ($('#purchaseForm').valid()) {
                $.post(basePath + '/account/doPurchaseApply', {
                    'purchaseApply.oppositeUserId': $('#purchaseUserId').val(),
                    'purchaseApply.money': $.trim($('#purchaseMoney').val())
                }, function (response) {
                    if (response) {
                        alert(tools.getText('purchase.applySubmit'));
                        window.location = basePath + '/account/purchase/list';
                    } else {
                        alert(tools.getText('systemError'));
                        $btn.attr('disabled', false);
                    }
                }, 'json');
            } else {
                $btn.attr('disabled', false);
            }
        });
        $('#backBtn').click(function () {
            window.location = basePath + '/account/purchase/list';
        });
    });
});