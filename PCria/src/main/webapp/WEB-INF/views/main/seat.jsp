<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="allContainer">
	<h1>PCria 좌석 선택</h1>
	<div id="seatsContainer"></div>
	<div id="btnContainer">
		<button id="btnSelSeat">좌석 선택 완료</button>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	//좌석 배치용
	var alphabetArr = ['A','B','C','D','E','F','G']
    //무엇을 선택했는지 값 저장용
    var selectedSeat = true;
    var selectedSeatValue = 'empty';
	
	ajaxSelSeat(alphabetArr)
    function toggleSeat(seat,tempId){
        //기존에 선택 안 된 경우
        if(selectedSeat){
        	tempId.classList.remove('btnEmptySeats')
	        tempId.classList.add('btnSelSeats')
	        selectedSeatValue = tempId.childNodes[0].innerText
	        console.log(selectedSeatValue)
        	selectedSeat = false
        	tempId.childNodes[1].innerText = '이용중'
        //기존에 선택된 경우
        }else{ 
            tempId.classList.remove('btnSelSeats')
            tempId.classList.add('btnEmptySeats')
            tempId.childNodes[1].innerText = '이용 가능'
            selectedSeat = true
        }
    }
	function ajaxSelSeat(alphabetArr) {
		axios.get('/main/ajaxSelSeat').then(function(res) {
			let seatArr = res.data
			//좌석 만드는 함수 실행
			makeSeatBtns(alphabetArr, 8, seatArr)
		})
	}
    function algorithm(txt, tempId, className, selectedSeat) {
    	/*
    	if(구매 시간이 있으면){
    		if(자리가 있으면){
    			자리 이동
    		}else if(자리가 없으면){
    			자리 선택
    		}
    	}else{
    		구매 시간이 없는 경우 - > 좌석 선택 후 시간 예약으로 감
    	}
    	*/
    	//구매 시간 없음 -> 좌석 선택 후 시간 예약으로 감
    	//1. 자리가 비어있음 + 내가 선택한 자리가 없을 때
    	if(className == 'btnEmptySeats' && selectedSeat == true){
        	toggleSeat(txt,tempId)
        //2. 자리가 이용중 + 선택 불가능할 떄 -> 내가 선택한 자리 취소용
        }else if(className == 'btnSelSeats' && selectedSeat == false && tempId.childNodes[0].innerText == selectedSeatValue){
        	toggleSeat(txt,tempId)
        }else if(className == 'btnSelSeats'){
        	alert('이미 이용중입니다.')
        }else{
        	alert('1인당 좌석 1개만 사용가능합니다.')
        }
	}
    //좌석 만들어서 그림 그려넣기
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
                if(seatArr[j].s_occupied == 1){
                	divS_occupied.innerText = '이용중'
                	btn.classList.add('btnSelSeats')
                }else{
                	divS_occupied.innerText = '이용 가능'
                	btn.classList.add('btnEmptySeats')
                }
                btn.append(divS_occupied)
                //index 추가
                j++
                //버튼 클릭 시 이벤트
                btn.addEventListener('click',function(){
	                //현재 ID값 추출
	               	let tempId = document.getElementById(`\${this.id}`)
	                //함수 호출 : toggleSeat(색깔 추가하고 제거하는 기능)
	                algorithm(txt, tempId, this.className, selectedSeat)
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
	
</script>