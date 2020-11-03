# PCria(PC방 관리 프로그램)
1. Spring Framework 기반 프로젝트
2. PC방 좌석 배치 및 메뉴 주문, 계산 기능 등 총괄
3. Mysql로 Database 

## 개요. 
현존하는 picaplay의 기능을 구현하고자함

## 웹소켓
https://bloodfinger.tistory.com/40 <br>
https://stothey0804.github.io/project/WebSocketExam/ <br>
https://coding-start.tistory.com/27 (Javascript 버전)<br>

## 목차
1. <a>개요</a>
2. <a>주요기능</a>
3. <a>사용기술</a>
4. <a>개발진</a>
5. <a>자료보관소(바로가기)</a>

### 1.개요
* 현존하는 PC방 키오스크의 기능과 PC에서 사용하는 기능을 Spring을 활용한 웹페이지에서 구현하고자 개발
  - Spring에 익숙해지기 위함
  - 좌석 선택, 음식 구매 등 최근 많이 사용되는 기능구현
  - 관리자, 사용자 계정/기능 구분 구현(미구현)
  
### 2. 주요기능
 * 좌석 선택(시간 차감)<br>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20seat.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20seat1.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20seat2.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20seat3.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20seat4.jpg?raw=true" width="200px" height="200px"></img>
 * 금액 충전<br>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20time.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20time1.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20time2.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20time3.jpg?raw=true" width="200px" height="200px"></img>
 * 시간 충전(금액 차감)<br>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20time4.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20time5.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20time6.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20time7.jpg?raw=true" width="200px" height="200px"></img>
 * 음식 구매(시간 차감)<br>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20food.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20food1.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20food2.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20food2.jpg?raw=true" width="200px" height="200px"></img>
 * 프로필 변경<br>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20profile.jpg?raw=true" width="200px" height="200px"></img>
 <img src="https://github.com/truespring/pikaplay/blob/main/PCria/PCria%20profile1.jpg?raw=true" width="200px" height="200px"></img>

### 3. 사용기술
 - IDE<br>
  <img src="https://user-images.githubusercontent.com/39155839/96409876-f5fa3100-1220-11eb-8424-4ae63207094c.jpg" width="250px" height="180px" title="이클립스" alt="eclipse"></img>
 - Framework<br>
<img src="https://spring.io/images/OG-Spring.png" width="200px" height="200px"></img>
 - DB<br>
 <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbBLVn5%2FbtqCQ31hFxc%2FOWrBnpuGJiMMQg9JnJAz3K%2Fimg.png" width="250px" height="180px" title="MySQL" alt="MySQL"></img>
 - Server<br>
 <img src="https://user-images.githubusercontent.com/39155839/96410394-cd266b80-1221-11eb-8cc1-355ce5642ce6.png" width="250px" height="180px" title="아파치 톰켓" alt="Apache Tomcat"></img>
  - Language & Other<br>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/AJAX_logo_by_gengns.svg/1200px-AJAX_logo_by_gengns.svg.png" width="200px" height="200px"></img>
### <h2 id="4">4. 개발진</h2>
<table>
  <tr>
    <td>김도빈(zkffhtm6523@naver.com)</td>
    <td>석규환(true_spring_@naver.com)</td>
  </tr>
  <tr>
    <th><img src="https://github.com/truespring/Team_Project/blob/master/%ED%8C%80%20%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%82%AC%EC%A7%84/%EA%B9%80%EB%8F%84%EB%B9%88.jpg?raw=true" width="200px" height="150px" title="김도빈" alt="김도빈"></img></th>
    <th><img src="https://github.com/truespring/Team_Project/blob/master/%ED%8C%80%20%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%82%AC%EC%A7%84/%EC%84%9D%EA%B7%9C%ED%99%98.jpg?raw=true" width="200px" height="150px" title="석규환" alt="석규환"></img></th>
  </tr>
