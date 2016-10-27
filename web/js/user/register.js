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
                },
                name: {
                    required: true
                },
                idCard: {
                    required: true,
                    validIdCard: true,
                    uniqueIdCard: true
                },
                mobile: {
                    required: true,
                    phone: true
                },
                bank: {
                    required: true
                },
                bankAccountName: {
                    required: true
                },
                bankCard: {
                    required: true
                },
                recommendUserId: {
                    required: true,
                    validRecommendId: true
                },
                activatedNo: {
                    required: true,
                    validActivatedNo: true
                }
            }, messages: {
                userId: {
                    required: '请输入玩家编号',
                    regex: '玩家编号必须是6位以上数字',
                    uniqueUserId: '该编号已被使用，请更换'
                },
                name: {
                    required: '请输入玩家姓名'
                },
                idCard: {
                    required: '请填写身份证号码',
                    validIdCard: '身份证号码不合法',
                    uniqueIdCard: '该身份证已注册'
                },
                mobile: {
                    required: '请填写联系电话',
                    phone: '电话号码不合法'
                },
                bank: {
                    required: '请选择开户行或支付宝'
                },
                bankAccountName: {
                    required: '请输入银行开户名或支付宝昵称'
                },
                bankCard: {
                    required: '请输入银行卡号或支付宝账号'
                },
                recommendUserId: {
                    required: '请输入推荐玩家编号',
                    validRecommendId: '无效的推荐玩家编号'
                },
                activatedNo: {
                    required: '请输入激活中心编号',
                    validActivatedNo: '无效的激活中心编号'
                }
            }
        });

        $('#userId,#name,#mobile,#idCard,#bank,#bankAccountName,#bankCard,#recommendUserId,#activatedNo').blur(function () {
            $(this).valid();
        });

        $('#registerBtn').click(function () {
            //alert($('input[name="petNo"]:checked').val());
            $.post(basePath + '/register/doRegister', {
                'user.userId': $.trim($('#userId').val()),
                'user.name': $.trim($('#name').val()),
                'user.mobile': $.trim($('#mobile').val()),
                'user.idCard': $.trim($('#idCard').val()),
                'user.bank': $.trim($('#bank').val()),
                'user.bankAccountName': $.trim($('#bankAccountName').val()),
                'user.bankCard': $.trim($('#bankCard').val()),
                'user.recommendUserId': $.trim($('#recommendUserId').val()),
                'user.activateNo': $.trim($('#activateNo').val())
            }, function (response) {
                if (response) {
                    alert('注册成功！等待激活中心激活后可登录系统！')
                } else {
                    alert('系统繁忙，请稍后重试');
                }
            }, 'json');
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/login';
        });
    });
});