$(document).ready(function(){
	$("#pic-next").click(function(){
        var pic_num = $(".picture-list li").length;
        var k = currentPic();
        if(k!= (pic_num-1)){
           $(".picture-list li:eq("+k+")").addClass("hide-pic");
           $(".picture-list li:eq("+(k+1)+")").removeClass("hide-pic");
        }
        else{
           $(".picture-list li:eq("+k+")").addClass("hide-pic");
           $(".picture-list li:eq(0)").removeClass("hide-pic");
        }
	});
	
	$("#pic-pre").click(function(){
		var pic_num = $(".picture-list li").length;
        var k = currentPic();
        if(k!= 0){
           $(".picture-list li:eq("+k+")").addClass("hide-pic");
           $(".picture-list li:eq("+(k-1)+")").removeClass("hide-pic");
        }
        else{
           $(".picture-list li:eq(0)").addClass("hide-pic");
           $(".picture-list li:eq("+(pic_num-1)+")").removeClass("hide-pic");
        }
	});
});

function currentPic(){
    var pic_num = $(".picture-list li").length;
    for(var i = 0; i<pic_num; i++){
       var classArray = $(".picture-list li:eq("+i+")").attr('class').split(' ');
       if(!inArray("hide-pic", classArray)){
          return i;
       }
    }
 }
 
 function inArray(li_class, classArray){
   if(classArray==null||classArray.length==0){
      return false;
   }
   var classNum = classArray.length;
   for(var j = 0; j< classNum; j++){
      if(li_class == classArray[j]){
          return true;
      }
   }
   return false;
 }