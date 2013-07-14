<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<a href="/seller/messageCenter/new" class="btn btn-info"><@spring.message "button.newMessage"/></a>
				<table class="table">
					<thead>
						<tr>
							<th><@spring.message "message.model.id"/></th>
							<th><@spring.message "message.model.title"/></th>
							<th><@spring.message "message.model.content"/></th>
							<th><@spring.message "message.model.createAt"/></th>
							<th><@spring.message "message.model.responseId"/></th>
						</tr>
					</thead>
					<tbody>
						<#list messages as message>
							<tr>
								<td>${message.id}</td>
								<td>${message.title}</td>
								<td>${message.content}</td>
								<td>${message.createAt}</td>
								<td>${message.responseId}</td>
							</tr>
						</#list>
					</tbody>
				</table>
				<div class="pagination pagination-centered">
					<ul>
						<li><a href="/seller/messageCenter/list?pageNo=0"><@spring.message "page.first"/></a></li>
						<#if pageNo != 0>
							<li><a href="/seller/messageCenter/list?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
						</#if>
						<li><a href="/seller/messageCenter/list?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>