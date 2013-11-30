<table class="table">
	<thead>
		<th>ID</th>
		<th>name</th>
		<th><@spring.message "translationTask.model.count"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list tasks as task>
			<tr>
				<td>${task.id}</td>
				<td>
					<#if task.taskType == 'product'>
						<#if task.product??>
							<a href="/product/${task.taskId}" target="_blank">${task.product.name}</a>
						<#else>
							该产品已被删除
						</#if>
					<#else>
						<#if task.brand??>
							<a href="/admin/brand/show/${task.taskId}" target="_blank">${task.brand.name}</a>
						<#else>
							该品牌已经被删除
						</#if>
					</#if>
				</td>
				<td>
					${task.count}
				</td>
				<td>
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination">
	<ul>
		<li><a href="/admin/translationTask/showByTranslator?userId=${translatorId}">First</a></li>
		<#if pageNo!=0>
		    <li><a href="/admin/translationTask/showByTranslator?userId=${translatorId}&pageNo=${pageNo-1}">Prev</a></li>
		</#if>
	    <li><a href="/admin/translationTask/showByTranslator?userId=${translatorId}&pageNo=${pageNo+1}">Next</a></li>
	</ul>
</div>