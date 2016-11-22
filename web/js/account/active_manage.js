define(function (require, exports, module) {
    var tools = require('tools/tools');

    $(function () {
        $('#content').on('click', 'button[name="activeBtn"]', function () {
            if (confirm(tools.getText('active.confirm'))) {
                var $btn = $(this);
                $(this).attr('disabled',true);
                var applyId = $(this).attr('id');
                $.post(basePath + '/account/doActive', {
                    applyId: applyId
                }, function (response) {
                    if (response) {
                        alert(tools.getText('active.success'));
                        $('#queryBtn').click();
                    } else {
                        alert(tools.getText('active.activeMoneyNotEnough'));
                        $btn.attr('disabled',false);
                    }
                }, 'json');
            }
        });

        $('#queryBtn').click(function () {
            tools.query(basePath + '/account/queryActivateApplyList', 'content', {
                userId: $.trim($('#userId').val()),
                status: $('#status').val()
            });
        }).click();

    });
});