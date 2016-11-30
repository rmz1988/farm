/**
 * 金币收购
 */
define(function (require, modules, exports) {
    var validator = require('validate/validate');
    var tools = require('tools/tools');

    $(function () {
        $('#agreeForm').validate({
            rules: {
                bank: {
                    required: true
                },
                bankAccountName: {
                    required: true
                },
                bankCard: {
                    required: true
                }
            }, messages: {
                bank: {
                    required: tools.getText('register.bankRequired')
                },
                bankAccountName: {
                    required: tools.getText('register.accountNameRequired')
                },
                bankCard: {
                    required: tools.getText('register.bankCardRequired')
                }
            }
        });

        $('#bank,#bankAccountName,#bankCard').blur(function () {
            $(this).valid();
        });

        $('#backBtn').click(function () {
            window.location = basePath + '/account/purchase';
        });

        $('#submitBtn').click(function () {
            if ($('#agreeForm').valid()) {
                $.post(basePath + '/account/doPurchaseAgree', {
                    'purchaseApply.applyId': $('#applyId').val(),
                    'purchaseApply.bank': $('#bank').val(),
                    'purchaseApply.accountName': $.trim($('#bankAccountName').val()),
                    'purchaseApply.bankCard': $.trim($('#bankCard').val())
                }, function (response) {
                    if (response) {
                        alert(tools.getText('purchase.submitSuccess'));
                        window.location = basePath + '/account/purchase';
                    } else {
                        alert(tools.getText('systemError'));
                    }
                }, 'json');

            }
        });
    });
});