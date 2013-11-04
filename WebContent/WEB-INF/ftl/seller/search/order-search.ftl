<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<table class="table">
					<thead>
						<th><@spring.message "order.model.id"/></th>
						<th><@spring.message "order.model.name"/></th>
						<th><@spring.message "order.model.price"/></th>
						<th><@spring.message "order.model.transferPrice"/></th>
						<th><@spring.message "order.model.createAt"/></th>
						<th><@spring.message "order.model.orderStatus"/></th>
						<th><@spring.message "menu.options"/></th>
					</thead>
					<tbody>
						<#if orders?size != 0 >
							<#list orders as order>
								<tr>
									<td>
										${order.id}
									</td>
									<td>
										${order.name}
									</td>
									<td>
										${order.originPrice}
									</td>
									<td>
										${order.transferPrice}
									</td>
									<td>
										<#if order.createAt??>
										${order.createAt?datetime}
										</#if>
									</td>
									<td>
										<#include "/common/order-status.ftl"/>
									</td>
									<td>
										<a href="/seller/order/show/${order.id}" class="btn"><@spring.message "button.show"/></a>
										
										<#switch order.orderStatus>
											<#case 1>
											<#break>
											<#case 2>
												<a href="/seller/order/send/${order.id}" class="btn">send</a>
											<#break>
											<#case 3>
											<#break>
											<#case 4>
												<@spring.message "order.status.receive"/>
											<#break>
											<#case 5>
												<@spring.message "order.status.cut"/>
											<#break>
											<#case 6>
												<@spring.message "order.status.return"/>
											<#break>
											<#case 7>
												<@spring.message "order.status.error"/>
											<#break>
											<#case 8>
												<@spring.message "order.status.auto"/>
												<a href="" class="btn"><@spring.message "button.order.confirm"/></a>
											<#break>
											<#case 10>
											<#break>
										</#switch>
										
									</td>
								</tr>
							</#list>
						<#else>
							没有搜索结果
						</#if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>