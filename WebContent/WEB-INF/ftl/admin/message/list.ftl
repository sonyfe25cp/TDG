<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<a href="/admin/messageCenter/new" class="btn btn-info"><@spring.message "button.newMessage"/></a>
				<table class="table">
					<thead>
						<tr>
							<th><@spring.message "message.model.id"/></th>
							<th><@spring.message "message.model.title"/></th>
							<th><@spring.message "message.model.createAt"/></th>
							<th><@spring.message "menu.status"/></th>
							<th><@spring.message "menu.options"/></th>
						</tr>
					</thead>
					<tbody>
						<#list messages as message>
							<tr>
								<td>${message.id}</td>
								<td>${message.title}</td>
								<td>${message.createAt?datetime}</td>
								<td>
									<#if message.responseId == 0>
										<@spring.message "message.status.noResponse"/>
									<#else>
										${message.responseId}
									</#if>
								</td>
								<td>
									<#if message.responseId == 0>
										<a class="btn" href="/admin/messageCenter/${message.id}/edit"><@spring.message "button.edit"/></a>
									</#if>
									<a class="btn" href="/admin/messageCenter/${message.id}/show"><@spring.message "button.show"/></a>
								</td>
							</tr>
						</#list>
					</tbody>
				</table>
				<div class="pagination pagination-centered">
					<ul>
						<li><a href="/admin/messageCenter/list?pageNo=0"><@spring.message "page.first"/></a></li>
						<#if pageNo != 0>
							<li><a href="/admin/messageCenter/list?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
						</#if>
						<li><a href="/admin/messageCenter/list?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>