/**
 * 注册
 */
define(function (require, exports, module) {
    var validate = require("validate/validate");

    $(function () {

        /**
         * 注册校验
         */
        $('#registerForm').validate({
            rules: {
                userId: {
                    required: true,
                    regex: /^\d{6,}$/,
                    uniqueUserId: true
                }
            }, messages: {
                userId: {
                    required: '请输入玩家编号',
                    regex: '玩家编号必须是6位以上数字',
                    uniqueUserId: '该编号已被使用，请更换'
                }
            }
        });

        $('#userId').blur(function () {
            $(this).valid();
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/login';
        });
    });
});