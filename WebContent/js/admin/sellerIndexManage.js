$(document).ready(function(){
	
});

$(function(){
	$('#file_upload').uploadify({      
	    'multi'         : true,
	    'buttonText'    : '添加图片', 
	    'swf'           : '/js/uploadify.swf',  
	    'uploader'      : "/admin/manageHelp/seller/indexUploadPic", 
	    'cancelImg'     : '/img/uploadify-cancel.png',
	    'auto'          : false, 
	    'fileSizeLimit'     : '2MB',
	    'fileTypeDesc'      : '只能上传图片文件，如png、jpg、gif和bmp等格式的文件', 
	    'fileTypeExts'      : '*.png; *.jpg; *.gif', 
	    'uploadLimit'   : 10, 
	   // 'formData'      : {'userName':'','content':''},  
	    'onUploadStart' : function(file) {
	    	alert("come in");
	    },  
	    'onUploadSuccess':function(file, data, response){  
	        //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
//	         $("#tempFileName").val(file.name);
//	         $("#"+idName).val(data);
	    },  
	    'onUploadComplete':function(){  
	       // $('#importLispDialog').window('close');  
	    }  
	});     
});

function startUpload(){
	alert("start!");
	$('#file_upload').uploadify('upload', '*');
}