
<link href="/css/seller/help.css" rel="stylesheet">
<div class="container main">
  <!-- nav and images -->
  <#include "/seller/help/seller-help-top-nav.ftl"/>
    <div class="span10">
       <div class="businessProcess">
          <h3><@spring.message "seller.home.workflow" /></h3>
          ${businessProcess}
       </div>
    </div>
</div>
