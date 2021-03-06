<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<form action="/admin/claim/update" method="post">
				<table class="table">
					<tr>
						<td><@spring.message "claimItem.model.id"/></td>
						<td>${claim.id}
							<input type="hidden" name="id" value="${claim.id}">
						</td>
					</tr>
					<tr>
						<td>
							<#if claim.claimType == "claim">
								<@spring.message "claimItem.model.claimType.claim"/>
							<#else>
								<@spring.message "claimItem.model.claimType.return"/>
							</#if>
						</td>
						<td>${claim.claimTypeId}</td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.sellerId"/></td>
						<td>${claim.sellerId}</td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.customerId"/></td>
						<td>${claim.customerId}</td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.comment"/></td>
						<td>
							<#if claim.comment??>
								${claim.comment}
							<#else>No comment by customer</#if>
						</td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.commentByAdmin"/></td>
						<td>
							<textarea name="commentByAdmin" cols="12" class="field span12" rows="5"><#if claim.commentByAdmin??>${claim.commentByAdmin}
							<#else>No comment by Admin</#if></textarea>
						</td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.status"/></td>
						<td>
							<#if claim.claimType == "claim">
								<select name="status">
									<option value="4"><@spring.message "order.complain.status.complaining"/></option>
									<option value="2"><@spring.message "order.complain.status.uncomplain"/></option>
									<option value="3"><@spring.message "order.complain.status.ok"/></option>
								</select>
							<#else>
								<select name="status">
									<option value="4"><@spring.message "order.return.status.processing"/></option>
									<option value="2"><@spring.message "order.return.status.discard"/></option>
									<option value="3"><@spring.message "order.return.status.ok"/></option>
								</select>
							</#if>
						</td>
					</tr>
					<tr>
						<td>
							<@spring.message "admin.claim.returnMoney"/>
						</td>
						<td>
							<!--
							<select name="percent">
								<#list 0..100 as number> 
									<option value=${number}>${number}%</option>
								</#list>
							</select>
							-->
							<input name="percent"><span>%</span>
							<p>说明:输入框内只需要填数字，不要填%,只有状态选择处理完成且百分比输入正确，退款才会生效</p>
						</td>
					</tr>
					<tr>
						<td><@spring.message "menu.options"/></td>
						<td>
							<input type="submit" class="btn btn-primary" value=<@spring.message "button.update"/> />
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>
