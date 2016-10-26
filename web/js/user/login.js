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
                if (response) {
                    window.location = basePath + '/';
                } else {
                    alert("玩家编号或密码错误");
                }
            }, 'json');
        });

        $('#registerBtn').click(function () {
            window.location = basePath + '/register';
        });
    });

});