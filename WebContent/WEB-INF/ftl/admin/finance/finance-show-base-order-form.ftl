<legend>按照订单号搜索收入支出</legend>
	<table class="table">
	<form action="/admin/finance/showbyorder">
		<tr>
			<td>账单号</td>
			<td>
				<input name="orderId"></input>
			</td>
			<td>
				<input type="submit" value="搜索"></input>
			</td>
		</tr>
	</form>
	<form action="/admin/financeRecord/showbyuserId">
		<tr>
			<td>卖家ID</td>
			<td>
				<input name="id"></input>
				<input type="hidden" name="userType" value="seller">
			</td>
			<td>
				<input type="submit" value="搜索"></input>
			</td>
		</tr>
	</form>
	<form action="/admin/financeRecord/showbyuserId">
		<tr>
			<td>翻译ID</td>
			<td>
				<input name="id"></input>
				<input type="hidden" name="userType" value="translator">
			</td>
			<td>
				<input type="submit" value="搜索"></input>
			</td>
		</tr>
	</form>
	</table>