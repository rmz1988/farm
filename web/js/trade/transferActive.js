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
                    required: '请填写转换金额',
                    max: '转出金额须是' + $('#times').val() + '的倍数，不得超过' + $('#max').val()
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

        $('#transferBtn').click(function () {
            if ($('#transferForm').valid()) {
                $.post(basePath + '/trade/doTransferToActiveMoney', {
                    'money': $.trim($('#money').val())
                }, function (response) {
                    if (response) {
                        alert('转换成功！');
                        window.location = basePath + '/trade/activate/transfer'
                    } else {
                        alert('系统繁忙，请稍后重试！')
                    }
                }, 'json');
            }
        });
    });
});