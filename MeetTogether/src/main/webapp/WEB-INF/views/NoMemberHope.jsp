<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="modal fade" id="memberModalLong" tabindex="-1" role="dialog" aria-labelledby="memberModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<h5 class="modal-title" id="memberModalLongTitle" align="center">提醒</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	         </button>
	      </div>
	      <div class="modal-body" style="background-color: #e7eef1;">
	      	<h3 style="text-align: center;">尚未輸入個人喜好及希望條件</h3>
	      	<div style="text-align: center;">
				√&ensp;更容易遇到契合對象<br>
				√&ensp;有助於提升配對成功機率<br><br>
	      	</div>
			<div style="text-align: center;">
				<img src="${pageContext.request.contextPath}/eeit10936/images/love.jpeg" style="width:370px; margin:auto;">
			</div>
			<br>
			<div style="text-align: center;">
					<input type="button" value="立刻前往編輯!" class="btn py-3 px-4 btn-primary" 
							onclick="location.href='${pageContext.request.contextPath}/getmember#bookmark1';">
			</div>
	      </div>
	    </div>
	</div>
</div>