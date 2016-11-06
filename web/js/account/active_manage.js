define(function (require, exports, module) {
    var tools = require('tools/tools');

    $(function () {


        $('#queryBtn').click(function () {
            tools.query(basePath + '/account/queryActivateApplyList', 'content', {
                userId: $.trim($('#userId').val()),
                status: $('#status').val()
            },function(){
                //激活
                $('#content').off('click', 'button[name="activeBtn"]');
                $('#content').on('click', 'button[name="activeBtn"]', function () {
                    if (confirm('确认激活该用户？')) {
                        var applyId = $(this).attr('id');
                        $.post(basePath + '/account/doActive', {
                            applyId: applyId
                        }, function (response) {
                            if (response) {
                                alert('激活成功');
                                $('#queryBtn').click();
                            } else {
                                alert('您的激活币余额不足，不能执行激活操作');
                            }
                        }, 'json');
                    }
                });
            });
        }).click();

    });
});