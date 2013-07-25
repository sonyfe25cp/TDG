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
        <strong><@spring.message "help.model.cashAfterDelivery"/></strong>
     </h3>
     <div class="help-box">
        <div class=help-zybox>
           <div class="help-content">
              ${cashAfterDelivery}
           </div>
        </div>
     </div>
  </div>
</div>
