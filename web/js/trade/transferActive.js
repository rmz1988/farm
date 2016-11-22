define(function (require, exports, module) {
    var validator = require('validate/validate');
    var tools = require('tools/tools');

    $(function () {
        tools.query(basePath + '/trade/queryTransferToActiveList', 'content');

        $('#transferForm').validate({
            rules: {
                money: {
                    required: true,
                    maxOfTimes: [$('#max').val(), $('#times').val()]
                },
                tradePwd: {
                    required: true,
                    tradePwd: true
                }
            }, messages: {
                money: {
                    required: tools.getText('transferActive.moneyRequired'),
                    maxOfTimes: tools.getText('transferActive.maxOfTimesTip1') + $('#times').val() + tools.getText('transferActive.maxOfTimesTip2') + $('#max').val()
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

        $('#transferBtn').click(function () {
            var $btn = $(this);
            $btn.attr('disabled', true);
            if ($('#transferForm').valid()) {
                $.post(basePath + '/trade/doTransferToActiveMoney', {
                    'money': $.trim($('#money').val())
                }, function (response) {
                    if (response) {
                        alert(tools.getText('transferActive.success'));
                        window.location = basePath + '/trade/activate/transfer'
                    } else {
                        alert(tools.getText('systemError'));
                        $btn.attr('disabled', false);
                    }
                }, 'json');
            }
        });
    });
});