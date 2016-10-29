define(function (require, exports, module) {
    var validator = require('validate/validate');

    $(function () {

        $('#applyForm').validate({
            rules: {
                activeNo: {
                    required: true,
                    regex: /^\d{3}$/,
                    uniqueActiveNo: true
                }
            },
            messages: {
                activeNo: {
                    required: '请输入您要申请的激活中心编号',
                    regex: '激活中心编号只能是3位数字',
                    uniqueActiveNo: '该激活中心编号已被使用'
                }
            }
        });

        $('#activeNo').blur(function () {
            $(this).valid();
        });

        $('#applyBtn').click(function () {
            if ($('#applyForm').valid()) {
                $.post(basePath + '/account/doApplyEdit', {
                    applyId: $('#applyId').val(),
                    userId: $('#userId').val(),
                    activeNo: $.trim($('#activeNo').val())
                }, function (response) {
                    if (response) {
                        alert('您的申请已提交，系统将在4小时内审核！');
                        window.location = basePath + '/account/apply';
                    } else {
                        alert('系统繁忙，请稍后重试');
                    }
                }, 'json');
            }
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/account/apply';
        })
    });
});