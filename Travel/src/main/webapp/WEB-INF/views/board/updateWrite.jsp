<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link href="resources/bs/assets/css/boardWrite.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="resources/css/menu_bar.css">
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function updateB() {
	var bno=$("#bno").val();
	var title=$("#title").val();
	var content=CKEDITOR.instances.content.getData();
	var titleLength=title.length;
	if(!title) {
		swal("error", "제목을 입력해 주세요.", "error");
	} else if(titleLength>50) {
		swal("", "제목이 너무 깁니다.", "error");
	} 
	else if(content == ""){ 
		 swal("error", "내용을 입력해 주세요.", "error");
		 return false; 
	} 
	else {
		swal({
			 icon: "warning",
			 text: "게시글을 수정 하시겠습니까?",
			 closeOnClickOutside : false,
			 closeOnEsc : false, 
			 buttons: ["돌아가기", "수정 완료"],
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    swal('수정 완료','게시글 수정을 완료했습니다.','success').then(function(isConfirm)
			    	{
			    		$.ajax({
							type : "POST",
							url : "updateBoard",
							data : {
								"bno" : bno,
								"title" : title,
								"content" : content
						}, success : function(data) {
							location.href="view?bno="+bno+"&show=Y";
						}
					});
			    	});
			  }
			})
	}
}

//키보드로 글자수 입력 받았을 때 글자카운트 스크립트
$(document).ready(function(){
	/* 키보드 이벤트 활용 */
	$('#title').keyup(function(){
		// 남은 글자수를 구한다.
		var titleLength = $(this).val().length; //현재 글자수
		var remain = 50 - titleLength;
		
		// 문서 객체에 남은 글자수 표시
		$('#titleCount').html(remain);
		
		if(remain>=0){
		      $('#titleCount').css('color', 'green');
		}else{
		      $('#titleCount').css('color', 'red');
		}
		
		if(remain<0) {
			swal("", "제목은 50자 까지만 입력 가능합니다.", "warning");
		}
	})
})
</script>
<script src="resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/menu.jsp"%>
<title>${board.title}</title>
<style >
	#h3 ,#h5,#h6{text-align: center;	color: white;}
	#h5{margin-top: 2em;}
	#h6{font-size: 16px;}
</style>
</head>
<body>
<section class="probootstrap-cover overflow-hidden relative"
	style="background-image: url('resources/img/product/CHE20180050/CHE07.jpg'); padding: 3em;"
	data-stellar-background-ratio="0.5" id="section-home">
	<div class="overlay"></div>
	<div class="container">
		<div class="row align-items-center text-center">
			<div class="col-md">
				<h3 id="h3">"The world is a book and those who do not</h3>
				<h3 id="h3"  >travel read only one page."</h3>
				<h5 id="h5">"여행하지 않는 사람들에게는 이 세상이 한 페이지만 읽은 책과 같다."</h5>
				<h5 id="h6" >생텍쥐페리 (Antoine de Saint-Exupery) </h5>
				<form class="ml-3 my-auto w-50 d-inline-block order-1">
						<ul class="ul1" >
      <li class="li_menu"><a onclick="location.href='category?cate_id=CHE20180050'">유럽</a></li>
      <li class="li_menu"><a href="#news">아시아</a></li>
      <li class="li_menu"><a href="#contact">아프리카</a></li>
      <li class="li_menu"><a href="#about">미국</a></li>
    </ul>
				</form>
			</div>
		</div>
	</div>
</section>
<center>
	<div class="board_write">
	<div class="board">
		<img id="pencil" src="resources/bs/assets/images/write.png" width="33" height="33">
		<h2>글수정</h2>
	</div>
	<form>
	<input type="hidden" name="bno" id="bno" value="${board.bno}"/>
	<table class="editor">
		<caption></caption>
			<colgroup>
				<col style="width:17%">
				<col style="width:83%">
			</colgroup>
		
		<tr class="writer">
			<th scope="row">작성자</th>
			<td align="left" style="padding-left: 13px;">${board.writer}</td>
		</tr>
        <tr>
            <th scope="row">제목</th>
            <td><input type="text" id="title" name="title" value="${board.title}"/>
            <span id="titleCount" style="color:green;">50</span><span>/50</span>
            </td>
        </tr>			
        <tr>
            <th class="boardContent">내용</th>
            <td>
                <textarea id="content" name="content" style="width:762px; height:500px; ">${board.content}</textarea>
			<script>
				CKEDITOR.replace( 'content', {} );
			</script>
            </td>
        </tr>
	</table>
	</form>
   		<div class="write_button" style="margin-top : 10px">
			<button type="button" class="btn" id="btnWrite" onclick="updateB()">수정</button>
			<button type="button" class="btn" id="btnCancel" onclick="location.href='board'">취소</button>
		</div>
	</div>
</center>
<%@ include file="../include/csinfo.jsp" %>
</body>
</html>