define(function (require, exports, module) {
    var validator = require('validate/validate');
    var upload = require('tools/upload');
    var tools = require('tools/tools');

    $(function () {
        upload.imgUpload(basePath + '/feedback/uploadImg', basePath + '/feedback/deleteImg', 'pics');

        $('#feedbackForm').validate({
            rules: {
                title: {
                    required: true
                },
                content: {
                    required: true
                }
            },
            messages: {
                title: {
                    required: tools.getText('feedback.titleRequired')
                },
                content: {
                    required: tools.getText('feedback.contentRequired')
                }
            }
        });

        $('#title,#content').blur(function () {
            $(this).valid();
        });

        $('#feedbackPublishBtn').click(function () {
            if ($('#feedbackForm').valid()) {
                $.post(basePath + '/feedback/doPublish', {
                    'feedback.title': $.trim($('#title').val()),
                    'feedback.content': $.trim($('#content').val()),
                    'feedback.pics': $('#uploadedPics').val()
                }, function (response) {
                    if (response) {
                        alert(tools.getText('feedback.success'));
                        window.location = basePath + '/feedback';
                    } else {
                        alert(tools.getText('systemError'));
                    }
                }, 'json');
            }
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/feedback';
        });
    });
});