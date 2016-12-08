define(function (require, exports, module) {
    var validator = require('validate/validate');
    var tools = require('tools/tools');

    $(function () {
        tools.query(basePath + '/trade/queryWithdrawList', 'content');

        $('#withdrawForm').validate({
            rules: {
                money: {
                    required: true,
                    min: Number($('#min').val()),
                    maxOfTimes: [$('#max').val(), $('#times').val()]
                },
                tradePwd: {
                    required: true,
                    tradePwd: true
                }
            },
            messages: {
                money: {
                    required: tools.getText('withdraw.moneyRequired'),
                    min: tools.getText('withdraw.minTip') + $('#min').val(),
                    maxOfTimes: tools.getText('withdraw.moneyTip1') + $('#times').val() + tools.getText('withdraw.moneyTip2') + $('#max').val()
                },
                tradePwd: {
                    required: tools.getText('transfer.tradePwdRequired'),
                    tradePwd: tools.getText('transfer.tradePwdInvalid')
                }
            }
        });

        $('#money,#tradePwd').blur(function () {
            $(this).valid();
        });

        $('#withdrawBtn').click(function () {
            var $btn = $(this);
            $btn.attr('disabled', true);
            if ($('#withdrawForm').valid()) {
                var todayLimitMoney = Number($('#todayLimitMoney').val());
                todayLimitMoney = 1000 - todayLimitMoney;
                var todayRepurchase = Number($('#todayRepurchase').val());
                var money = Number($.trim($('#money').val()));
                if (money >= todayLimitMoney && todayRepurchase < 1) {
                    alert(tools.getText('withdraw.withdrawLimitMoney'));
                    $btn.attr('disabled', false);
                    return;
                }

                alert(tools.getText('withdraw.timeTip'));
                $.post(basePath + '/trade/doWithdraw', {
                    money: money
                }, function (response) {
                    if (response == 0) {
                        alert(tools.getText('withdraw.success'));
                        window.location = basePath + '/trade/withdraw';
                    } else if (response == 1) {
                        alert(tools.getText('withdraw.minTip') + '300.00');
                        $btn.attr('disabled', false);
                    } else if (response == 2) {
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