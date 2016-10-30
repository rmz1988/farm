define(function (require, exports, module) {
    var validator = require('validate/validate');

    $(function () {
        $('#loginPwdBtn').click(function () {
            window.location = basePath + '/self/pwd/login';
        });

        $('#tradePwdBtn').click(function () {
            window.location = basePath + '/self/pwd/trade';
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
                    required: '请输入原登录密码',
                    loginPwd: '登录密码不正确'
                },
                loginPwd: {
                    required: '请输入新登录密码'
                },
                repeatLoginPwd: {
                    required: '请再次输入新登录密码',
                    equalTo: '与新登录密码不一致'
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
                        alert('修改成功，请重新登录!');
                        window.location = basePath + '/login/logout';
                    } else {
                        alert('系统繁忙，请稍后重试');
                    }
                }, 'json');
            }
        });

        $('#tradePwdForm').validate({
            rules: {
                oldTradePwd: {
                    required: true,
                    loginPwd: true
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
                    required: '请输入原交易密码',
                    loginPwd: '交易密码不正确'
                },
                tradePwd: {
                    required: '请输入新交易密码'
                },
                repeatTradePwd: {
                    required: '请再次输入新交易密码',
                    equalTo: '与新交易密码不一致'
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
                        alert('修改成功!');
                        window.location = basePath + '/self';
                    } else {
                        alert('系统繁忙，请稍后重试');
                    }
                }, 'json');
            }
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/self';
        });
    });
});