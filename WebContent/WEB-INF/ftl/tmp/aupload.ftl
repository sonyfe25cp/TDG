<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/js/ajaxfileupload.js"></script>
<script src="/js/ta.js"></script>
<title>Insert title here</title>
</head>
<body>

上传图片：
<form id="info_pic" method="post" action="/admin/product/addpic" enctype="multipart/form-data">  
	<input type="file" id="bigPic" name="image"/>
	<input type="button" value="上传" onclick="ajaxFileUpload()"/>
</form>

<div id="imgDiv">
<img id="showImg"alt="" src="" height="100px" width="100px">
<button id="deleteImg" onclick="ajaxFileDelete()">删除</button>
</div>

</body>
</html>