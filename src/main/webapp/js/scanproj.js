//页面开始加载
$(function(){
	var sortKind = $('input[checked="checked"][name="sort"]').val();
	var stateKind = $('input[checked="checked"][name="state"]').val();
	var toPage = 1;
	var keyword = $('#keyword').val();
	useAjaxFunction(sortKind,stateKind,toPage,keyword);
    $(function(){
        $('.asubmitBtn').click(function(){
            var keyword = $('#keyword').val();
            useAjaxFunction(sortKind,stateKind,toPage,keyword);
        })
    })
	$('label[name="sort"]').click(function(){
		var radioId = $(this).attr('for');
		$('label[name="sort"]').removeAttr('class') && $(this).attr('class', 'checked');
		$('input[name="sort"]').removeAttr('checked') && $('#' + radioId).attr('checked', 'checked');
		sortKind = $('input[checked="checked"][name="sort"]').val();
		stateKind = $('input[checked="checked"][name="state"]').val();
		useAjaxFunction(sortKind,stateKind,1,keyword);
	});
	$('label[name="state"]').click(function(){
		var radioId = $(this).attr('for');
		$('label[name="state"]').removeAttr('class') && $(this).attr('class', 'checked');
		$('input[name="state"]').removeAttr('checked') && $('#' + radioId).attr('checked', 'checked');
		sortKind = $('input[checked="checked"][name="sort"]').val();
		stateKind = $('input[checked="checked"][name="state"]').val();
		useAjaxFunction(sortKind,stateKind,1,keyword);
	});
    $('.s-p-indexall').click(function(){
		var pageKind = $(this).siblings('input').val();
		var curPage = $('.curPage').text();
		var totalPage = $('.totalPage').text();
		if(pageKind==1)
          toPage = 1;
        else if (pageKind==2) {
          (curPage<=1)?alert("已经是第一页了！"):(toPage = curPage*1-1);
        }
        else if (pageKind==3) {
          toPage = curPage;
          (curPage >= totalPage)?alert('已经是最后一页了！'):(toPage = curPage*1+1);
        }
        else if (pageKind==4) {
          toPage = totalPage;
        }
        useAjaxFunction(sortKind,stateKind,toPage,keyword);
    });
})

function useAjaxFunction(sortKind,stateKind,toPage,keyword){
	$.ajax({
		type:"post",
		url:"project/sortByInforProject",
		data:{
			sort:sortKind,
			state:stateKind,
			toPage:toPage,
			keyword:keyword
		},
		dataType:"json",
		success:function(result){
			if (result.code==1)
				alert(result.msg)
			console.log(result.msg)
			var jsons = result.data;
            if (jsons.size==0)
                alert("暂时没有此类型项目")
			console.log(jsons)
			$('.s-p-main').empty();
			if(keyword.length>0)	//判断字符串是否为空
				var keywordStr = '搜索关键字：<span class="keyword">'+keyword+'</span>' ;
			else
				var keywordStr = ' ';
			$('.s-p-main').append('<h3>排序：<span>'+getSortChinese(sortKind)+'</span>状态：<span>'+getSortChinese(stateKind)+'</span>关键字：<span>'+
                keyword+'</span><lable>共<span>'+jsons.total+'</span>个项目</lable></h3>');
			$('.curPage').text(toPage);
			$('.totalPage').text(Math.ceil(jsons.total/6));
			$('.s-p-main').append('<ul class="main_proj"></ul>');
			$.each(jsons.project, function(i, item) {
				var progress = Math.floor((item.supmoney/item.needmoney)*100);
				$('.main_proj').append("<li></li>");
				$('.main_proj li:eq('+i+')').append('<a href="/detailProject?id='+item.id+'"></a>');
				$('.main_proj li:eq('+i+') a').append('<span class="s-p-bg"><img src="'+getRootPath()+'/images/'+item.image+'" alt=""></span>');
				$('.main_proj li:eq('+i+') a').append('<span class="s-p-mt">'+item.name+'</span>');
				$('.main_proj li:eq('+i+') a').append('<span class="s-p-hide dispno"></span>');
				$('.main_proj li:eq('+i+') a').append('<span class="s-p-hide1 dispno">'+item.introduce+'</span>');
				$('.main_proj li:eq('+i+')').append('<div class="count_down"></div>');
				$('.main_proj li:eq('+i+') div').append('<span class="count_d" style="width: '+progress+'%;"></span>');
				$('.main_proj li:eq('+i+')').append('<p class="clearfix"></p>');
				$('.main_proj li:eq('+i+') p').append('<span class="s-p-mtxt fl">已筹金额<span class="s-p-t">¥'+item.supmoney+'</span></span>');
			});
			$.each(jsons.project, function(i, item) {
				$('.main_proj li:eq('+i+') p').append('<span class="s-p-mtxt fr">结束时间<span class="s-p-t">'+item.deadline+'</span></span>');
			});
        	$(".main_proj li a").mouseenter(function() {
        		$(this).find(".s-p-hide").show(500);
        		$(this).find(".s-p-hide1").show(500);
        		$(this).mouseleave(function() {
        			$(this).find(".s-p-hide").hide(100);
        			$(this).find(".s-p-hide1").hide(100);
        		});
        	});
		},
		error:function(result){
			console.log(result.msg)
			alert("系统加载异常，请稍后再试！");
		}
	});
}
//查找项目根目录
function getRootPath(){
	var curWwwPath=window.document.location.href;
	var pathName=window.document.location.pathname;
	var pos=curWwwPath.indexOf(pathName);
	var localhostPaht=curWwwPath.substring(0,pos);
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	return(localhostPaht+projectName);
}

function getSortChinese(sort){
	if(sort=='byAll'){
		return '综合排序';
	}else if(sort=='byTime'){
		return '最新上线';
	}else if(sort=='byMoney'){
		return '最高金额';
	}else if(sort=='bySup'){
		return '最多支持';
	}else if(sort=='byCol'){
		return '最多收藏';
	}else if(sort=='byAllState'){
		return '全部';
	}else if(sort=='byIngState'){
		return '众筹中';
	}else if(sort=='byStartSate'){
		return '即将开始';
	}else if(sort=='byOKSate'){
		return '众筹成功';
	}
}

