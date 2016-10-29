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
     * 校验身份证号码合法性
     */
    $.validator.addMethod('validIdCard', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/check/validIdCard',
                type: 'post',
                async: false,
                data: {
                    idCard: value
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
     * 校验身份证唯一性
     */
    $.validator.addMethod('uniqueIdCard', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/check/uniqueIdCard',
                type: 'post',
                async: false,
                data: {
                    idCard: value
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
     * 校验不一致
     */
    $.validator.addMethod("notEqualTo", function (value, element, params) {
        return value == '' || ($(params) != undefined && $(params).val() != value);
    });

    /**
     * 合法推荐人编号
     */
    $.validator.addMethod('validRecommendId', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/check/validRecommendId',
                type: 'post',
                async: false,
                data: {
                    recommendUserId: value
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
     * 合法激活中心编号
     */
    $.validator.addMethod('validActivatedNo', function (value, element, params) {
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/check/validActiveNo',
                type: 'post',
                async: false,
                data: {
                    activatedNo: value
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
     * 唯一激活编号
     */
    $.validator.addMethod('uniqueActiveNo',function(value,element,params){
        var result = true;
        if (value != '' && params) {
            $.ajax({
                url: basePath + '/check/uniqueActiveNo',
                type: 'post',
                async: false,
                data: {
                    activateNo: value
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