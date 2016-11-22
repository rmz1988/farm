/**
 * 图片上传
 */
define(function (require, exports, module) {
    var tools = require('tools/tools');
    /* require('jqueryUiWidget');
     require('jqueryFileupload');
     require('jqueryFileuploadTransport');
     require('jqueryFileuploadProcess');
     require('jqueryFileuploadValidate');*/

    exports.imgUpload = function (addUrl, delUrl, fileInputId) {
        $('#' + fileInputId).fileupload({
            url: addUrl,
            dataType: 'json',
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
            // The maximum allowed file size in bytes:
            maxFileSize: 2048000, // 2M
            messages: {
                acceptFileTypes: tools.getText('upload.acceptFileType'),
                maxFileSize: tools.getText('upload.maxFileSize')
            },
            start: function (e) {
                $('#' + fileInputId + 'Progress').css('width', '0');
            },
            progress: function (e, data) {
                var p = parseInt(data.loaded / data.total * 100, 10);
                $('#' + fileInputId + 'Progress').css('width', p + '%');
            },
            done: function (e, data) {
                if (data.result.state == 'SUCCESS') {
                    var $uploadedCount = $('#uploadedCount');
                    var $uploadedPics = $('#uploadedPics');
                    $uploadedCount.val(Number($uploadedCount.val()) + 1);

                    $uploadedPics.val($uploadedPics.val() + data.result.title + ';');
                    $uploadedPics.after('<img id="' + data.result.title + '" class="img-thumbnail img-responsive" src="' + data.result.url + '" style="display:inline-block;width:60px;height:60px;vertical-align: top;margin-left:5px;"/>');

                    $(document).on('click', 'img[id="' + data.result.title + '"]', function () {
                        var $img = $(this);
                        var imgName = $(this).attr('id');
                        if (confirm(tools.getText('upload.deleteImgTip'))) {
                            $.post(delUrl, {
                                imgName: imgName
                            }, function (response) {
                                if (response) {
                                    $uploadedCount.val(Number($uploadedCount.val()) - 1);
                                    $uploadedPics.val($uploadedPics.val().replace(imgName + ';', ''));
                                    $img.remove();
                                } else {
                                    alert(tools.getText('systemError'));
                                }
                            }, 'json');
                        }
                    });

                    if ($uploadedCount.val() == 5) {
                        $('#' + fileInputId).attr('disabled', true);
                    }
                }
            }
        });
    };

    exports.fileUpload = function (url, fileInputId) {
        $('#' + fileInputId).fileupload({
            url: url,
            dataType: 'json',
            acceptFileTypes: /(\.|\/)(xls|xlsx|doc|docx)$/i,
            // The maximum allowed file size in bytes:
            maxFileSize: 5120000, // 5 MB
            messages: {
                acceptFileTypes: '仅支持word文档或excel文档',
                maxFileSize: '文件最大支持5Mb'
            },
            start: function (e) {
                $('#' + fileInputId + 'Progress').css('width', '0').html('0%');
            },
            progress: function (e, data) {
                var p = parseInt(data.loaded / data.total * 100, 10);
                $('#' + fileInputId + 'Progress').css('width', p + '%').html(p + '%');
            },
            done: function (e, data) {

            }
        });
    }
});