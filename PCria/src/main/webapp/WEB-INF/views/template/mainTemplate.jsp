<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PCria</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/res/css/mainTemplate.css" rel="stylesheet" type="text/css" media="all" />
<link href="/res/css/mainTemplateFonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="/res/css/seatTemplate.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
 .lbl:nth-child(2){margin-left: 10px;}
 #seatsContainer{margin-top: 10px;}
 button{margin: 3px; background-color: purple; color: white;padding: 10px
     ;border: 0px; width: 50px;}
 /* button:not(:last-child){
     background-color: black;
 } */
 button:hover{background-color:darkgoldenrod }
 span{margin-right: 10px;}
</style>
</head>
<body>
<div id="container">
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="/main/seat">🎮🕹PCria</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="#" accesskey="1" title="">좌석 예약</a></li>
				<li><a href="#" accesskey="2" title="">시간 예약</a></li>
				<li><a href="#" accesskey="3" title="">메뉴 예약</a></li>
				<li><a href="#" accesskey="4" title="">내 정보</a></li>
				<li><a href="#" accesskey="5" title="">프로필</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="section">
	<div id="allContainer">
		<input type="hidden" id="allSeatCnt">
	    <div id="memberContainer"></div>
	    <div id="seatsContainer"></div>
    </div>
    <script>
        //무엇을 선택했는지 값 저장용
        var selectedSeats = []

        function toggleSeat(seat,tempId){
            var idx = selectedSeats.indexOf(seat) //없으면 -1리턴
            var arrLength = parseInt(sel_adult_member_cnt.value)+parseInt(sel_teen_member_cnt.value)
            if(idx == -1){ //기존에 선택이 안 되어 있었다.
                if(arrLength != 0){
                    if(selectedSeats.length >= arrLength){
                        alert('가득찼음')
                    }else{
                        // btn.classList.add('selected')
                        selectedSeats.push(seat) //배열에 추가
                        tempId.style.backgroundColor = 'green'
                    }
                }else{
                    alert('0명 선택되었음~')
                }
            }else{ //기존에 선택이 되어 있었다.
                // btn.classList.remove('selected')
                selectedSeats.splice(idx, 1)
                tempId.style.backgroundColor = 'purple'
            }
            console.log(selectedSeats)
        }

        //목록 선택하면 이 함수가 호출되도록
        function updSeatCnt(){
            allSeatCnt.value = parseInt(sel_adult_member_cnt.value) + parseInt(sel_teen_member_cnt.value)
        }

        //선택 상자 만들기
        function makeSelect(_title, _selectId){
            var label_adult = document.createElement('label')
            label_adult.setAttribute('class','lbl')
            var span_adult = document.createElement('span')
            span_adult.innerHTML = `${_title} : `
            var select_adult = document.createElement('select')
            select_adult.id = _selectId
            // select_adult.setAttribute('onchange','updSeatCnt()')
            //hidden에 합산 값 추가
            select_adult.addEventListener('change',updSeatCnt)
            for(var i = 0; i<=5; i++){
                var opt = document.createElement('option')
                opt.value = i
                opt.innerHTML = i
                select_adult.appendChild(opt)
            }
            //태그 안에 자식에 붙인다
            label_adult.appendChild(span_adult)
            label_adult.appendChild(select_adult)

            return label_adult
        }

        //좌석 만들어서 그림 그려넣기
        function makeSeatBtns(arr, colCnt){
            var divParent = document.createElement('div')

            arr.forEach(function(item){
                var divChild = document.createElement('div')
                for(var i=1;i<=colCnt; i++){
                    //var로 하면 문제터짐. for문 끝나도 살아있음. for문의 마지막 값이 있음
                    let txt = `${item}${i}`
                    
                    var btn = document.createElement('button')
                    btn.setAttribute('class','btn')
                    btn.setAttribute('id',`${item}${i}`)
                    btn.addEventListener('click',function(){
                        let tempId = document.getElementById(`\${this.id}`)
                        //toggleSeat 매개변수가 없을 때는 익명함수 안쓰고 함수명만
                        //매개변수가 있을 때는 이 방식으로 사용해야함.
                        toggleSeat(txt,tempId)
                        
                    })
                    btn.innerText = txt
                    divChild.appendChild(btn)
                    if(i % 3 == 0){
                        var sp = document.createElement('span')
                        divChild.appendChild(sp)
                    }
                }
                divParent.appendChild(divChild)
            })
            return divParent
        }

        function init(){
            var select_adult = makeSelect('성인','sel_adult_member_cnt')
            var select_teen = makeSelect('청소년','sel_teen_member_cnt')
            memberContainer.appendChild(select_adult)
            memberContainer.appendChild(select_teen)

            var arr = ['A','B','C','D','E','F','G']
            var seat_btns = makeSeatBtns(arr,12)
            seatsContainer.appendChild(seat_btns)
        }
        init()
    </script>
</div>
<div id="footer-wrapper">
	<div id="copyright" class="container">
	<p>© 2020 PCria Co., Ltd. All rights reserved.</p>
</div>
</div>
</div>
</body>
</html>
