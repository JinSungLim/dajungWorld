<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="world_main_top.jsp"%>
  <head>
    <link rel="stylesheet" href="resources/css/diary.css" />
    <script src="https://kit.fontawesome.com/8bcf872b48.js" crossorigin="anonymous"></script>
  </head>

              <div class="home_contents">
                  <div class="calendar">
                      <div class="today">03.31<br>Wed</div>
                      <div class="day_list"><span style="color:royalblue;">1</span> &nbsp;2 &nbsp;3 &nbsp;4 &nbsp;<span style="color:royalblue;">5</span> &nbsp;6 &nbsp;<span style="color:orangered;">7</span> &nbsp;8 &nbsp;9 &nbsp;10 &nbsp;11 &nbsp;12 &nbsp;13 &nbsp;<span style="color:orangered;">14</span> &nbsp;15 &nbsp;16 &nbsp;17 &nbsp;18<br>19 &nbsp;<span style="color:royalblue;">20</span> &nbsp;<span style="color:orangered;">21</span> &nbsp;23 &nbsp;24 &nbsp;25 &nbsp;26 &nbsp;27 &nbsp;<span style="color:orangered;">28</span> &nbsp;29 &nbsp;30 &nbsp;31</div>
                  </div>
                  <div class="diary">
                    <div class="diary_contents">
                        <div class="diary_date">2021.03.31 수 10:11</div>
                        <div class="diary_text">
                            오늘도 하루 잘 살았다.<br>
                            굽은 길은 굽게 가고<br>
                            곧은 길은 곧게 가고<br><br>
                            
                            막판에는 나를 싣고<br>
                            가기로 되어 있는 차가<br>
                            제시간보다 일찍 떠나는 바람에<br>
                            걷지 않아도 좋은 길을 두어 시간<br>                          
                            땀 흘리며 걷기도 했다.<br><br>
                                                        
                            그러나 그것도 나쁘지 아니했다<br>                     
                            걷지 않아도 좋은 길을 걸었으므로<br>                         
                            만나지 못했을 뻔했던 싱그러운<br>                          
                            바람도 만나고 수풀 사이<br>                        
                            빨갛게 익은 멍석딸기도 만낙<br>                       
                            해 저문 개울가 고기비늘 찍으러 온 물총새<br>                      
                            물총새, 쪽빛 날갯짓도 보았으므로.<br><br>
                                                                         
                            이제 날 저물려 한다<br>                       
                            길바닥을 떠돌던 바람은 잠잠해지고<br>                
                            새들도 머리를 숲으로 돌렸다<br>        
                            오늘도 하루 나는 이렇게<br><br>

                            잘 살았다.
                        </div>
                    </div>
                      <div class="diary_contents">
                          <div class="diary_date">2021.03.30 화 2:32</div>
                          <div class="diary_text">
                            전신이 검은 까마귀,<br>
                            까마귀는 까치와 다르다.<br><br>
                            
                            마른 가지 끝에 높이 앉아<br>
                            먼 설원을 굽어보는 저<br>
                            형형한 눈<br>
                            고독한 이마 그리고 날카로운 부리.<br><br>
                            
                            얼어붙은 지상에는<br>
                            그 어디에도 낱알 한 톨 보이지 않지만<br>
                            그대 차라리 눈발을 뒤지다 굶어 죽을지언정<br>
                            결코 까치처럼<br>
                            인가의 앞마당을 넘보진 않는다.<br><br>
                            
                            검을 테면<br>
                            철저하게 검어라. 단 한 개의 깃털도<br>
                            남기지 말고......<br>
                            겨울 되자 온 세상 수북이 눈 내려<br>
                            저마다 하얗게 하얗게 분장하지만<br>
                            나는<br>
                            빈 가지 끝에 홀로 앉아<br> 
                            말없이<br>
                            먼 지평선을 응시하는 한 마리<br>
                            검은 까마귀가 되리라.<br>
                          </div>
                      </div>
          
                    <button id="button" onclick="getTextFile()"><i class="fas fa-paw"></i> 티벳토끼의 비밀일기</button>
                    <div class="diary_contents" id="hidden">
                      <div class="diary_date">티벳토끼의 비밀일기</div>
                        <div class="diary_text">
                          <div id="secret_txt"></div>                        
                        </div>
                    </div>
                  </div>
              </div>
        <div class="menu_bar">       
            <a href="world_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button1">&nbsp;&nbsp;홈</a>
            <a href="diary_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button2">&nbsp;&nbsp;Diary</a>
            <a href="photo_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button3">&nbsp;&nbsp;사진첩</a>
            <a href="board_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button4">&nbsp;&nbsp;게시판</a>
            <a href="visit_main.do?member_num=${memId.member_num}&id=${memId.id}&main_num=${memId.main_num}" class="menu_button5">&nbsp;&nbsp;방명록</a>
          </div>
            </div>
          </div>    
        </div>
      </div>
    </div>
    <script type = "text/javascript">
      function getTextFile() {
          var input = document.createElement("input");
          input.type = "file";
          input.accept = "text/plain"
          input.onchange = function (event) {
              processFile(event.target.files[0])
          };
          input.click();
      }

      function processFile(file) {
          var reader = new FileReader();
          reader.readAsText(file, "utf-8");

          reader.onload = function () {
              document.getElementById("secret_txt").innerText = reader.result;
              document.getElementById("hidden").style.display = "block";
          };
      }
  </script>
  </body>
</html>