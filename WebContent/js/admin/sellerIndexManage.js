$(document).ready(function(){
	
});

$(function(){
	$('#file_upload').uploadify({  
	    'height'        : 27,   
	    'width'         : 80,    
	    'buttonText'    : '添加附件',  
	    'swf'           : '/js/uploadify.swf',  
	    'uploader'      : "/admin/manageHelp/seller/indexUploadPic",  
	    'auto'          : false, 
	    'fileSizeLimit' : '30720KB', 
	    'fileTypeExts'  : '*.doc; *.jpg; *.rar; *.gif', 
	    'uploadLimit' : 3, 
	   // 'formData'      : {'userName':'','content':''},  
	    'onUploadStart' : function(file) {
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