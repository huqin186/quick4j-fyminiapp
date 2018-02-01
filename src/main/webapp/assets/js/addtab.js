/**
* 添加TAB选项
*/
function addTab(url, title, id) {
	if($("#divTabs").tabs("exists", title)){
		$("#divTabs").tabs("select", title);
	} else {
		var winHeight = $(window).height();
		
		var content = "<iframe frameborder='0' style='width:100%;height:" + (winHeight - 142) + "px;overflow-x:hidden;overflow-y:auto' noresize='noresize' scrolling='auto' src='" + url + "'></iframe>";
		
		$("#divTabs").tabs("add", {
			title:title,
			content:'<div>' + content + '</div>',
			closable: true
		});
	}
}

