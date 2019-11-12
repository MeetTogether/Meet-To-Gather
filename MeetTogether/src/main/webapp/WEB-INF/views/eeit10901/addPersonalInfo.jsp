<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enter your personal information</title>

</head>
<body>
<h2>請輸入個人資訊</h2>
	<form method="post" action=""></form>
	<div align="center">


		<form method="post" action="">
			<table>
				<tr>
				<tr>
					<td>婚姻</td>
					<td><input type="radio" name="marriage" value="已婚" />已婚 <input
						type="radio" name="no" value="未婚" />未婚</td>
				</tr>

				<tr>
					<td>教育</td>
					<td><select name="education">
							<option value="國中">國中</option>
							<option value="高中">高中</option>
							<option value="大學">大學</option>
							<option value="碩士">碩士</option>
							<option value="博士">博士</option>
					</select>
				<tr>
					<td>抽菸習慣</td>
					<td><select name="smoking">
							<option value="從來不抽">從來不抽</option>
							<option value="偶爾抽菸">偶爾抽菸</option>
							<option value="老菸槍">老菸槍</option>
					</select>
				<tr>
					<td>抽菸習慣</td>
					<td><select name="drink">
							<option value="從來不喝">從來不喝</option>
							<option value="偶爾小酌">偶爾小酌</option>
							<option value="老酒鬼">老酒鬼</option>
					</select>
				<tr>
					<td>種族</td>
					<td><select name="ethnicity">
							<option value="白色人種">白色人種</option>
							<option value="黑色人種">黑色人種</option>
							<option value="黃色人種">黃色人種</option>
							<option value="棕色人種">棕色人種</option>
					</select></td>
				<tr>
					<td>身材</td>
					<td><select name="bodyType">
							<option value="中等">中等</option>
							<option value="纖細">纖細</option>
							<option value="壯碩">壯碩</option>
							<option value="臃腫">臃腫</option>

					</select>
				<tr>
					<td>宗教</td>
					<td><select name="religion">
							<option value="基督教">基督教</option>
							<option value="天主教">天主教</option>
							<option value="佛教">佛教</option>
							<option value="道教">道教</option>
							<option value="伊斯蘭教">伊斯蘭教</option>
							<option value="猶太教">猶太教</option>
							<option value="印度教">印度教</option>
							<option value="其他">其他</option>
					</select></td>
				<tr>
					<td>薪水</td>
					<td><select name="salary">
							<option value="$30,000以下">$30,000以下</option>
							<option value="$30,001~$50,000">$30,001~$50,000</option>
							<option value="$50,001~$100,000">$50,001~$100,000</option>
							<option value="$100,001~$200,000">$100,001~$200,000</option>
							<option value="$200,001以上">$200,001以上</option>
					</select>
				<tr>
					<td>興趣1</td>
					<td><select name="interest1">
							<option value="運動">運動</option>
							<option value="音樂">音樂</option>
							<option value="閱讀">閱讀</option>
							<option value="電影">電影</option>
							<option value="旅行">旅行</option>
							<option value="攝影">攝影</option>
							<option value="種植">種植</option>
							<option value="寫程式">寫程式</option>
					</select>
					<tr>
			<td>興趣2</td>
					<td><select name="interest2">
							<option value="運動">運動</option>
							<option value="音樂">音樂</option>
							<option value="閱讀">閱讀</option>
							<option value="電影">電影</option>
							<option value="旅行">旅行</option>
							<option value="攝影">攝影</option>
							<option value="種植">種植</option>
							<option value="寫程式">寫程式</option>
					</select>
					<tr>
				<td>興趣3</td>
					<td><select name="interest3">
							<option value="運動">運動</option>
							<option value="音樂">音樂</option>
							<option value="閱讀">閱讀</option>
							<option value="電影">電影</option>
							<option value="旅行">旅行</option>
							<option value="攝影">攝影</option>
							<option value="種植">種植</option>
							<option value="寫程式">寫程式</option>
					</select></table>
			<input type="submit" value="送出" /> <input type="reset" value="清除">
		</form>

	</div>

</body>
</html>