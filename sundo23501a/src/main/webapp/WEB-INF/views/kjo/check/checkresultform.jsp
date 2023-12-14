<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- COMMON END -->

<script type="text/javascript">
	
</script>
</head>
<body>
<form action="/checkresultSave" method="post">
	<table>
		<tr>
			<td>시설물코드</td>
			<td>${WaterResources.facility_code}</td>
			<td>시설물</td>
			<td>${WaterResources.facility_category }</td>
			<td>유형</td>
			<td>${WaterResources.cate_name }</td>
		</tr>
		<tr>
			<td>점검일자:</td>
			<td><input type="date" name="create_datetime" id="create_datetime"></td>

			<td>기상상황:</td>
			<td><select class="form-select" id="weather" name="weather">
					<option value="맑음">맑음</option>
					<option value="흐림">흐림</option>
					<option value="비">비</option>

			</select></td>
			<td>점검자 소속:</td>
			<td><input type="text" name="department" id="department">
			</td>
			<td>직급:</td>
			<td><input type="text" name="user_position" id="user_position">
			</td>
			<td>이름:</td>
			<td><input type="text" name="user_name" id="user_name">
			</td>

		</tr>
		<tr>
			<th>점검위치</th>
			<th>점검 항목</th>
			<th>평가 점수</th>
			<th>비고</th>
		</tr>

		<tr>
			<td>마루</td>
			<td>
				<ul>
					<li>균열 및 단차</li>
					<li>수축이음부의 열림</li>
					<li>기타사항</li>
				</ul>
			</td>
			<td>
				<ul>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
				</ul>
			</td>
			<td>
				<ul>
					<li><input type="text" name="input1"></li>
					<li><input type="text" name="input2"></li>
					<li><input type="text" name="input2"></li>
				</ul>
			</td>
		</tr>

		<tr>
			<td>상류면</td>
			<td>
				<ul>
					<li>수축이음부의 열림</li>
					<li>균열</li>
					<li>박락</li>
					<li>기타사항</li>
				</ul>
			</td>
			<td>
				<ul>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
				</ul>
			</td>
			<td>
				<ul>
					<li><input type="text" name="input1"></li>
					<li><input type="text" name="input2"></li>
					<li><input type="text" name="input2"></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>하류면</td>
			<td>
				<ul>
					<li>균열 및 단차</li>
					<li>수축 및 수평시공이음부를 통한 누수</li>
					<li>균열 및 박락</li>
					<li>기타사항</li>
				</ul>
			</td>
			<td>
				<ul>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
				</ul>
			</td>
			<td>
				<ul>
					<li><input type="text" name="input1"></li>
					<li><input type="text" name="input2"></li>
					<li><input type="text" name="input3"></li>
					<li><input type="text" name="input4"></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>검사량</td>
			<td>
				<ul>
					<li>횡방향 검사량에서의 균열</li>
					<li>상류 종방향 검사량에서의 균열</li>
				</ul>
			</td>
			<td>
				<ul>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
					<li><select>
							<option value="a">a</option>
							<option value="b">b</option>
							<option value="c">c</option>
					</select></li>
				</ul>
			</td>
			<td>
				<ul>
					<li><input type="text" name="input1"></li>
					<li><input type="text" name="input2"></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>점검결과:</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>특이사항:</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>점검일지:</td>
			<td><input type="text"></td>
		</tr>
	</table>
	<input type="button" value="목록">
	<input type="button" value="삭제">
	<input type="button" value="초기화">
	<input type="submit" value="저장">
</form>
</body>
</html>