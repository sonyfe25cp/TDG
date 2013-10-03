<legend><@spring.message "brand.list.title"/></legend>
<a href="/seller/brandadd" class="btn"><@spring.message "button.add"/></a>
<table class="table">
	<thead>
		<th><@spring.message "brand.id"/></th>
		<th><@spring.message "brand.name"/></th>
		<th><@spring.message "brand.description"/></th>
		<th><@spring.message "brand.status"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list brands as brand>
			<tr>
				<td>
					${brand.id}
				</td>
				<td>
					${brand.name}
				</td>
				<td>
					${brand.description}
				</td>
				<td>
					<#switch brand.status>
						<#case 1><!-- 申请翻译 -->
							<@spring.message "brand.status.InEnglishDisplay"/>
						<#break>
						<#case 2><!-- 等待翻译分配 -->
							<@spring.message "brand.status.applyTranslation"/>
						<#break>
						<#case 3><!-- 等待翻译完成 -->
							<@spring.message "brand.status.InTranslation"/>
						<#break>
						<#case 4><!-- 等待管理员审核 -->
							<@spring.message "brand.status.TranslationComplete"/>
						<#break>
						<#case 5><!-- 等待用户确认 -->
							<@spring.message "brand.status.ChinaListingCreated"/>
						<#break>
						<#case 6><!-- 已经在售 -->
							<@spring.message "brand.status.startShow"/>
						<#break>
						<#case 7><!-- 已经翻译完并停售 -->
							<@spring.message "brand.status.stopShow"/>
						<#break>
					</#switch>
				</td>
				<td>
					<a href="/seller/brandedit?id=#{brand.id}" class="btn"><@spring.message "button.edit"/></a>
					<a href="/seller/branddelete?id=#{brand.id}" class="btn"><@spring.message "button.delete"/></a>
					<#switch brand.status>
						<#case 1><!-- 申请翻译 -->
							<a href="/seller/changestatus?status=2&brandId=${brand.id}" class="btn btn-primary"><@spring.message "brand.status.applyTranslation"/></a>
						<#break>
						<#case 2><!-- 等待翻译分配 -->
							
						<#break>
						<#case 3><!-- 等待翻译完成 -->
						<#break>
						<#case 4><!-- 等待管理员审核 -->
						<#break>
						<#case 5><!-- 等待用户确认 -->
							<a href="/seller/changestatus?status=6&brandId=${brand.id}" class="btn btn-primary"><@spring.message "brand.status.startShow"/></a>
						<#break>
						<#case 6><!-- 已经显示 -->
							<a href="/seller/changestatus?status=7&brandId=${brand.id}" class="btn btn-primary"><@spring.message "brand.status.stopShow"/></a>
						<#break>
						<#case 7><!-- 已经翻译完并显示 -->
							<a href="/seller/changestatus?status=6&brandId=${brand.id}" class="btn btn-primary"><@spring.message "brand.status.startShow"/></a>
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