<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/board.js" type="text/javascript"></script>
<script src="../js/jquery.serializejson.min.js" type="text/javascript"></script>
<style type="text/css">
* {
	box-sizing: border-box;
}

p {
	/* border : 1px solid lightgray;*/
	margin: 1px;
	padding: 3px;
	height: auto;
}

.p1 {
	float: left;
	width: 70%;
}

.p2 {
	float: right;
	width: 28%;
}

.p3 {
	clear: both;
}

input[name=reply] {
	height: 50px;
	vertical-align: top;
}

#pagelist {
	margin-left: 43%;
}
nav a{
     /*  display : none; /*영역을 갖고 있지 않는 것*/
   visibility : hidden; /*영역을 갖고 있는 것*/
}
#stype{
    width : 100px;
}
#sword{
    width : 200px;
}
label {
    display : inline-block;
    width : 80px;
    height : 30px;
}
.reply-body{
    border : 1px solid gold;
    background : #f6eac2;
    margin : 1px;
    padding : 5px;
}
#modifyform {
    display : none;
}

</style>
<script type="text/javascript">

currentPage = 1; // 현재 페이지 지정한 변수
mypath ='<%=request.getContextPath()%>'
reply = { } // 빈 객체를 선언. 동적으로 속성 또는 기능을 추가 가능 ex)reply.name = "ㅇㅇㅇ" 식으로 추가 가능
	$(function() {
		$.listPageServer(currentPage);
		// 이벤트

		// 페이지 번호 클릭
		$(document).on('click', '.pageno', function() {
			if($('#modifyform').css('display') != 'none'){
				//보임. => 열려 있는 상태
				replyReset()
			}
			currentPage = $(this).text().trim();
			$.listPageServer(currentPage);
		})
		// 다음 클릭
		$(document).on('click', '#next', function() {
			if($('#modifyform').css('display') != 'none'){
				//보임. => 열려 있는 상태
				replyReset()
			}
			currentPage = parseInt($('.pageno').last().text().trim()) + 1;
			$.listPageServer(currentPage);
		})
		// 이전 클릭
		$(document).on('click', '#prev', function() {
			if($('#modifyform').css('display') != 'none'){
				//보임. => 열려 있는 상태
				replyReset()
			}
			currentPage = parseInt($('.pageno').first().text().trim()) - 1; // 뺄셈에서는 parseInt안해도 가능
			$.listPageServer(currentPage);
		})
		// 검색 search
		$('#search').on('click', function(){
			if($('#modifyform').css('display') != 'none'){
				//보임. => 열려 있는 상태
				replyReset()
			}
			$.listPageServer(1);
		})
		
		// 글쓰기 - 방법1) data-bs-toggle="modal" data-bs-target="wModal" (버튼 설정)
		/*			방법2) $('#write').on('click', function(){
								$('#wModal').modal('show');				  (이벤트 설정)
		}) */
		// 글쓰기 모달창에서 send전송 버튼 클릭
		$('#send').on('click', function(){
			// 입력한 모든 값을 가져온다
			fdata = $('#wform').serializeJSON();
			
			// 입력값 지우기
			$('#wform .txt').val("");
			$('#wModal').modal('hide');
			
			// 서버로 전송하기
			$.boardWriteServer(fdata);
		})
		
		// 수정 삭제 등록 댓글수정 댓글삭제 --- 이벤트
		$(document).on('click', '.action', function(){
			
			vaction = $(this).attr('name');
			vidx = $(this).attr('idx');
			if(vaction == "modify"){
				//alert(vidx +"번 글을 수정")
				
				vmodify = this; // 수정버튼 this를 전역변수에 담음.
				// 수정할 본문의 내용을 가져온다.
				vparents = $(this).parents('.card');
				vtitle = $(vparents).find('a').text().trim(); //vparents로 써도 됨
				vname = $(vparents).find('#wr').text().trim();
				vmail = $(vparents).find('#em').text().trim();
				vp3 = $(vparents).find('.p3').html().trim(); // $(vparents).find('.p3')는 글과 댓글에 2개 존재. 이 때 html()은 이름 같은 내용 중 첫번째 내용을 가져옴
				cont = vp3.replace(/<br>/g,"\n");
				
				// modal 창에 출력한다.
				$('#mform #writer').val(vname);
				$('#mform #subject').val(vtitle);
				$('#mform #mail').val(vmail);
				$('#mform #content').val(cont);
				$('#mform #num').val(vidx);
				
				// modal 창 띄우기
				$('#mModal').modal('show');
				
				$('#mform #writer').prop('disabled', true);
				
				
			} else if(vaction == "delete"){
				//aldrt(vidx +"번 글을 삭제")
				$.boardDeleteServer();
				
			}  else if(vaction == "list"){
				//alert(vidx + "번 게시판글과 댓글을 모두 보기")
				$.replyListServer(this);
				
				// 조회수 증가
				vshow = $(this).attr('aria-expanded');
				//alert(vshow);
				if(vshow =="true"){
					//alert("조회수 증가");
					$.hitUpdateServer(this);
				} else {
					//alert("조회수 증가 안함")
				}
				
			} else if(vaction == "reply"){
				//alert(vidx + "번글에 댓글 등록")
				
				cont = $(this).prev().val() // getter : ()안에 아무것도 없음
				name1 = String.fromCharCode(parseInt(Math.random()*26+65)); // 아스키 코드로 A~Z
				name2 = String.fromCharCode(parseInt(Math.random()*26+97)); // 아스키 코드로 a~z
				name3 = parseInt(Math.random()*100 +1 );
				
				reply.name = name1 + name2 + name3;
				reply.cont = cont;
				reply.bonum = vidx;
				
				$(this).prev().val(""); // setter : () 안의 내용을 ""으로 변경
				// 서버로 전송
				$.replyWriteServer(this); // 등록버튼
				
				// 댓글 리스트 출력 
				// 서버에 전송된 상태에서 출력해야하는데 비동기이므로 저장되지 않은 상태의 리스트가 출력될 수 도 있다
				// 틀린 방법) $.replyListServer()
				
			} else if(vaction == "r_modify"){
				//alert(vidx +"번 댓글을 수정")
				
				// modifyform이 열려 있는지 비교
				if($('#modifyform').css('display') != 'none'){
					//보임. => 열려 있는 상태
					replyReset()
				} // 안보임. => 안열려 있는 상태
				// 수정할 내용(원래 내용)을 가져온다
				modifycont = $(this).parents('.reply-body').find('.p3').html().trim();

				// 원래 내용의 <br>태그를 \n으로 변경 - modifyform(수정폼)에 출력
				mcont = modifycont.replace(/<br>/g, "\n")
				$('#modifyform textarea').val(mcont);
				
				// 수정폼을 p3으로 이동
				$(this).parents('.reply-body').find('.p3').empty().append($('#modifyform'));
				
				// 수정폼을 보이기
				$('#modifyform').show();
				
			} else if(vaction == "r_delete"){
				//alert(vidx + "번 댓글을 삭제")
				$.deleteReplyServer(this);
			}
		})// 이벤트
		
		replyReset = function(){
			//p3을 찾는다
			vp3 = $('#modifyform').parent();
			// 수정 폼을 body로 이동 - 안보이게 설정
			$('body').append($('#modifyform'));
			$('#modifyform').hide(); // $('#modifyform').css('display', 'none'); 도 같은 방법
			// 원래 내용을 p3으로 다시 출력
			$(vp3).html(modifycont);
		}
		
		// 댓글 수정창에서 확인버튼
		$('#btnok').on('click', function(){
			// 입력한 내용을 가져온다 - 엔터기호(\n) 포함
			modicont = $('#modifyform textarea').val();
			
			// 엔터기호를 <br>태그로 변경
			modiout = modicont.replace(/\n/g,"<br>");
			
			// p3을 찾는다.
			//vp3 = $(this).parents($('.p3')); // 확인버튼을 기준으로 찾음; this : 댓글 수정 폼 중 확인 버튼
			// 게시판 내용에도 p3이 존재해서 불가.
			vp3 = $('#modifyform').parent(); // 댓글 수정폼을 기준으로 찾음;
			
			// modifyform을 body로 이동 - 안보이도록 설정
			$('#modifyform').appendTo($('body'));
			$('#modifyform').hide();
			
			// p3에 입력한 내용(<br>태그로 변경)을 출력한다. - DB 수정후에 실행
	
			reply.cont = modicont; // list 출력할 때 <br>로 바꿨으므로 <br>로 바꾼거 이전걸로 넣어주기
			reply.renum = vidx;
			$.replyUpdateServer();
			
		})
		
		// 댓글 수정창에서 취소버튼
		$('#btnreset').on('click', function(){
			replyReset();
		})
		
		// 글수정 modal창에서 전송버튼 클릭
		$('#msend').on('click', function(){
			fdata = $('#mform').serializeJSON();
			//console.log(fdata);
			// 서버로 보내기
			$.boardUpdatServer();
			
			// db에서 수정 성공 후 수정한 내용으로 화면(본문의 내용)바꾸기 
			// 비동기는 서버의 응답없이 수행될 수 있기 때문에 비동기 방법으로는 여기서 수정 하면 안됨 
			//--> boardUpdateServer에서 성공하면 실행
			
			// modal창에 수정한 내용을 가져온다. 
			vmw = $('#mform #writer').val();
			vms = $('#mform #subject').val();
			vmm = $('#mform #mail').val();
			vmc = $('#mform #content').val();
			
			vmc=vmc.replaceAll(/\n/g, "<br>");
			
			$('#mModal').modal('hide');
			
			// 화면(본문의 내용) 바꾸기  -> js에서 성공이면 실행
			/* vparents = $(vmodify).parents('.card');
			$(vparents).find('a').text(vms);
			$(vparents).find('#em').text(vmm);
			$(vparents).find('.wp3').html(vmc); */
		})
		
		
	})// $function
