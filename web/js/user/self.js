define(function (require, exports, module) {
    var validator = require('validate/validate');
    var tools = require('tools/tools');

    $(function () {
        $('#loginPwdBtn').click(function () {
            window.location = basePath + '/self/pwd/login';
        });

        $('#tradePwdBtn').click(function () {
            window.location = basePath + '/self/pwd/trade';
        });

        $('#accountBtn').click(function () {
            window.location = basePath + '/self/account'
        });

        $('#loginPwdForm').validate({
            rules: {
                oldLoginPwd: {
                    required: true,
                    loginPwd: true
                },
                loginPwd: {
                    required: true
                },
                repeatLoginPwd: {
                    required: true,
                    equalTo: '#loginPwd'
                }
            },
            messages: {
                oldLoginPwd: {
                    required: tools.getText('self.oldLoginPwdRequired'),
                    loginPwd: tools.getText('self.oldLoginPwdError')
                },
                loginPwd: {
                    required: tools.getText('self.loginPwdRequired')
                },
                repeatLoginPwd: {
                    required: tools.getText('self.repeatLoginPwdRequired'),
                    equalTo: tools.getText('self.loginPwdNotSame')
                }
            }
        });

        $('#oldLoginPwd,#loginPwd,#repeatLoginPwd').blur(function () {
            $(this).valid();
        });

        $('#loginPwdChangeBtn').click(function () {
            if ($('#loginPwdForm').valid()) {
                $.post(basePath + '/self/doLoginPwd', {
                    loginPwd: $.trim($('#loginPwd').val())
                }, function (response) {
                    if (response) {
                        alert(tools.getText('self.loginPwdSuccess'));
                        window.location = basePath + '/login/logout';
                    } else {
                        alert(tools.getText('systemError'));
                    }
                }, 'json');
            }
        });

        $('#tradePwdForm').validate({
            rules: {
                oldTradePwd: {
                    required: true,
                    tradePwd: true
                },
                tradePwd: {
                    required: true
                },
                repeatTradePwd: {
                    required: true,
                    equalTo: '#tradePwd'
                }
            },
            messages: {
                oldTradePwd: {
                    required: tools.getText('self.oldTradePwdRequired'),
                    tradePwd: tools.getText('self.oldTradePwdError')
                },
                tradePwd: {
                    required: tools.getText('self.tradePwdRequired')
                },
                repeatTradePwd: {
                    required: tools.getText('self.repeatTradePwdRequired'),
                    equalTo: tools.getText('self.tradePwdNotSame')
                }
            }
        });

        $('#oldTradePwd,#tradePwd,#repeatTradePwd').blur(function () {
            $(this).valid();
        });

        $('#tradePwdChangeBtn').click(function () {
            if ($('#tradePwdForm').valid()) {
                $.post(basePath + '/self/doTradePwd', {
                    tradePwd: $.trim($('#tradePwd').val())
                }, function (response) {
                    if (response) {
                        alert(tools.getText('self.tradePwdSuccess'));
                        window.location = basePath + '/self';
                    } else {
                        alert(tools.getText('systemError'));
                    }
                }, 'json');
            }
        });

        $('#changeForm').validate({
            rules: {
                bank: {
                    required: true
                },
                bankAccountName: {
                    required: true
                },
                bankCard: {
                    required: true
                }
            }, messages: {
                bank: {
                    required: tools.getText('register.bankRequired')
                },
                bankAccountName: {
                    required: tools.getText('register.accountNameRequired')
                },
                bankCard: {
                    required: tools.getText('register.bankCardRequired')
                }
            }
        });

        $('#bankAccountName,#bank,#bankCard').blur(function () {
            $(this).valid();
        });

        $('#changeAccountBtn').click(function () {
            if ($('#changeForm').valid()) {
                $.post(basePath + '/self/doChangeAccount', {
                    'user.userId': $('#userId').val(),
                    'user.bank': $.trim($('#bank').val()),
                    'user.bankAccountName': $.trim($('#bankAccountName').val()),
                    'user.bankCard': $.trim($('#bankCard').val())
                }, function (response) {
                    if (response) {
                        alert(tools.getText('self.tradePwdSuccess'));
                        window.location = basePath + '/self';
                    } else {
                        alert(tools.getText('systemError'));
                    }
                }, 'json');
            }
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/self';
        });
    });
});