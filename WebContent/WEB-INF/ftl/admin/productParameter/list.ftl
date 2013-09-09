<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<script src="/js/common/productParameter.js"></script>
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<!-- <a href="/admin/productParameter/new" class="btn btn-primary">New</a> -->
			<div class="span9">
				<table class="table">
					<thead>
						<tr>
							<th><@spring.message "productParameter.model.id"/></th>
							<th><@spring.message "productParameter.model.name"/></th>
							<th><@spring.message "productParameter.model.english"/></th>
							<th><@spring.message "productParameter.model.pvalue"/></th>
							<th><@spring.message "menu.options"/></th>
						</tr>
					</thead>
					<tbody class="productParameters">
						<#list productParameters as productParameter>
							<tr>
								<td>${productParameter.id}</td>
								<td>${productParameter.name}</td>
								<td>
									${productParameter.english}
								</td>
								<td>
									${productParameter.pvalue}
								</td>
								<td>
									<button class="btn btn-info"><@spring.message "button.show"/></button>
									<a class="btn btn-info" href="/admin/productParameter/edit?id=${productParameter.id}"><@spring.message "button.edit"/></a>
									<#if productParameter.level < 2>
										<a class="btn btn-primary" href="/admin/productParameter/new?parentId=${productParameter.id}"><@spring.message "button.add"/></a>
									</#if>
								</td>
							</tr>
						</#list>
					</tbody>
				</table>
				<div class="pagination">
				<ul>
					<li><a href="/admin/productParameter/list">First</a></li>
					<#if pageNo!=0>
					    <li><a href="/admin/productParameter/list?pageNo=${pageNo-1}">Prev</a></li>
					</#if>
				    <li><a href="/admin/productParameter/list?pageNo=${pageNo+1}">Next</a></li>
				</ul>
				</div>
			</div>
		</div>
	</div>
<#include "/admin/common/template-bottom.ftl">
</div>