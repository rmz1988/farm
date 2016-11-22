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
                $.post(basePath + '/trade/doTransfer', {
                    'transfer.outUserId': $.trim($('#userId').val()),
                    'transfer.money': $.trim($('#money').val())
                }, function (response) {
                    if (response) {
                        alert(tools.getText('transfer.success'));
                        window.location = basePath + '/trade/transfer'
                    } else {
                        alert(tools.getText('systemError'));
                        $btn.attr('disabled', false);
                    }
                }, 'json');
            }
        });
    });
});