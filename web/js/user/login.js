/**
 * 登录
 */
define(function (require, exports, module) {
    var tools = require('tools/tools');

    $(function () {
        $('#lang').change(function () {
            var locale = $(this).val();
            $.post(basePath + '/login/setLocale', {
                locale: locale
            }, function () {
                window.location = window.location
            }, 'json');
        });

        $('#loginBtn').click(function () {
            var userId = $('#userId').val();
            var loginPwd = $('#loginPwd').val();
            var rememberUser = $('#rememberUser').is(':checked') ? "1" : '0';
            if ($.trim(userId) == '') {
                alert(tools.getText('login.userIdTip'));
                return;
            }
            if ($.trim(loginPwd) == '') {
                alert(tools.getText('login.passwordTip'));
                return;
            }
            $.post(basePath + '/login/doLogin', {
                'user.userId': userId,
                'user.loginPwd': loginPwd,
                rememberUser: rememberUser
            }, function (response) {
                if (response == '0') {
                    window.location = basePath + '/';
                } else if (response == '1') {
                    alert(tools.getText('login.userIdPwdError'));
                } else if (response == '2') {
                    alert(tools.getText('login.userNotActivate'));
                } else if (response == '3') {
                    alert(tools.getText('login.userStop'));
                } else if (response == '4') {
                    alert(tools.getText('login.visitTip'));
                }
            }, 'json');
        });

        $('#loginPwd').keypress(function (e) {
            if (e.keyCode == 13) {
                $('#loginBtn').click();
            }
        });

        $('#registerBtn').click(function () {
            window.location = basePath + '/register';
        });
    });

});