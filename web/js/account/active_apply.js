define(function (require, exports, module) {
    var validator = require('validate/validate');
    var tools = require('tools/tools');

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
                    required: tools.getText('active.activeNoRequired'),
                    regex: tools.getText('active.activeNoRegex'),
                    uniqueActiveNo: tools.getText('active.uniqueActiveNo')
                }
            }
        });

        $('#activeNo').blur(function () {
            $(this).valid();
        });

        $('#applyBtn').click(function () {
            if ($('#applyForm').valid()) {
                $.post(basePath + '/account/doApply', {
                    userId: $('#userId').val(),
                    activeNo: $.trim($('#activeNo').val())
                }, function (response) {
                    if (response) {
                        alert(tools.getText('active.activeApplySuccess'));
                        window.location = basePath + '/account/apply';
                    } else {
                        alert(tools.getText('systemError'));
                    }
                }, 'json');
            }
        });

        //编辑
        $('#editBtn').click(function () {
            var applyId = $(this).attr('name');
            window.location = basePath + '/account/apply/edit?applyId=' + applyId;
        })
    });
});