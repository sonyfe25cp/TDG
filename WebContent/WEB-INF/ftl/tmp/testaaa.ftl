<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>多文件上传</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    

	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/ajaxfileupload-2.js"></script>
	<script type="text/javascript">
		function upload(){
			$.ajaxFileUpload({
				url:'/upload/image',
		        files:[$('#uploadFile0'),$('#uploadFile1')],//多个文件上传(String 或 Jquery对象均可)
		        secureuri:false,
		        dataType:'json',
		        success:function(data){
					alert('success : size -> ' + data.size);
		        },
		        error:function(data,status,e){
		        	alert('error:'+e);
		        }
			});
		};
	</script>
  </head>
  
  <body>
    <input id="uploadFile0" type="file" name="image" />
    <input id="uploadFile1" type="file" name="image" />
    <a href="javascript:void(0)" onclick="upload();">Upload</a>
  </body>
</html>