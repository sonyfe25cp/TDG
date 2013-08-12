<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
<div class="container-fluid">
	<div class="row-fluid">
	    <div class="span3">
			<#include "/seller/common/left-nav.ftl">
		</div>
		<div class="span9">
			<@spring.message "seller.index.hello"/><p/>
			<@spring.message "seller.model.id"/>: ${seller.id}
			<#if notice.content??>
				${notice.content}
			</#if>
			<h3>注意</h3>
			<ul>
				<li>1.新注册用户请先去设定 店铺设置</li>
				<li>2.货币选择之后，将不能更改</li>
			</ul>
		</div>
	</div>
</div>
<#include "/seller/common/template-bottom.ftl">