
$(function(){
	//暂未开发
	$(".style_normal").click(function(){
		$(".proj_freelink") .show();
	});
	$(".style_free").click(function(){
		$(".proj_freelink") .hide();
	});
	//发起项目步骤跳转
	$(".go_step1").click(function(){
		$(".step1").show();
		$('body,html').animate({ scrollTop: 0 }, 100);
		$(".step2").hide();
		$(".step3").hide();
	});
	$(".go_step2").click(function(){
		$(".step2").show();
		$('body,html').animate({ scrollTop: 0 }, 100);
		$(".step1").hide();
		$(".step3").hide();
	});
	$(".go_step3").click(function(){
		$(".step3").show();
		$('body,html').animate({ scrollTop: 0 }, 100);
		$(".step1").hide();
		$(".step2").hide();
	});
	//显示上传图片
	$(".uploadpic").change(function(){
     	$(this).parent().siblings().children("img").attr("src",URL.createObjectURL($(this)[0].files[0])).css({"width":"148px","height":"90px"});
      	$(this).parent().siblings().children("span").html("");
	})
	//提交信息
	$('.OKsubmit').click(function(){
		if($('.hidinput').val()=="submit"){
			alert("请先选择预览一遍，否则提交之后无法进行修改了");
//			submitAjaxFunction();
		}
		else{
			$('.hidinput').val('submit');
			$('#projectForm').attr('target','_self');
			$('#projectForm').submit();
		}
	});
	//项目预览
	$('.newsee').click(function(){
		$('.hidinput').val('preview');
		$('#projectForm').attr('target','_blank');
		submitAjaxFunction();
	});
});

function submitAjaxFunction(){
	var files = [ 'file1', 'file2', 'file3', 'file4' ];  //将上传4个文件 ID 分别为file1,file2,file3,file4
	$.ajaxFileUpload({
		url:'util/fileImageUpload',     //用于文件上传的服务器端请求地址  
		secureuri : false,            //一般设置为false  
		fileElementId : files,        //文件上传空间的id属性  <input type="file" id="file" name="file" />  
		dataType : 'json',            //返回值类型 一般设置为json  
		data:{
			path:'project',			//传的保存文件路径
		},
		success : function(data, status) {
			var fileNames = data.fileFileName; //返回的文件名 
			$('.fileList').val(fileNames[0]);
			$('.fileImage').val(fileNames[1]);
			$('.fileDetail').val(fileNames[2]);
			$('.fileBackImage').val(fileNames[3]);
			$('#projectForm').submit();
		},
        error: function(data,status,e){
            alert(e+"===上传文件失败");
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
