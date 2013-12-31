<#include "/customer/common/template-head.ftl"/>
<link href="/css/customer/index.css" rel="stylesheet">
<#include "/customer/common/top-banner.ftl"/>
   <div class="container">
      <!-- nav and images -->
      <#include "/customer/common/nav.ftl"/>
      
      <form action="/search/BySellerId">
	      <table class="table">
	      	<tr>
	      		<td>按照卖家ID搜索</td>
	      		<td><input name="sellerId"></td>
	      	</tr>
	      	<tr>
	      		<td></td>
	      		<td><input type="submit" value="搜索"></td>
	      	</tr>
	      <table>
      </form>
       <form action="/search/ByProductId">
	      <table class="table">
	      	<tr>
	      		<td>按照商品ID搜索</td>
	      		<td><input name="productId"></td>
	      	</tr>
	      	<tr>
	      		<td></td>
	      		<td><input type="submit" value="搜索"></td>
	      	</tr>
	      <table>
      </form>
      <form action="/search/ByCountryId">
	      <table class="table">
	      	<tr>
	      		<td>按发货国家搜索</td>
	      		<td>
	      			<select name="countryId">
	      				<#if countries??>
	      					<#list countries as country>
	      						<option value="${country.id}">${country.nameInChinese}</option>
	      					</#list>
	      				</#if>
	      				
	      			</select>
	      		</td>
	      	</tr>
	      	<tr>
	      		<td></td>
	      		<td><input type="submit" value="搜索"></td>
	      	</tr>
	      <table>
      </form>
    </div>
<#include "/customer/common/template-bottom.ftl"/>