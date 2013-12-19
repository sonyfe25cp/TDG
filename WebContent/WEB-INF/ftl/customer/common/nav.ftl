<img src="http://c1.neweggimages.com.cn/NeweggPic2/Marketing/201305/lp/0523/980-02.jpg"></img>
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
	      <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-responsive-collapse">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </a>
	      <div class="nav-collapse collapse navbar-responsive-collapse">
		        <ul class="nav">
			          <li class="dropdown">
			            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">全部商品分类 <b class="caret"></b></a>
				            <ul class="dropdown-menu">
				              <li><a href="/product/category/16">服装，鞋子，包包</a></li>
				              <li><a href="/product/category/18">儿童，母婴用品和玩具</a></li>
				              <li><a href="/product/category/19">美容, 护肤, 美发</a></li>
				              <li><a href="/product/category/87">户外运动用品</a></li>
				              <li><a href="/product/category/103">食品和医药保健品</a></li>
				              <li><a href="/product/category/126">电子用品</a></li>
				              <li><a href="/product/category/129">珠宝首饰，手表和其它配饰</a></li>
				              <li><a href="/product/category/130">家庭用品，车辆用品和游戏产品</a></li>
				              <li><a href="/product/category/131">其它产品</a></li>
				            </ul>
			          </li>
		        </ul>
		        <form class="navbar-search" action="/search/byname">
		        	<#if searchWord??>
		          		<input name="name" type="text" class="search-query span7" placeholder="搜索商品名称" value="${searchWord}">
		          	<#else>
		          		<input name="name" type="text" class="search-query span7" placeholder="搜索商品名称">
		          	</#if>
		          	<input type="submit" value="搜索">
		        </form>
		        <a href="/search/adSearch" >高级搜索</a>
		        <ul class="nav pull-right">
		          <li><a href="/cart" id="showcart">去购物车结算</a></li>
		          <li class="divider-vertical"></li>
		        </ul>
      		</div><!-- /.nav-collapse -->
    	</div>
  </div><!-- /navbar-inner -->
</div>