/**
 * 封装jquery.validate.js校验
 */
define(function (require, exports) {
    require('jqueryValidate');

    /**
     * 校验电话号码
     */
    $.validator.addMethod("phone", function (value, element, params) {
        return value == '' || (params && /^[\d\(\)\+\-]{0,20}$/.test(value));
    });

    /**
     * 校验唯一用户id
     */
    $.validator.addMethod("uniqueUserId", function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/check/uniqueUserId',
                type: 'post',
                async: false,
                data: {
                    userId: value
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
     * 校验输入金额
     */
    $.validator.addMethod("money", function (value, element, params) {
        return value == '' || /^(?!0*$)(?!0*\.0*$)\d{1,10}(\.\d{1,2})?$/.test(value);
    });


    /**
     * 校验正则表达式
     */
    $.validator.addMethod("regex", function (value, element, params) {
        return value == '' || params.test(value);
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

});