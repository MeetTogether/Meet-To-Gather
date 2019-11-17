<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="modal fade" id="vipModalLong" tabindex="-1" role="dialog" aria-labelledby="vipModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<h5 class="modal-title" id="vipModalLongTitle" align="center">升級為VIP會員</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	         </button>
	      </div>
	      <div class="modal-body" style="background-color: #e7eef1;">
			Upgrade 1: 個人相簿空間擴大為5張！<br>
			Upgrade 2: 每日新增好友數20名！<br>
			Upgrade 3: 新增討論區文章匯出功能！<br><br>
			<img src="${pageContext.request.contextPath}/eeit10927/images/upgrade.jpg" style="width:370px; margin:auto;">
			<br><br>
			<form method="POST" action="./VipBuy">
				<input type="hidden" name="mbId" value="${userId}" />
				<input type="submit" value="前往付款" class="reply">
			</form>
	      </div>
	    </div>
	</div>
</div>