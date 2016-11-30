define(function (require, exports, module) {

    exports.query = function (url, contentId, params, fn) {
        var mask = '<div id="mask" style="position:absolute;margin-left:-15px;text-align: center;top:0;width:100%;height:100%;filter:alpha(opacity=30);opacity:0.2;background-color:#000;z-index:999;"><img src="' + basePath + '/css/img/loading.gif" alt="加载中"/></div>'

        $('#' + contentId).css('position', 'relative').append(mask).load(url, params, fn);
    };

    var langs = {
        'zh_CN': {
            'systemError': '系统繁忙，请稍后重试',
            'login.userIdTip': '请输入玩家编号',
            'login.passwordTip': '请输入登录密码',
            'login.userIdPwdError': '玩家编号或密码错误',
            'login.userNotActivate': '玩家尚未激活',
            'login.userStop': '玩家已停用',
            'login.visitTip': '系统正在结算中...\n请于每天7:00——24:00登录',
            'register.userIdRequired': '请输入玩家编号',
            'register.userRegex': '玩家编号必须是6位以上数字',
            'register.uniqueUserId': '该编号已被使用，请更换',
            'register.nameRequired': '请输入玩家姓名',
            'register.idCardRequired': '请填写身份证号码',
            'register.uniqueIdCard': '该身份证已注册',
            'register.mobileRequired': '请填写联系电话',
            'register.mobilePhoneTip': '电话号码不合法',
            'register.bankRequired': '请选择开户行',
            'register.accountNameRequired': '请输入银行开户名',
            'register.bankCardRequired': '请输入银行卡号',
            'register.recommendUserIdRequired': '请输入推荐玩家编号',
            'register.recommendUserIdValid': '无效的推荐玩家编号',
            'register.activatedNoRequired': '请输入激活中心编号',
            'register.activatedNoValid': '无效的激活中心编号',
            'register.success': '注册成功！等待激活中心激活后可登录系统！',
            'active.activeNoRequired': '请输入您要申请的激活中心编号',
            'active.activeNoRegex': '激活中心编号只能是3位数字',
            'active.uniqueActiveNo': '该激活中心编号已被使用',
            'active.activeApplySuccess': '您的申请已提交，系统将在4小时内审核！',
            'active.confirm': '确认激活该用户？',
            'active.success': '激活成功',
            'active.activeMoneyNotEnough': '您的激活币余额不足，不能执行激活操作',
            'pet.incomeUpToLimit': '您今日收入已达上限，今日喂养将不再产生收益！',
            'pet.feeding': '正在喂养，请不要走开...',
            'pet.repurchasing': '正在复购，请不要走开...',
            'pet.repurchaseTip1': '复购将扣除您',
            'pet.repurchaseTip2': '奖励币，是否继续？',
            'upload.acceptFileType': '仅支持JPG,PNG,GIF格式图片',
            'upload.maxFileSize': '图片最大支持2Mb',
            'upload.deleteImgTip': '确认删除图片？',
            'transfer.moneyRequired': '请填写转出金额',
            'transfer.maxOfTimesTip1': '金额须是',
            'transfer.maxOfTimesTip2': '的倍数，不得超过',
            'transfer.tradePwdRequired': '请输入交易密码',
            'transfer.tradePwdInvalid': '交易密码不正确',
            'transfer.success': '转出成功',
            'transfer.outUserIdRequired': '请填写转出玩家编号',
            'transfer.existsUser': '该玩家不存在',
            'transfer.cannotTransfer': '该玩家喂养未满15天',
            'transferActive.moneyRequired': '请输入转换金额',
            'transferActive.maxOfTimesTip1': '转换金额须是',
            'transferActive.maxOfTimesTip2': '的倍数，不得超过',
            'transferActive.success': '转换成功！',
            'withdraw.moneyRequired': '请填写提现金额',
            'withdraw.moneyTip1': '提现金额须是',
            'withdraw.moneyTip2': '的倍数，不得超过',
            'withdraw.success': '提现申请已提交，后台审核后到账！',
            'feedback.titleRequired': '请填写反馈标题',
            'feedback.contentRequired': '请填写反馈内容',
            'feedback.success': '发布成功',
            'self.oldLoginPwdRequired': '请输入原登录密码',
            'self.oldLoginPwdError': '登录密码不正确',
            'self.loginPwdRequired': '请输入新登录密码',
            'self.repeatLoginPwdRequired': '请再次输入新登录密码',
            'self.loginPwdNotSame': '与新登录密码不一致',
            'self.loginPwdSuccess': '修改成功，请重新登录！',
            'self.oldTradePwdRequired': '请输入原交易密码',
            'self.oldTradePwdError': '交易密码不正确',
            'self.tradePwdRequired': '请输入新交易密码',
            'self.repeatTradePwdRequired': '请再次输入新交易密码',
            'self.tradePwdNotSame': '与新交易密码不一致',
            'self.tradePwdSuccess': '修改成功！',
            'transfer.transferLimitMoney': '互转、提现每日累计1000元以上,需当日复购3次才可进行',
            'withdraw.withdrawLimitMoney': '互转、提现每日累计1000元以上,需当日复购3次才可进行',
            'transferActive.transferLimitMoney': '互转、提现、转激活币每日累计1000元及以上，须当日复购3次才可进行',
            'purchase.paymentTip':'支付通知已发送，等待对方确认',
            'purchase.balanceTip':'您的奖励币已少于对方收购金额，暂无法进行收购',
            'purchase.success':'操作成功',
            'purchase.finish':'收购完成',
            'purchase.submitSuccess':'提交成功',
            'purchase.applySubmit':'申请已提交，等待对方处理',
            'purchase.moneyRequired':'请输入要收购的金额',
            'purchase.moneyMin':'至少收购0.01元',
            'purchase.moneyMax':'收购金额不能超过玩家奖励币余额'
        },
        'en_US': {
            'systemError': 'System is busy,please try again later',
            'login.userIdTip': 'Please input user ID',
            'login.passwordTip': 'Please input login password',
            'login.userIdPwdError': 'User ID or password is incorrect',
            'login.userNotActivate': 'User has not been activated',
            'login.userStop': 'User is disabled',
            'login.visitTip': 'Checking...\nVisit time: 7:00——24:00',
            'register.userIdRequired': 'Please input user ID',
            'register.userRegex': 'User ID must be 6 or more numbers',
            'register.uniqueUserId': 'The user ID has been used',
            'register.nameRequired': 'Please input your name',
            'register.idCardRequired': 'Please input your ID card number',
            'register.uniqueIdCard': 'The ID card number has been used',
            'register.mobileRequired': 'Please input your phone number',
            'register.mobilePhoneTip': 'Phone number is illegal',
            'register.bankRequired': 'Please select the bank',
            'register.accountNameRequired': 'Please input your account name of the bank',
            'register.bankCardRequired': 'Please input your bank card number',
            'register.recommendUserIdRequired': 'Please input the user ID who recommends you',
            'register.recommendUserIdValid': 'The recommend user ID is illegal',
            'register.activatedNoRequired': 'Please input the activate No',
            'register.activatedNoValid': 'The activate No is illegal',
            'register.success': 'Success! You can sign in after being activated',
            'active.activeNoRequired': 'Please input the activate No. you will apply',
            'active.activeNoRegex': 'The activate No. must be 3 numbers',
            'active.uniqueActiveNo': 'The activate No. has been used',
            'active.activeApplySuccess': 'Your application has been submitted',
            'active.confirm': 'Ensure to activate the user？',
            'active.success': 'Success',
            'active.activeMoneyNotEnough': 'Operation forbidden! Because of your activate bonus is not enough',
            'pet.incomeUpToLimit': 'Your income is up to limit,you will not get any income by feed today',
            'pet.feeding': 'Feeding,please wait...',
            'pet.repurchasing': 'Repurchasing,please wait...',
            'pet.repurchaseTip1': 'Repurchase will cost ',
            'pet.repurchaseTip2': ',continue?',
            'upload.acceptFileType': 'Only supports JPG, PNG, GIF pictures',
            'upload.maxFileSize': 'Picture must less than 2Mb',
            'upload.deleteImgTip': 'Ensure to delete the picture?',
            'transfer.moneyRequired': 'Please input the amount',
            'transfer.maxOfTimesTip1': 'The amount must be a multiple of ',
            'transfer.maxOfTimesTip2': ',and less than',
            'transfer.tradePwdRequired': 'Please input trade password',
            'transfer.tradePwdInvalid': 'Trade password is incorrect',
            'transfer.success': 'Success!',
            'transfer.outUserIdRequired': 'Please input the transfer user ID',
            'transfer.existsUser': 'The user is not exists',
            'transfer.cannotTransfer': 'Feeding is less than 15 days',
            'transferActive.moneyRequired': 'Please input the amount',
            'transferActive.maxOfTimesTip1': 'The amount must be a multiple of ',
            'transferActive.maxOfTimesTip2': ',and less than',
            'transferActive.success': 'Success!',
            'withdraw.moneyRequired': 'Please input the amount',
            'withdraw.moneyTip1': 'The amount must be a multiple of ',
            'withdraw.moneyTip2': ',and less than ',
            'withdraw.success': 'Apply has been submitted!',
            'feedback.titleRequired': 'Please input title',
            'feedback.contentRequired': 'Please input content',
            'feedback.success': 'Success!',
            'self.oldLoginPwdRequired': 'Please input old login password',
            'self.oldLoginPwdError': 'Login password is incorrect',
            'self.loginPwdRequired': 'Please input new login password',
            'self.repeatLoginPwdRequired': 'Please input new login password again',
            'self.loginPwdNotSame': 'Not same as the new login password',
            'self.loginPwdSuccess': 'Success，please sign in again!',
            'self.oldTradePwdRequired': 'Please input old trade password',
            'self.oldTradePwdError': 'Trade password is incorrect',
            'self.tradePwdRequired': 'Please input new trade password',
            'self.repeatTradePwdRequired': 'Please input new trade password again',
            'self.tradePwdNotSame': 'Not same as the new trade password',
            'self.tradePwdSuccess': 'Success!',
            'transfer.transferLimitMoney': 'The amount of transfer and withdraw has added up to 1000 yuan,you can continue after repurchasing for 3 times today',
            'withdraw.withdrawLimitMoney': 'The amount of transfer and withdraw has added up to 1000 yuan,you can continue after repurchasing for 3 times today',
            'transferActive.transferLimitMoney': 'The amount of transfer、withdraw and transfer to active has added up to 1000 yuan,you can continue after repurchasing for 3 times today',
            'purchase.paymentTip':'The notice of payment has send,waiting for opposite confirmation',
            'purchase.balanceTip':'Your bonus has been less than the amount of purchase,cannot continue',
            'purchase.success':'Success',
            'purchase.finish':'Purchase finish',
            'purchase.submitSuccess':'Success',
            'purchase.applySubmit':'The apply has submit,waiting...',
            'purchase.moneyRequired':'Please input the amount of purchase',
            'purchase.moneyMin':'The amount is at least 0.01 yuan',
            'purchase.moneyMax':'The amount of purchase cannot be greater than opposite bonus'
        }
    };

    exports.getText = function (key) {
        return langs[locale][key];
    }
});