</script>
</head>
<body>
    <div id="modifyform">
        <textarea rows="5" cols="50"></textarea>
        <input type="button" value="확인" id="btnok">
        <input type="button" value="취소" id="btnreset">
    </div>

    
    <br>
    <br>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
        <input type="button" value="글쓰기" id="write" data-bs-toggle="modal" data-bs-target="#wModal">
            <!-- <a class="navbar-brand" href="javascript:void(0)">Logo</a> -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="javascript:void(0)">Link</a></li>
                    <li class="nav-item"><a class="nav-link" href="javascript:void(0)">Link</a></li>
                </ul>
                <form class="d-flex">
                    <select class="form-select" id="stype">
                      <option value="">전체</option>
                      <option value="writer">이름</option>
                      <option value="subject">제목</option>
                      <option value="content">내용</option>
                    </select>
                    <input class="form-control me-2" type="text" id="sword" placeholder="Search">
                    <button id="search" class="btn btn-primary" type="button">Search</button>
                </form>
            </div>
        </div>
    </nav>
    <div id="result"></div>
    <br>
    <hr>
    <br>
    <div id="pagelist"></div>
    <!-- 글쓰기 The Modal -->
    <div class="modal" id="wModal">
      <div class="modal-dialog">
        <div class="modal-content">
    
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">글쓰기</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
    
          <!-- Modal body -->
          <div class="modal-body">
            <form name="wform" id="wform" action="">
                <label>이름</label><input type="text" class="txt" name="writer"><br>           
                <label>제목</label><input type="text" class="txt" name="subject"><br>           
                <label>메일</label><input type="text" class="txt" name="mail"><br>           
                <label>비밀번호</label><input type="password" class="txt" name="password"><br>           
                <label>내용</label><br>
                <textarea name="content" class="txt" rows="5" cols="40" name="content"></textarea>   
                <br><br>
                <input type="button" value="전송" id="send">       
            </form>
          </div>
    
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
          </div>
    
        </div>
      </div>
    </div>
    
    <!-- 글수정 The Modal -->
    <div class="modal" id="mModal">
      <div class="modal-dialog">
        <div class="modal-content">
    
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">글 수정</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
    
          <!-- Modal body -->
          <div class="modal-body">
            <form name="mform" id="mform" action="">
                <input type="hidden" id="num" name="num">
                <label>이름</label><input type="text" class="txt" id="writer" name="writer"><br>           
                <label>제목</label><input type="text" class="txt" id="subject" name="subject"><br>           
                <label>메일</label><input type="text" class="txt" id="mail" name="mail"><br>           
                <label>비밀번호</label><input type="password" class="txt" id="password" name="password"><br>           
                <label>내용</label><br>
                <textarea name="content" class="txt" id="content"  rows="5" cols="40"></textarea>   
                <br><br>
                <input type="button" value="전송" id="msend">       
            </form>
          </div>
    
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
          </div>
    
        </div>
      </div>
    </div>
</body>
</html>