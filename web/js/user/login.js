/**
 * 登录
 */
define(function (require, exports, module) {

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
                alert('请输入玩家编号');
                return;
            }
            if ($.trim(loginPwd) == '') {
                alert('请输入登录密码');
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
                    alert("玩家编号或密码错误");
                } else if (response == '2') {
                    alert('玩家尚未激活');
                } else if (response == '3') {
                    alert('玩家已停用')
                } else if (response == '4') {
                    alert('系统正在结算中...\n请于每天7:00——24:00登录')
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