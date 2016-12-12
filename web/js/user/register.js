/**
 * 注册
 */
define(function (require, exports, module) {
    var validate = require("validate/validate");
    var tools = require('tools/tools');

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
                    //validIdCard: true,
                    uniqueIdCard: true
                },
                mobile: {
                    required: true,
                    phone: true
                },
                recommendUserId: {
                    required: true,
                    validRecommendId: true
                },
                activatedNo: {
                    required: true,
                    validRecommendId: true
                }
            }, messages: {
                userId: {
                    required: tools.getText('register.userIdRequired'),
                    regex: tools.getText('register.userRegex'),
                    uniqueUserId: tools.getText('register.uniqueUserId')
                },
                name: {
                    required: tools.getText('register.nameRequired')
                },
                idCard: {
                    required: tools.getText('register.idCardRequired'),
                    //validIdCard: '身份证号码不合法',
                    uniqueIdCard: tools.getText('register.uniqueIdCard')
                },
                mobile: {
                    required: tools.getText('register.mobileRequired'),
                    phone: tools.getText('register.mobilePhoneTip')
                },
                recommendUserId: {
                    required: tools.getText('register.recommendUserIdRequired'),
                    validRecommendId: tools.getText('register.recommendUserIdValid')
                },
                activatedNo: {
                    required: tools.getText('register.activatedNoRequired'),
                    validRecommendId: tools.getText('register.activatedNoValid')
                }
            }
        });

        $('#userId,#name,#mobile,#idCard,#bank,#bankAccountName,#bankCard').blur(function () {
            $(this).valid();
        });

        $('#recommendUserId').blur(function () {
            var userId = $(this).val();
            if ($(this).valid()) {
                $.post(basePath + '/register/getNameByUserId', {
                    userId: userId
                }, function (name) {
                    if (name != '') {
                        $('#recommendUserName').html(name);
                        $('#recommendUserArea').show();
                    } else {
                        $('#recommendUserArea').hide();
                    }
                })
            } else {
                $('#recommendUserName').html('');
                $('#recommendUserArea').hide();
            }
        });

        $('#activatedNo').blur(function () {
            var userId = $(this).val();
            if ($(this).valid()) {
                $.post(basePath + '/register/getNameByUserId', {
                    userId: userId
                }, function (name) {
                    if (name != '') {
                        $('#activeUserName').html(name);
                        $('#activeUserArea').show();
                    } else {
                        $('#activeUserArea').hide();
                    }
                })
            } else {
                $('#activeUserName').html('');
                $('#activeUserArea').hide();
            }
        });

        $('#registerBtn').click(function () {
            //alert($('input[name="petNo"]:checked').val());
            if ($('#registerForm').valid()) {
                $.post(basePath + '/register/doRegister', {
                    'user.userId': $.trim($('#userId').val()),
                    'user.name': $.trim($('#name').val()),
                    'user.mobile': $.trim($('#mobile').val()),
                    'user.idCard': $.trim($('#idCard').val()),
                    'user.recommendUserId': $.trim($('#recommendUserId').val()),
                    'user.activateUserId': $.trim($('#activatedNo').val()),
                    'user.petNo': $('input[name="petNo"]:checked').val()
                }, function (response) {
                    if (response) {
                        alert(tools.getText('register.success'));
                        window.location = basePath + '/login';
                    } else {
                        alert(tools.getText('systemError'));
                    }
                }, 'json');
            }
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/login';
        });
    });
});