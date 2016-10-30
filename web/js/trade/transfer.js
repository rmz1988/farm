define(function (require, exports, module) {
    var validator = require('validate/validate')
    var tools = require('tools/tools');

    $(function () {
        tools.query(basePath + '/trade/queryTransferList', 'content');

        $('#transferForm').validate({
            rules: {
                userId: {
                    required: true,
                    existsUser: true
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
                    required: '请填写转出玩家编号',
                    existsUser: '该玩家不存在'
                },
                money: {
                    required: '请填写转出金额',
                    maxOfTimes: '转出金额须是' + $('#times').val() + '的倍数，不得超过' + $('#max').val()
                },
                tradePwd: {
                    required: '请输入交易密码',
                    tradePwd: '交易密码不正确'
                }
            }
        });

        $('#userId,#money,#tradePwd').blur(function () {
            $(this).valid();
        });

        $('#transferBtn').click(function () {
            if ($('#transferForm').valid()) {
                $.post(basePath + '/trade/doTransfer', {
                    'transfer.outUserId': $.trim($('#userId').val()),
                    'transfer.money': $.trim($('#money').val())
                }, function (response) {
                    if (response) {
                        alert('转出成功！');
                        window.location = basePath + '/trade/transfer'
                    } else {
                        alert('系统繁忙，请稍后重试！')
                    }
                }, 'json');
            }
        });
    });
});