define(function (require, exports, module) {

    exports.query = function (url, contentId, params, fn) {
        var mask = '<div id="mask" style="position:absolute;margin-left:-15px;text-align: center;top:0;width:100%;height:100%;filter:alpha(opacity=30);opacity:0.2;background-color:#000;z-index:999;"><img src="' + basePath + '/css/img/loading.gif" alt="加载中"/></div>'

        $('#' + contentId).css('position', 'relative').append(mask).load(url, params, fn);
    };
});