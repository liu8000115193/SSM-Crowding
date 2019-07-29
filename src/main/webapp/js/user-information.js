 $("input[type='file']").change(function(){   
 var file = this.files[0];
 var url;
   if (window.FileReader) {    
            var reader = new FileReader();    
            reader.readAsDataURL(file);    
            //监听文件读取结束后事件    
          reader.onloadend = function (e) {
          url=e.target.result;
            $(".xiugai_img").attr("src",url).css({"width":"90px","height":"90px","border":"1px solid black"}); 
               //e.target.result就是最后的路径地址 
            };    
       }
     $(".input_button_yes").click(function(){
            $(".cur_img").attr("src",url).css({"width":"90px","height":"90px","border":"1px solid black"}); 
            $(".head_img").attr("src",url).css({"width":"90px","height":"90px","border":"1px solid black"}); 
            $(".input_url").val($(".file").val())
            $(this).parent().parent().parent().hide();
     })
})
/*  $(function(){
      if($(".test").text()!=""){
         alert(${sessionScope.u_name})
        }
        else{
            alert(${sessionScope.u_name})
        }
   }) */
   $(function () {
        $(".list li").click(function () {

            $(".user_content").hide();
            $(".user_content").eq($(this).index()).show();

        })
    })
    var user="${sessionScope.user.getU_name()}"
    if(user!=null){
      $(".lr1").hide()
      $(".zhuxiao").show();  
    }