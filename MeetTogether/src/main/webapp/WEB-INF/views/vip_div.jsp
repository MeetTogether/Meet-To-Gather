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
	      	<h3 style="text-align: center;">VIP專屬福利</h3>
	      	<h6 style="text-align: center; color: red;">NT$149/月</h6>
	      	<div style="text-align: center;">
				√&ensp;個人相簿空間擴大為&ensp;<span style="color: red;">5</span>張！<br>
				√&ensp;每日可配對<span style="color: red;">無限制</span><br>
				√&ensp;增加討論區文章<span style="color: red;">匯出</span>功能！<br><br>
	      	</div>
			<div style="text-align: center;">
				<img src="${pageContext.request.contextPath}/eeit10927/images/upgrade.jpg" style="width:370px; margin:auto;">
			</div>
			<br>
			<div style="text-align: center;">
				<form method="POST" action="${pageContext.request.contextPath}/VipBuy">
					<input type="hidden" name="mbId" value="${userId}" />
					<input type="submit" value="立刻升級!" class="btn py-3 px-4 btn-primary">
				</form>
			</div>
	      </div>
	    </div>
	</div>
</div>