<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="allContainer">
	<h1>PCria 좌석 선택</h1>
	<div id="seatsContainer"></div>
	<div id="btnContainer">
		<button id="btnSelSeat" onclick="extractSeatList()">좌석 선택 완료</button>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	//좌석 배치용
	var alphabetArr = ['A','B','C','D','E','F','G']
    //내가 좌석을 체크 했는지 안 했는지.
    var selectedSeatValue = '이용 가능';
    //내가 선택한 좌석 저장 변수
	var myS_val = ''
    var myS_no = 0;
    var myS_occupied = 0
    //내가 기존에 자리가 있었는지, 신규인지 체크
	var myUpdInsChk = 0
	ajaxSelListSeat(alphabetArr)
	
    //좌석 선택 완료 버튼 클릭 시 좌석 업데이트
    function ajaxUpdSeat(s_no, s_occupied, chk) {
    	axios.post('/main/ajaxUpdSeat',{
			s_no : s_no,
			s_occupied : s_occupied,
			myUpdInsChk : chk
		}).then(function(res) {
			console.log(`res.data : \${res.data}`)
			console.log(`myUpdInsChk 전 : \${myUpdInsChk}`)
			myUpdInsChk = 1
			console.log(`myUpdInsChk 후 : \${myUpdInsChk}`)
			
			if(res.data >= 1){
				alert('좌석 선택 완료되었습니다.')
			}
		})
	}
    
	function extractSeatList() {
    	if(myS_occupied == 0){
    		alert('좌석을 선택해주세요')
    	}else{
			var seatId = document.getElementById(myS_val)
			var s_no = seatId.childNodes[2].value
			console.log(`s_no(현재 내가 선택한 좌석) : \${s_no}`)
			
			var s_occupied = seatId.childNodes[1].innerText
			console.log(`s_occupied(이용 체크) : \${s_occupied}`)
			if(seatId.childNodes[1].innerText == '이용중'){
				s_occupied = 1
			}else{
				s_occupied = 0
			}
			ajaxUpdSeat(s_no, s_occupied, myUpdInsChk)
    	}
	}
	
	
	
    function changeColorSeat(s_val, clickId, clickClassName){
        if(clickClassName == 'btnSelSeats'){
        	if(s_val == myS_val){
        		if(confirm('선택한 좌석을 취소하시겠습니까')){
        			clickId.classList.remove('btnSelSeats')
                    clickId.classList.add('btnEmptySeats')
                    clickId.childNodes[1].innerText = '이용 가능'
                    myS_val = ''
                    myS_occupied = 0
                    myS_no = 0
        		}
        	}else{
        		alert('이미 사용중인 좌석입니다.')
        	}
        }else{
        	if(myS_occupied == 1){
        		//이전 선택된 자리 지우기
        		if(confirm('자리를 이동하시겠습니까?')){
	        		var prevSelId = document.getElementById(myS_val)
	        		prevSelId.classList.remove('btnSelSeats')
	        		prevSelId.classList.add('btnEmptySeats')
	        		prevSelId.childNodes[1].innerText = '이용 가능'
	        		
	        		clickId.classList.remove('btnEmptySeats')
	        		clickId.classList.add('btnSelSeats')
	        		clickId.childNodes[1].innerText = '이용중'
	        		myS_val = s_val
	        		myS_no = clickId.childNodes[2].value
	        		myS_occupied = 1;
        		}
        	}else{
        		clickId.classList.remove('btnEmptySeats')
        		clickId.classList.add('btnSelSeats')
        		clickId.childNodes[1].innerText = '이용중'
        		myS_val = s_val
        		myS_no = clickId.childNodes[2].value
        		myS_occupied = 1;
        	}
        }
    }
    
    //좌석 만들어서 그림 그려넣기(완료)
    function makeSeatBtns(arr, colCnt, seatArr){
        var divParent = document.createElement('div')
		let j = 0;
        arr.forEach(function(item){
            var divChild = document.createElement('div')
            for(var i = 0; i < colCnt; i++){
                //var로 하면 문제터짐. for문 끝나도 살아있음. for문의 마지막 값이 있음
                let txt = `\${item}\${i+1}`
                //버튼 생성 및 속성 추가
                var btn = document.createElement('button')
                btn.setAttribute('id',`\${item}\${i+1}`)
                //버튼 내부 s_val 텍스트 추가
                var divS_val = document.createElement('div')
                divS_val.innerText = txt
                btn.append(divS_val)
                //좌석 사용 여부 체크
                var divS_occupied = document.createElement('div')
                var s_occupied = seatArr[j].s_occupied
                if(s_occupied == 1){
                	divS_occupied.innerText = '이용중'
                	btn.classList.add('btnSelSeats')
                }else{
                	divS_occupied.innerText = '이용 가능'
                	btn.classList.add('btnEmptySeats')
                }
                btn.append(divS_occupied)
                //s_no를 input hidden에 추가
                var divS_no = document.createElement('input')
				divS_no.value = seatArr[j].s_no
				divS_no.type = 'hidden'
				btn.append(divS_no)
                //index 추가(이용중/이용가능, 좌석seq 주는 인덱스)
                j++
                
                //버튼 클릭 시 이벤트
                btn.addEventListener('click',function(){
	                //현재 ID값 추출
	               	let clickId = document.getElementById(`\${this.id}`)
	                changeColorSeat(txt, clickId, this.className)
                })
                divChild.appendChild(btn)
                if((i+1) % 2 == 0){
                    var sp = document.createElement('span')
                    divChild.appendChild(sp)
                }
            }
            divParent.appendChild(divChild)
            seatsContainer.appendChild(divParent)
        })
    }

    
    //시작 시 전체 PC방 좌석 출력(완료)
	function ajaxSelListSeat(alphabetArr) {
		axios.get('/main/ajaxSelSeat').then(function(res) {
			console.log(res)
			//DB에 내가 사용하고 있는 정보 가져오기
			myS_val = res.data.myS_val
		    myS_no = res.data.myS_no
		    myS_occupied = res.data.myS_occupied
		    myUpdInsChk = res.data.myS_occupied
		    //DB에 전체 좌석 현황 가져오기
			let seatArr = res.data.ajaxSelSeat
			//좌석 만드는 함수 실행
			makeSeatBtns(alphabetArr, 8, seatArr)
		})
	}
	
</script>