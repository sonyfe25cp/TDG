<legend><@spring.message "brand.list.title"/></legend>
<table class="table">
	<thead>
		<th><input type="checkbox" name="all-select"/></th>
		<th><@spring.message "brand.id"/></th>
		<th><@spring.message "brand.name"/></th>
		<th><@spring.message "brand.status"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list brands as brand>
			<tr>
				<td>
					<#if brand.status==2>
						<input type="checkbox" name="translation" value="${brand.id}"/>
					</#if>
				</td>
				<td>
					${brand_index+1}
				</td>
				<td>
					${brand.name}
				</td>
				<td>
					<a href="/brand/${brand.id}" target="_blank" class="btn btn-info"><@spring.message "button.show"/></a>
					<#switch brand.status>
						<#case 1><!-- 申请翻译 -->
						<#break>
						<#case 2><!-- 等待翻译分配 -->
							
						<#break>
						<#case 3><!-- 等待翻译完成 -->
						<#break>
						<#case 4><!-- 等待管理员审核 -->
							<a href="/admin/brand/changestatus?status=5&brandId=${brand.id}" class="btn btn-primary"><@spring.message "brand.status.TranslationComplete"/></a>
							<a href="/admin/translationTask/redo?taskId=${brand.id}&taskType=brand" class="btn btn-danger">ReDo</a>
						<#break>
						<#case 5><!-- 等待用户确认 -->
						<#break>
						<#case 6><!-- 已经在售 -->
						<#break>
						<#case 7><!-- 已经翻译完并停售 -->
							<a href="/admin/brand/changestatus?status=6&brandId=${brand.id}" class="btn btn-primary"><@spring.message "brand.status.startShow"/></a>
						<#break>
					</#switch>
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/seller/listbrand?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/seller/listbrand?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/seller/listbrand?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>