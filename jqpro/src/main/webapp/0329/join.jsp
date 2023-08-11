<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery.serializejson.min.js"type="text/javascript"></script>
<title></title>
<script type="text/javascript">
	$(function() {
		chk = 0;
		// 데이터 유효성 체크
		// id
		$('#uid').on('keyup', function(){
			idvalue = $(this).val().trim();
			
			idreg = /^[a-zA-Z][a-zA-Z0-9]{3,14}$/;
			// [a-zA-Z] : a-z, A-Z 중에 하나 올 수 있다.(1글자)
			// [a-zA-Z0-9]{3,14} : a-z,A-Z,0-9올 수 있고 3~14글자 올 수 있다.
			/* if(!(idreg.test(idvalue))){
				//$(this).css('border', '2px solid red');
				$('#idCheck').prop('disabled', true);
			}else {
				//$(this).css('border', '1px solid lightgray');
				$('#idCheck').prop('disabled', false);
			} */
			regcheck(idreg, idvalue, this)
		})
		
		$('#uname').on('keyup', function(){
			namevalue = $(this).val().trim();
			namereg =/^[가-힣]{2,5}$/;
			regcheck(namereg, namevalue, this);
			/* if(!(namereg.test(namevalue))){
				$(this).css('border', '2px solid red');
			}else {
				$(this).css('border', '1px solid lightgray');
			} */
		})
		$('#pwd').on('keyup', function(){
			passvalue = $(this).val().trim();
			passreg=/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?]).{5,12}$/;
			regcheck(passreg, passvalue, this);
					
			/*
			// 전방탐색
			str["1000원", "2원", "원", "5000원"];
			reg=/.+(?=원)/;
			reg=/?=.*원)/ --> 3번째 값도 true 반환
			// '원'을 기준으로 전방(?=)에 모든문자(.)가 한 번 이상(+)나타나는 것을 찾아라. 
			// * 0개 이상 
			// 전방에 문자가 없어도 되지만 기준이되는 문자는 반드시 존재해야한다.
			// 실제 값을 가져와야 할 때는 match를 사용
			
			
			for(i=0;i<str.length;i++){
				bb = reg.test(str[i]);
				alert(bb);
			}*/
		})
		
		$('#umail').on('keyup', function(){
			mailvalue=$(this).val().trim();
			mailreg =/^[a-zA-Z0-9]+@[a-z][0-9a-zA-Z]+(\.[a-zA-Z]+){1,2}$/
			regcheck(mailreg, mailvalue, this);
		})
		
		$('#uhp').on('keyup', function(){
			hpvalue=$(this).val().trim();
			hpreg = /[0-9]{2,3}-[0-9]{4}-[0-9]{4}$/;
			
			regcheck(hpreg,hpvalue,this);
		})
		
		
		regcheck = function(reg, value, ele){
			if(!(reg.test(value))){
				$(ele).css('border', '2px solid red');
			} else {
				$(ele).css('border', '1px solid lightgray');
			}
		}
		
		$('#idCheck').on('click', function() {// 아이디 중복 검사
			chk=1;
			// 입력한 값을 가져온다.
			idvalue = $('#uid').val().trim();
			if (idvalue.length < 1) {
				alert("아이디를 입력하세요.");
				return false;
			}

			$.ajax({
				url : "<%=request.getContextPath()%>/idCheck.do",
				type : 'get',
				data : {
					"id" : idvalue
				}, // 객체 타입 
				success : function(res) {
					//alert(res.flag)
					$('#idspan').html(res.flag).css('color', 'red') // 글자만 출력하는 것이므로 text도 가능.
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status + "\ncode : " + xhr.statust);
				},
				dataType : 'json'
			})
		})
		// 우편번호 검색
		$('#zipsearch').on('click', function(){
			window.open("zipsearch.jsp", "우편번호찾기", "width=600 height=500");
			
		})
		
		// 우편번호 검색(modal)
		$('#zip').on('click', function(){
		dongvalue = $('#dong').val().trim();
		$.ajax({ 
			url : '<%=request.getContextPath()%>/zipSearch.do',
			data : { "dong" : dongvalue },
			type : 'post',
			dataType : 'json',
			success : function(res){
   				code ="<table>";
   				code += "<tr><td>우편번호</td><td>주소</td><td>번지</td></tr>";
				$.each(res, function(i,v){
					bunji = v.bunji;
					// undefined(타입으로 간주)와 비교
					if( typeof bunji == "undefined" ) bunji = "";
    				code += "<tr><td>"+v.zipcode+"</td><td>"+v.sido+v.gugun+v.dong+"</td>";
  					code += "<td>"+bunji+"</td></tr>";
				})
   				code += "</table>"
				$('#result1').html(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status + "\ncode : " + xhr.statust);
			}
		})
	})
	// 결과에서 한 줄을 선택하면(클릭 이벤트) - 실행중 동적으로 생성된 요소  
	$(document).on('click', '#result1 tr', function(){
		zip = $('td:eq(0)',this).text();
		addr = $('td:eq(1)',this).text();
		$('#uzip').val(zip); // 모달은 자식이 아닌 한 화면이라 opener사용x
		$('#uadd1').val(addr);
		$('#dong').val(""); // 모달창에서 검색내역 지움
		$('#result1').empty(); // $('#result1').html(""); // 검색 결과 지움. 둘다 가능.
		$('#zipModal').modal('hide');
	})
	$('#send').on('click', function(){
		// 입력한 모든 값을 가져온다. - val()
		
		/* idval = $('#uid').val().trim();
		nameval=$('#uname').val().trim();
		pwdval=$('#pwd').val().trim();
		birval=$('#ubir').val().trim();
		mailval=$('#umail').val().trim();
		zipval=$('#uzip').val().trim();
		add1val=$('#uadd1').val().trim();
		add2val=$('#uadd2').val().trim();
		hpval=$('#uhp').val().trim();
		
		fdata = {"id" : idval,  "pass" : pwdval, "name" : nameval, 
				 "bir" : birval, "zip" : zipval,
				 "add1" : add1val, "add2" : add2val, "hp" : hpval, "mail" : mailval } */
		//fdata = "id=" + idval + "&name="+nameval +"&pass=" + pwdval ... ==> 일반 문자열 형태
		// 직렬화
		fdata1=$('form').serialize();
		fdata2=$('form').serializeArray();
		fdata3=$('form').serializeJSON();
		console.log(fdata1);
		console.log(fdata2);
		console.log(fdata3);
		
		$.ajax({
			url : '<%=request.getContextPath()%>/insert.do',
			type : 'post',
			data : fdata3,
			success : function(res){
				//alert(res.flag);
				$('#joinspan').html(res.flag).css('color', 'red');
			},
			error : function(xhr){
				alert("상태 : " + xhr.status +"\ncode : " +xhr.statust );
			},
			dataType : 'json'
		}) 
		
	})
})
</script>
<style type="text/css">
#result1 tr:hover{
    background: skyblue;
}
.borderstyle{
    border : 2px solid red;
}
</style>
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form class="needs-validation" novalidate>
            <div class="form-group">
                <label for="uid">아이디</label>
                <button type="button" id="idCheck" class="btn btn-success btn-sm">중복검사</button>
                <span id="idspan"></span>
                <input type="text" class="form-control" id="uid" name="mem_id" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
                <label for="uname">이름</label>
                <input type="text" class="form-control" id="uname" name="mem_name" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="text" class="form-control" id="pwd" name="mem_pass" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
                <label for="ubir">생년월일</label>
                <input type="date" class="form-control" id="ubir" name="mem_bir" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
                <label for="umail">이메일</label>
                <input type="text" class="form-control" id="umail" name="mem_mail" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
                <label for="uhp">전화번호</label>
                <input type="text" class="form-control" id="uhp" name="mem_hp" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
                <label for="uzip">우편번호</label>
                <button type="button" id="zipsearch" class="btn btn-warning btn-sm">번호검색</button>
                <button type="button" data-toggle="modal" data-target="#zipModal" class="btn btn-warning btn-sm">번호검색modal</button>
                <input type="text" class="form-control" id="uzip" name="mem_zip" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
                <label for="uadd1">기본주소</label>
                <input type="text" class="form-control" id="uadd1" name="mem_add1" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
                <label for="uadd2">상세주소</label>
                <input type="text" class="form-control" id="uadd2" name="mem_add2" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group form-check">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="remember" required>
                    I agree on blabla.
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Check this checkbox to continue.</div>
                </label>
            </div>
            <button type="button" id="send" class="btn btn-dark btn-lg">Submit</button>
            <span id="joinspan"></span>
        </form>
    </div>
    <div class="modal" id="zipModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        우편번호찾기
        <div class="box">
            <p>찾는 동을 입력하세요</p>
            <input type="text" id="dong">
            <input type="button" value="검색" id="zip">
            <br> <br>
            <div class="result" id="result1"></div>
        </div>        
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>