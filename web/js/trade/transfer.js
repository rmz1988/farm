define(function (require, exports, module) {
    var validator = require('validate/validate')
    var tools = require('tools/tools');

    $(function () {
        tools.query(basePath + '/trade/queryTransferList', 'content');

        $('#transferForm').validate({
            rules: {
                userId: {
                    required: true,
                    existsUser: true,
                    lessThanDays: true
                },
                money: {
                    required: true,
                    min: Number($('#min').val()),
                    maxOfTimes: [$('#max').val(), $('#times').val()]
                },
                tradePwd: {
                    required: true,
                    tradePwd: true
                }
            }, messages: {
                userId: {
                    required: tools.getText('transfer.outUserIdRequired'),
                    existsUser: tools.getText('transfer.existsUser'),
                    lessThanDays: tools.getText('transfer.cannotTransfer')
                },
                money: {
                    required: tools.getText('transfer.moneyRequired'),
                    min: tools.getText('transfer.minTip') + $('#min').val(),
                    maxOfTimes: tools.getText('transfer.maxOfTimesTip1') + $('#times').val() + tools.getText('transfer.maxOfTimesTip2') + $('#max').val()
                },
                tradePwd: {
                    required: tools.getText('transfer.tradePwdRequired'),
                    tradePwd: tools.getText('transfer.tradePwdInvalid')
                }
            }
        });

        $('#userId,#money,#tradePwd').blur(function () {
            $(this).valid();
        });

        $('#transferBtn').click(function () {
            var $btn = $(this);
            $btn.attr('disabled', true);
            if ($('#transferForm').valid()) {
                var todayLimitMoney = Number($('#todayLimitMoney').val());
                todayLimitMoney = 1000 - todayLimitMoney;
                var todayRepurchase = Number($('#todayRepurchase').val());
                var money = Number($.trim($('#money').val()));
                if (money >= todayLimitMoney && todayRepurchase < 1) {
                    alert(tools.getText('transfer.transferLimitMoney'));
                    $btn.attr('disabled', false);
                    return;
                }

                $.post(basePath + '/trade/doTransfer', {
                    'transfer.outUserId': $.trim($('#userId').val()),
                    'transfer.money': money
                }, function (response) {
                    if (response) {
                        alert(tools.getText('transfer.success'));
                        window.location = basePath + '/trade/transfer'
                    } else {
                        alert(tools.getText('systemError'));
                        $btn.attr('disabled', false);
                    }
                }, 'json');
            } else {
                $btn.attr('disabled', false);
            }
        });
    });
});