/**
 * 함수 정의 방법
 * 1. $.listPageServer = function(){}
 * 2. listPageServer = function(){}
 * 3. function listPageServer(){}   
 */
$.hitUpdateServer = function(target){ // target : 내가 누른 제목
	$.ajax({
		url : `${mypath}/hitUpdate.do`,
		data : {"num" : vidx},
		type : 'get',
		success : function(res){
			//alert(res.flag)
			// 화면수정
			if(res.flag == "ok"){
				vhit = $(target).parents('.card').find('#hit')
				hitp = parseInt($(vhit).text())+1; // getter
				$(vhit).text(hitp); // setter
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status + "\ncode : " + xhr.statust);
		}, 
		dataType : 'json'
	})
}

$.boardUpdatServer = function(){
	$.ajax({
		url : `${mypath}/boardUpdate.do`,
		type : 'post',
		data : fdata,
		dataType : 'json',
		success : function(res){
			vparents = $(vmodify).parents('.card');
			$(vparents).find('a').text(vms);
			$(vparents).find('#em').text(vmm);
			$(vparents).find('.wp3').html(vmc);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status + "\ncode : " + xhr.statust)
		}
		
	})
	
	
}
$.boardDeleteServer = function(){
	$.ajax({
		url : `${mypath}/boardDelete.do`,
		type : 'get',
		data : {"num" : vidx},
		success : function(res){
			$.listPageServer(1);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status + "\ncode : " + xhr.statust);
		},
		dataType : 'json'
	})
}

$.replyUpdateServer = function(){
	$.ajax({
		url : `${mypath}/replyUpdate.do`,
		type : 'post',
		data : reply, // reply객체 - cont, renum 
		success : function(res){
			if(res.flag =="ok"){
				$(vp3).html(modiout);
			}
		}, 
		error : function(xhr){
			alert("상태 : " + xhr.status + "\ncode : " + xhr.statust);
		},
		dataType : 'json'
	})
}

$.deleteReplyServer = function(target){ // target : 클릭한 댓글 삭제 버튼
	$.ajax({
		url : `${mypath}/replyDelete.do`, 
		type : 'get',
		data : { "renum" : vidx},
		success : function(res){
			if(res.flag =="ok"){
				$(target).parents('.reply-body').remove();
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status + "\ncode : " + xhr.statust);
		},
		dataType : 'json'
	})
}


$.replyListServer = function(target){ // 매개변수 이름 상관없음. target : 클릭한 등록버튼 / 또는 클릭한 제목
	$.ajax({ 
		url : `${mypath}/replyList.do`,
		type : 'get',
		data : { "bonum" : vidx }, //"bonum" : reply.bonum 도 가능
		success : function(res){
			// target : 클릭한 등록 버튼을 기준으로 출력
			rcode="";
			$.each(res, function(i, v){
				content = v.cont;
				content = content.replaceAll(/\n/g, "<br>");
				rcode +=`<div class="reply-body">
			            <p class="p1">
			                작성자 : <span id="rwr">${v.name}</span>&nbsp;&nbsp;&nbsp; 
			                날짜 : <span id="rda">${v.redate}</span>&nbsp;&nbsp;&nbsp; 
			            </p>
			            <p class="p2">
			                <input type="button" idx="${v.renum}" name="r_delete" class="action" value="댓글 삭제">
			                <input type="button" idx="${v.renum}" name="r_modify" class="action" value="댓글 수정">
			            </p>
			            <p class="p3">
			                ${content}
			            </p>
			        </div>`
			}) // $.each END
			// 출력
			$(target).parents('.card').find('.reply-body').remove(); 
			$(target).parents('.card').find('.card-body').append(rcode);
		
		}, // success END
		error : function(xhr){
			alert("상태 : " + xhr.status + "\ncode : " + xhr.statust)
		},
		dataType : 'json' 
	}) //$.replyListServer END
	
}

