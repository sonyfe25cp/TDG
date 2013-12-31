<legend>创建支出项</legend>
<form action="/admin/finance/create" method="POST">
	<table class="table">
		<tr>
			<td></td>
			<td>
				<input type="hidden" value="${unitType}" name="unitType">
			</td>
		</tr>
		<tr>
			<td><@spring.message "financeunit.model.receiver"/></td>
			<td>
				<select name="receiverType">
					<option value="seller">Seller</option>
					<option value="customer">Customer</option>
					<option value="translator">Translator</option>
				</select>
				<input type="text" value="" name="receiverId">
			</td>
		</tr>
		<tr>
			<td><@spring.message "financeunit.model.sender"/></td>
			<td>
				Admin
				<input type="hidden" name="senderType" value="admin"></input>
				<input type="hidden" name="senderId" value="0"></input>
			</td>
		</tr>
		<tr>
			<td><@spring.message "financeunit.model.relatedId" /></td>
			<td>
				<select name="relatedType">
					<option value="order">Order</option>
					<option value="translationTask">TranslationTask</option>
					<option value="other">Other</option>
				</select>
				<input type="" name="relatedId"></input>
			</td>
		</tr>
		<tr>
			<td>金额：</td>
			<td>
				<input type="" name="money"></input>
				<p>注意：跟卖家相关的支出项将采用卖家的设定货币；跟买家和翻译人员的支出项将采用人民币</p>
			</td>
		</tr>
		<tr>
			<td><@spring.message "financeunit.model.comment"/></td>
			<td>
				<textarea name="comment" cols="4" row="3" class="field span6"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<@spring.message "menu.options"/>
			</td>
			<td>
				<input type="submit" class="btn btn-primary" value=<@spring.message "button.add"/>>
			</td>
		</tr>
			<tr>
			<td></td>
			<td>
				补充说明：本财务项的时间将设定为当前操作的时间，类型设定为手工编辑项。
			</td>
		</tr>
	</table>
</form>