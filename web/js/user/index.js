define(function (require, exports, module) {
    var tools = require('tools/tools');
    $(function () {
        if ($('#needChangePwd').val() == 'true') {
            alert(tools.getText('index.changePwdTip'));
            window.location = basePath + '/self';
        }
    });
});