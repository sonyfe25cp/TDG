<#include "/common/admin-template-head.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span6">
				<h3>说明：</h3>
				<p>本平台系统有4种用户，买东西，卖东西，管理员，翻译者。</p>
				
				<p>对于不同用户有不同的首页界面，域名对应哪个页面以及从哪个位置进入各自的首页需要明确。</p>
				<ul>
					<li><a href="/customerindex">买东西人的主页</a></li>
					<li><a href="/sellerindex">卖东西人的主页</a></li>
					<li><a href="/loginasadmin">管理员的主页</a></li>
					<li><a href="/loginastranslator">翻译人员的主页</a></li>
				</ul>
				<h3>账号</h3>
				<p>如果下面账号不能登入，请自行注册。。可能是我忘记导数据库造成的</p>
				<ul>
					<li>管理员: admin  123123</li>
					<li>卖家: seller@tdg.com  123123</li>
					<li>买家: sonyfe25cp@gmail.com  123123</li>
					<li>翻译: translator@tdg.com  123123</li>
				</ul>
				<h2>注意</h2>
				<p style="color:red">从下周更新的版本起，商品未经翻译的将在首页不予显示</p>
				<p>如果遇到购物车点开之后是错误页面，请删除本地cookie之后再重试。</p>
				<p style="color:red">优先使用<a href="http://www.google.cn/intl/zh-CN/chrome/" target="_blank">Chrome浏览器</a></p>
				<p>如果用户名密码不对，请重新注册。</p>
				<p>**目前的投诉功能仅用来模拟，详细的投诉流程下一版本更新</p>
				
				
				<h3>目前系统是固定汇率</h3>
				<ul>
				<li>1 dollar = 6.5 RMB</li>
				<li>1 pound = 9.5 RMB</li>
				<li>1 euro = 8.5 RMB</li>
				<li>1 JPY = 0.06 RMB</li>
				</ul>
				
				<h3>语言设置</h3>
				<p>默认按照浏览器语言设定，如果用户的浏览器是中午，则显示中文版本；若是英文版本，则显示英文版本；</p>
				<p>若不在上述范围，则按照下面规则：买家所有页面优先显示中文；卖家所有页面相关设定优先显示英文</p>
				
				<h3>相关交易流程</h3>
				<ul>
				<li>1. 普通订单流程：下订单->未付款订单->付款订单->订单发货->买家收货-> 订单结束</li>
				<li>2. 留货订单：系统留货->未付款订单->付款订单->订单发货->买家收货-> 订单结束</li>
				<li>3. 退货流程: 申请退货 -> 卖家确认收到退货 -> 退钱给买家</li>
				<li>4. 投诉流程: 投诉申请 -> 管理员确认投诉 -> 管理员人工处理退钱or无效投诉</li> 
				</ul>
				
				<h3>运费处理</h3>
				<p>当一份订单中有多个卖家的物品时，运费按照各个卖家的运费设定来叠加，同一个卖家的多个货物不会累计运费。</p>
				
				<h3>对照需求文档</h3>
				<ul>
					<li>1-6页已确认 -- 20130819</li>
				</ul>
				<legend>0912更新说明</legend>
				<h3>本次更新的内容</h3>
				<ul>
					<li>1.本次主要完成了翻译流程，包括产品翻译、品牌翻译</li>
					<li>2.卖家模块的上传商品完善、子产品带配图</li>
					<li>3.翻译人员的任务分配</li>
					<li>4.多语言动态切换</li>
					<li>5.用户注册后的邮箱确认，找回密码的邮箱确认功能</li>
				</ul>
				<!--
				<h3>现存在问题</h3>
				<ul>
					<li>1.由于产品页的sku展示方式变更的js还在调试，有子产品的物品暂时不能完成下单功能</li>
					<li>2.卖家修改产品功能与上架大同小异，暂未实现</li>
					<li>3.</li>
				</ul>
				<h3>接下来的工作重点</h3>
				<ul>
					<li>1.完成产品页效果展示，新的效果展示实现比较繁琐，正在实现</li>
					<li>2.卖家的订单打印功能和发货确认，正在实现</li>
					<li>3.各种退货、投诉流程，已实现但bug没解决，于下次更新上线</li>
				</ul>
				-->
			</div>
			<div class="span6">
				<legend>0927更新说明</legend>
				<h3>本次更新的内容</h3>
				<ul>
					<li>修复双变量产品无法添加到购物车的问题</li>
					<li>修复子产品添加没有时间选择框问题</li>
					<li>修复个别情况导致的不能下单</li>
				</ul>
				<legend>0926更新说明</legend>
				<h3>本次更新的内容</h3>
				<ul>
					<li>增加产品删除功能</li>
					<li>修复产品上传包装输入</li>
					<li>firefox下上传问题解决，我没有IE...</li>
				</ul>
				<legend>0925更新说明</legend>
				<h3>本次更新的内容</h3>
				<ul>
					<li>卖家在售页增加查看子产品功能</li>
				<legend>0923更新说明</legend>
				<h3>本次更新的内容</h3>
				<ul>
					<li>卖家商品上传、子产品上传功能完善</li>
					<li>买家前台页面，主要是带子产品的商品单页</li>
					<li>买家下单部分完成</li>
					<li>买家投诉订单流程(邮件发送待做)</li>
					<li>卖家发货发货单和打印功能（待完善)</li>
				</ul>
				
			</div>
		</div>
	</div>
	<#include "/common/admin-template-bottom.ftl">
</div>