$.replyWriteServer= function(re){
	$.ajax({
		url : `${mypath}/replyWrite.do`,
		type : 'post',
		data : reply, // count, bonum, name,
		success : function(res){
			// 저장 성공
			alert(res.flag)
			if(res.flag == "ok"){
			// 댓글 내용을 출력 - 등록버튼(re)을 기준으로 출력
			//$(re)
			$.replyListServer(re);				
			}
		}, 
		error : function(xhr){
			alert("상태 : " + xhr.status + "\ncode : " + xhr.statust)
		},
		dataType : 'json'
	})
};


$.boardWriteServer = function(){
	$.ajax({
		url : `${mypath}/boardWrite.do`,
		type : 'post',
		data : fdata,
		success : function(res){
			//alert(res.flag);
			if(res.flag =="ok"){
				$.listPageServer(1);
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status + "\ncode : " + xhr.statust)
		},
		dataType : 'json'
	})
}


$.listPageServer = function(currentPage){
	vtype =$('#stype option:selected').val().trim();
	vword =$('#sword').val().trim();
	
	$.ajax({
		url : `${mypath}/boardList.do`,
		type : 'post',
		data : {"page" : currentPage, "stype" : vtype, "sword" : vword },
		success : function(res){
			code = `<div class="container mt-3">
					<h2>Accordion 게시판</h2>
					<div id="accordion">`;
			
			$.each(res.datas,function(i,v){
					content = v.content;
					content = content.replaceAll(/\n/g,"<br>");
					//.replaceAll(/\r/g,""); //g 정규식 대신 "\n" 도 가능
					// 삭제 수정 등록에서 idx는 내가 임의로 준 속성
				code +=`<div class="card">
			      <div class="card-header">
			        <a class="btn action" idx="${v.num}" name="list" data-bs-toggle="collapse" href="#collapse${v.num}">
			         	${v.subject}
			        </a>
			      </div>
			      <div id="collapse${v.num}" class="collapse" data-bs-parent="#accordion">
			        <div class="card-body">
			            <p class="p1">
			                작성자 : <span id="wr">${v.writer}</span>&nbsp;&nbsp;&nbsp; 
			                이메일 : <span id="em">${v.mail}</span>&nbsp;&nbsp;&nbsp; 
			                날짜 : <span id="da">${v.wdate}</span>&nbsp;&nbsp;&nbsp; 
			                조회수 : <span id="hit">${v.hit}</span>&nbsp;&nbsp;&nbsp;
			            </p>
			            <p class="p2">
			            
			                <input type="button" idx="${v.num}" name="delete" class="action" value="삭제">
			                <input type="button" idx="${v.num}" name="modify" class="action" value="수정">
			            </p>
			            <p class="p3 wp3">
			                ${content}
			            </p>
			            <p class="p4">
			                <textarea rows="" cols="50"></textarea>
			                <input type="button" idx="${v.num}" name="reply" class="action" value="등록">
			            </p>
			        </div>
			      </div>
			    </div>`
			}) // 반복문($.each) 끝 
			code +=`</div>
				</div>`
			// 리스트 출력	
			$('#result').html(code);
				
			// 페이지 처리
			// 이전
			pager="";
			pager +=`<ul class="pagination">`;
			if(res.startPage >1){
				pager +=`<li class="page-item"><a id="prev" class="page-link" href="#">Previous</a></li>`;
			}
			// 페이지 번호
			for(i=res.startPage ; i<=res.endPage; i++){
				if(i == currentPage){
					pager +=`<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`;
				} else {
					pager +=`<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`;
				}
			}
			// 다음
			if(res.endPage < res.totalPage){
				pager +=`<li class="page-item"><a id="next" class="page-link" href="#">Next</a></li>`;
			}
			pager +=`</ul>`;
			$('#pagelist').html(pager);
			
		}, 
		error : function(xhr){
			alert("상태 : " + xhr.status + "\ncode : " + xhr.statust)
		},
		dataType : 'json'
	})
}
