define(function (require, exports, module) {
    var validator = require('validate/validate');
    var upload = require('tools/upload');

    $(function () {
        upload.imgUpload(basePath + '/feedback/uploadImg', basePath + '/feedback/deleteImg', 'pics');

        $('#feedbackForm').validate({
            rules: {
                title: {
                    required: true
                }
            },
            messages: {
                title: {
                    required: '请填写反馈标题'
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
                    'feedback.pics':$('#uploadedPics').val()
                }, function (response) {
                    if (response) {
                        alert('发布成功');
                        window.location = basePath + '/feedback';
                    } else {
                        alert('系统繁忙，请稍后重试');
                    }
                }, 'json');
            }
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/feedback';
        });
    });
});