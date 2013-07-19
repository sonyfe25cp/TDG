<#include "/customer/common/template-head.ftl"/>
<link href="/css/customer/index.css" rel="stylesheet">
<link href="/css/customer/help.css" rel="stylesheet">
<#include "/customer/common/top-banner.ftl"/>
<div class="container">
  <!-- nav and images -->
  <#include "/customer/common/nav.ftl"/>
  <#include "/customer/help/help-left.ftl">
  <div class="help-right">
     <h3 class="helt-tit">
        <strong>购物流程</strong>
     </h3>
     <div class="help-box">
        <div class=help-zybox>
           <div class="tit">在我们商城购买商品的一般流程如下：
           </div>
           <div class="help-content">
              <p>
                   ${shoppingProcess}
              </p>
           </div>
        </div>
     </div>
  </div>
</div>
