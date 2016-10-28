/**
 * 登录
 */
define(function (require, exports, module) {

    $(function () {
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