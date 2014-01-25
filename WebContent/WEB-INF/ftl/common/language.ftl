<script>
  function changeLanguage(language){
	    $.ajax({
	        type: "POST",
	        url: "/changelanguage",
	        data: "new_lang="+language,
	        dataType: "json",
	        success: function(data)
	        {
	            window.location.reload();
	        },
	        error: function(data){
	        	//alert("change lang error!");
	        	window.location.reload();
	        }
	    });
	}
  </script>
<!--
  <span><a href="javascript:void(0)" onclick="changeLanguage('en_US')">English</a></span>|
  <span><a href="javascript:void(0)" onclick="changeLanguage('zh_CN')">中文</a></span>
 -->