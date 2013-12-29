<legend>
账号搜索
</legend>
<form action="/admin/accounts/searchbyuserId">
	<table class="table">
		<tr>
			<th>选择用户类型</th>
			<th>用户ID</th>
			<th></th>
		</tr>
		<tr>
			<td>
				<select name="userType">
					<option value="customers">买家</option>
					<option value="sellers">卖家</option>
				</select>
			</td>
			<td>
				<input type="text" name="userId">
			</td>
			<td>
				<input type="submit" value="搜索">
			</td>
		</tr>
	</table>
</form>