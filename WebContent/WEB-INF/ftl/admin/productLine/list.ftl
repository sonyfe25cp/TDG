<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<script src="/js/common/productLine.js"></script>
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<!-- <a href="/admin/productLine/new" class="btn btn-primary">New</a> -->
			<div class="span9">
				<table class="table">
					<thead>
						<tr>
							<th><@spring.message "productLine.model.id"/></th>
							<th><@spring.message "productLine.model.name"/></th>
							<th><@spring.message "productLine.model.english"/></th>
							<th><@spring.message "productLine.model.discount"/></th>
							<th>佣金比例</th>
							<th><@spring.message "menu.options"/></th>
						</tr>
					</thead>
					<tbody class="productLines">
						<#list productLines as productLine>
							<tr>
								<td>${productLine.id}</td>
								<td>${productLine.name}</td>
								<td>
									${productLine.english}
								</td>
								<td>
									${productLine.discount}
								</td>
								<td>
									${productLine.commission}
								</td>
								<td>
									<button class="btn btn-info"><@spring.message "button.show"/></button>
									<a class="btn btn-info" href="/admin/productLine/edit?id=${productLine.id}"><@spring.message "button.edit"/></a>
									<#if productLine.level < 3>
										<a class="btn btn-primary" href="/admin/productLine/new?parentId=${productLine.id}"><@spring.message "button.add"/></a>
									</#if>
								</td>
							</tr>
						</#list>
					</tbody>
				</table>
				<div class="pagination">
				<ul>
					<li><a href="/admin/productLine/list">First</a></li>
					<#if pageNo!=0>
					    <li><a href="/admin/productLine/list?pageNo=${pageNo-1}">Prev</a></li>
					</#if>
				    <li><a href="/admin/productLine/list?pageNo=${pageNo+1}">Next</a></li>
				</ul>
				</div>
			</div>
		</div>
	</div>
<#include "/admin/common/template-bottom.ftl">
</div>