/**
 * 封装jquery.validate.js校验
 */
define(function (require, exports) {
    require('jqueryValidate');
    var rsa = require('rsa');

    /**
     * 校验电话号码
     */
    $.validator.addMethod("phone", function (value, element, params) {
        return value == '' || (params && /^[\d\(\)\+\-]{0,20}$/.test(value));
    });

    /**
     * 校验唯一用户名
     */
    $.validator.addMethod("uniqueUsername", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/uniqueUsername',
                type: 'post',
                async: false,
                data: {
                    username: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验唯一昵称
     */
    $.validator.addMethod("uniqueNickname", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/uniqueNickname',
                type: 'post',
                async: false,
                data: {
                    nickname: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }
        return result;
    });

    /**
     * 校验唯一手机号
     */
    $.validator.addMethod("uniqueMobile", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/uniqueMobile',
                type: 'post',
                async: false,
                data: {
                    mobile: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验唯一邮箱
     */
    $.validator.addMethod("uniqueEmail", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/uniqueEmail',
                type: 'post',
                async: false,
                data: {
                    email: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验唯一角色名
     */
    $.validator.addMethod("uniqueRoleName", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/uniqueRoleName',
                type: 'post',
                async: false,
                data: {
                    roleName: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验唯一工号
     */
    $.validator.addMethod("uniqueStaffId", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/uniqueStaffId',
                type: 'post',
                async: false,
                data: {
                    staffId: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验身份证
     */
    $.validator.addMethod("idCard", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/idCard',
                type: 'post',
                async: false,
                data: {
                    idCard: rsa.encrypt(value)
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验验证码
     */
    $.validator.addMethod("verifyCode", function (value, element, params) {
        var result = true;
        if (value != '' || params) {
            $.ajax({
                url: basePath + '/verify/verifyCode',
                type: 'post',
                async: false,
                data: {
                    verifyCode: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验输入金额
     */
    $.validator.addMethod("money", function (value, element, params) {
        return value == '' || /^(?!0*$)(?!0*\.0*$)\d{1,10}(\.\d{1,2})?$/.test(value);
    });

    /**
     * 校验授权码、邀请码
     */
    $.validator.addMethod("authCode", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/authCode',
                type: 'post',
                async: false,
                data: {
                    authCode: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验正则表达式
     */
    $.validator.addMethod("regex", function (value, element, params) {
        return value == '' || params.test(value);
    });

    /**
     * 校验正则表达式
     */
    $.validator.addMethod("sensitive", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/sensitive',
                type: 'post',
                async: false,
                data: {
                    sensitive: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验邀请码
     */
    $.validator.addMethod("inviteCode", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/inviteCode',
                type: 'post',
                async: false,
                data: {
                    inviteCode: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验不一致
     */
    $.validator.addMethod("notEqualTo", function (value, element, params) {
        return value == '' || ($(params) != undefined && $(params).val() != value);
    });

    /**
     * 安保问题答案校验
     */
    $.validator.addMethod("secureAnswer", function (value, element, params) {
        var result = true;
        if (value != '' && params != '') {
            $.ajax({
                url: basePath + '/verify/secureAnswer',
                type: 'post',
                async: false,
                data: {
                    questionNo: $(params).val(),
                    answer: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验用户是否存在
     */
    $.validator.addMethod('existsUser', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/existsUser',
                type: 'post',
                async: false,
                data: {
                    user: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验登录密码是否正确
     */
    $.validator.addMethod('loginPwd', function (value, element, params) {
        var result = true;
        if (value != '' && !!params) {
            $.ajax({
                url: basePath + '/verify/loginPassword',
                type: 'post',
                async: false,
                data: {
                    user: $(params).val(),
                    password: rsa.encrypt(value)
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验支付密码是否正确
     */
    $.validator.addMethod('payPwd', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/payPassword',
                type: 'post',
                async: false,
                data: {
                    payPassword: rsa.encrypt(value)
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验登录密码与支付密码是否相同
     */
    $.validator.addMethod('repeatPwd', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/repeatPassword',
                type: 'post',
                async: false,
                data: {
                    password: rsa.encrypt(value)
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验激活卡号
     */
    $.validator.addMethod('activeNo', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/activeNo',
                type: 'post',
                async: false,
                data: {
                    cardNo: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验激活卡密码
     */
    $.validator.addMethod('activePassword', function (value, element, params) {
        var result = true;
        if (value != '' && !!params) {
            $.ajax({
                url: basePath + '/verify/activePassword',
                type: 'post',
                async: false,
                data: {
                    cardNo: $(params).val(),
                    password: rsa.encrypt(value)
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验登录密码与支付密码是否相同
     */
    $.validator.addMethod('userLock', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/userLock',
                type: 'post',
                async: false,
                data: {
                    user: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    /**
     * 校验收银员唯一性
     */
    $.validator.addMethod('uniqueCashier', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/verify/uniqueCashier',
                type: 'post',
                async: false,
                data: {
                    username: value
                },
                dataType: 'json',
                success: function (response) {
                    result = response;
                },
                error: function () {
                    result = false;
                }
            });
        }

        return result;
    });

    exports.rsa = rsa;
    exports.showError = function () {
        alert("系统繁忙，请重试");
    };

    exports.checkUserRealInfo = function () {
        var result = false;
        $.ajax({
            url: basePath + '/verify/checkRealInfo',
            type: 'post',
            async: false,
            dataType: 'json',
            success: function (response) {
                result = response;
            },
            error: function () {
                result = false;
            }
        });

        return result;
    }
});