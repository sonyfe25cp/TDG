	function ajaxFileUpload() {
		$.ajaxFileUpload({
			url : '/upload/image', //需要链接到服务器地址
			secureuri : false,
			fileElementId : 'bigPic', //文件选择框的id属性
			dataType : 'json', //服务器返回的格式，可以是json
			success : function(data, status) //相当于java中try语句块的用法
			{
				var jsonObject = jQuery.parseJSON(data);
				var url = jsonObject['url'];
				$("#showImg").attr("src", url);

			},
			error : function(data, status, e) //相当于java中catch语句块的用法
			{
				alert("出错了，请重新上传！");
			}
		});
	}

