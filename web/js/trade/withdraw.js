define(function (require, exports, module) {
    var validator = require('validate/validate');
    var tools = require('tools/tools');

    $(function () {
        tools.query(basePath + '/trade/queryWithdrawList', 'content');

        $('#withdrawForm').validate({
            rules: {
                money: {
                    required: true,
                    maxOfTimes: [$('#max').val(), $('#times').val()]
                },
                tradePwd: {
                    required: true,
                    tradePwd: true
                }
            },
            messages: {
                money: {
                    required: '请填写提现金额',
                    maxOfTimes: '提现金额须是' + $('#times').val() + '的倍数，不得超过' + $('#max').val()
                },
                tradePwd: {
                    required: '请输入交易密码',
                    tradePwd: '交易密码不正确'
                }
            }
        });

        $('#money,#tradePwd').blur(function () {
            $(this).valid();
        });

        $('#withdrawBtn').click(function () {
            if ($('#withdrawForm').valid()) {
                $.post(basePath + '/trade/doWithdraw', {
                    money: $.trim($('#money').val())
                }, function (response) {
                    if (response) {
                        alert('提现申请已提交，后台审核后到账！');
                        window.location = basePath + '/trade/withdraw';
                    } else {
                        alert('系统繁忙，请稍后重试！');
                    }
                }, 'json');
            }
        });
    });
});