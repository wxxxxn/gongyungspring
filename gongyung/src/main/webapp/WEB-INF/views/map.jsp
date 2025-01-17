<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>test</title>
    <link rel="stylesheet" href="./resources/css/mapstyle.css"/>

    <script src="./resources/js/selectlocation.js"></script>
    <script src="./resources/js/gps.js"></script>
    <script src="./resources/js/chart.js"></script>
    <script src="./resources/js/sky.js"></script>
    <script src="./resources/js/sidebar.js"></script>
    <script src="./resources/js/oiltypebutton.js"></script>
    <script src="./resources/js/zoomcontrol.js"></script>
    <script src="./resources/js/selectgudong.js"></script>
    <script src="./resources/js/marker.js"></script>
    <script src="./resources/js/sidebarmarker.js"></script>
    
</head>

<body>
    <div class="map_wrap, mapwrap">
        <div id="mapwrap">
            <!-- 지도가 표시될 div -->

            <div id="map" style="width:100%;height: 969px;"></div>

            <!-- 지도 위에 표시될 마커 카테고리 -->
            <div class="category">

                <ul>
                    <li id="coffeeMenu" onclick="changeMarker('coffee')">
                        <span class="ico_comm ico_coffee"></span>
                    </li>
                    <a class="storeMenus" onclick="asd()">
                        <li id="storeMenu" onclick="changeMarker('store')">
                            <span class="ico_comm ico_store"></span>
                            주유소
                        </li>
                    </a>
                    <li id="carparkMenu" onclick="changeMarker('carpark')">
                        <span class="ico_comm ico_carpark"></span>
                        주차장
                    </li>

                </ul>


            </div>


            <!-- 지도타입 컨트롤 div 입니다 -->
            <div class="custom_typecontrol radius_border">
                <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
                <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
            </div>

            <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
            <div class="custom_zoomcontrol radius_border">
                <span onclick="zoomIn()"><img
                        src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>
                <span onclick="zoomOut()"><img
                        src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
            </div>

        </div>

    <!-- --------------------------------------사이드바---------------- -->

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>

                <form onsubmit="clearSearchBox(searchPlaces()); return false;">
                    <!-- <button class="logoImage"></button> -->
                    <img src="./resources/image/logo.png" class="logo">
                    <!-- <h1 class="logoText">공영이</h1> -->
                    <button type="button" id="loginbtn" class="loginbtn">로그인</button>
                    <!-- <h2 class="logoText2" id="nick">(002)</h2> -->
                    <button onclick="" id="parkingbtn" class="parkingIcon"></button>
                    <button class="gasIcon"></button>
                </form>

                <!-- =============각 구 별로 연결작업==================================== -->
                <h3 class="busan">부산광역시</h3>
                <form id="region">
                    <select class="sigungu" id="guSelect" onchange="gudong()">
                        <option value="">시/군/구</option>
                        <option value="강서구">강서구</option>
                        <option value="금정구">금정구</option>
                        <option value="기장군">기장군</option>
                        <option value="남구">남구</option>
                        <option value="동구">동구</option>
                        <option value="동래구">동래구</option>
                        <option value="부산진구">부산진구</option>
                        <option value="북구">북구</option>
                        <option value="사상구">사상구</option>
                        <option value="사하구">사하구</option>
                        <option value="서구">서구</option>
                        <option value="수영구">수영구</option>
                        <option value="연제구">연제구</option>
                        <option value="영도구">영도구</option>
                        <option value="중구">중구</option>
                        <option value="해운대구">해운대구</option>
                    </select>
                    
                </form>
                <fom id = "zone">
                    <select id="dongSelect" class="dongs">
                        <option value="">읍/면/동</option>
                    </select>
                </fom>
                <button type="button" id="selectlocation" class="checkbtn">조회</button>
                
                

                <!-- <div>
                    <button class="makeMarker" onclick="selectOverlay('MARKER')"></button>
                </div> -->

                <input type="text" id="keyword" size="20" class="searchIcon">
                </form>



                <div>
                    <!-- 폼생성 -->
                    <div class="sidebar">
                        <button class="closeSidebar" onclick="closeSidebar()"></button>
                        <form id="mainform">
                            <div class="sidebarHead" style="height: 12%;">
                                <p class="parkingname"> 주유소이름 </p>
                                <p class="parkingaddr" type="text" id="namebtn" name="storename"></p>
                                <p class="mainstar"> 평점 : ★★★★☆ </p>

                            </div>

                            <hr>
                            <div class="oil" >
                                <div class="oilType radius_border">
                                    <span id="btnDiesel" class="selected_btn" onclick="setOilType('dieselbtn')">경유</span>
                                    <span id="btnGasoline" class="btn" onclick="setOilType('gasolinebtn')">휘발유</span>
                                </div>
                                    <p style="font-size: large;text-align : center; "> <span id="gasRegion">동구</span>에서 <span id="priceNum">3</span>번째로 싼집!</p>
                                    <p style="color: #160d69; font-weight: bold; text-align: center; font-size: 20px;"> 오늘의 유가 정보 </p>
                                <p>
                                <div class="ulstyle">
                                    <div>
                                        <div class="gyeong"> 
                                            <p>경유</p> 
                                            <p class="lefttext" id="diesel">2000</p>
                                        </div>
                                        <div class="hwi">
                                            <p>휘발유</p>
                                            <p class="righttext" id="gasoline">3500</p>
                                        </div>
                                        <div class="smalltext" style="color: #ff7200;text-align: left;">+102원</div>
                                        <div class="smalltext2" style="color: #ff7200; text-align: right; ">+12원</div>
                                    </div>
    

                                </div>
                                </dib>
                                <hr>
                                <div>
                                    <!-- <p class="upup">구에서 몇번째로 싼지 비교</p>
                            <p class="downdown"> 7일치 평균가격과 오늘의 가격 비교</p> -->
                                    <canvas id="myChart" style="width: 200px;"></canvas>



                                </div>
                    </form>
                    <!-- ---------------------review--------------------------------------------- -->


                    <hr style="margin-top: 20px;">
                    <form id="reviewform">
                        <div class="review1">
                            <span style="margin-left: 20px; color: #160d69;">방문자 리뷰</span>
                            <button class="openBtn" onclick="joinCheck()" >✍🏻</button>
                            <div class="modal hidden">
                                <div class="bg"></div>
                                <div class="modalBox"
                                    style="display: flex;align-items:center;flex-direction: column;justify-content:space-around">
                                    <p id="reviewfont">리뷰 작성하기</p>
                                    <p>☺️😊😥</p>
                                    <div class="star-rating">
                                        <input type="radio" id="5-stars" name="rating" value="5" />
                                        <label for="5-stars" class="star">&#9733;</label>
                                        <input type="radio" id="4-stars" name="rating" value="4" />
                                        <label for="4-stars" class="star">&#9733;</label>
                                        <input type="radio" id="3-stars" name="rating" value="3" />
                                        <label for="3-stars" class="star">&#9733;</label>
                                        <input type="radio" id="2-stars" name="rating" value="2" />
                                        <label for="2-stars" class="star">&#9733;</label>
                                        <input type="radio" id="1-star" name="rating" value="1" />
                                        <label for="1-star" class="star">&#9733;</label>
                                    </div>
                                    <textarea class="reviewInput" name="reviewInput"
                                        placeholder="방문한 가게는 어땠나요? 리뷰를 남겨주세요."></textarea>
                                    <div style="display: flex;">
                                        <button class="reviewBtn" id="reviewBtn" type="submit">등록</button>
                                        <button class="closeBtn">닫기</button>
                                    </div>
                                </div>
                            </div>
                    </form>
                    <hr style="border-top: 1px dotted #8c8b8b;">
                </div>
                <div class="review2">
                    <form id="reviewList">
                        <div>
                           <span class="userReview" id="userReview"></span>
                        </div>
                    </form>
                </div>


                <script>
                    let loginbtn= document.getElementById("loginbtn");
                    let nick = document.getElementById("nick");
                    let reviewBtn = document.getElementById("reviewBtn");
                    let grade = document.getElementsByName("rating");
                    let reviewInput = document.getElementsByName("reviewInput");
                    let storename = document.getElementById("namebtn");
                    let reviewusername = document.getElementById("reviewusername");
                    let openBtn = document.getElementsByClassName("openBtn");
                    // let userReview = document.getElementsByName("userReview");
                    let userReview = document.getElementById("userReview");

                    var nickname = sessionStorage.getItem("userName")

                    let reviewList = document.getElementById("reviewList");
                    let reviewform = document.getElementById("reviewform");
                    let mainform = document.getElementById("mainform");

                    const open = () => {
                        document.querySelector(".modal").classList.remove("hidden");
                    }

                    const close = () => {
                        document.querySelector(".modal").classList.add("hidden");
                    }

                    document.querySelector(".openBtn").addEventListener("click", open);
                    document.querySelector(".closeBtn").addEventListener("click", close);
                    document.querySelector(".bg").addEventListener("click", close);


                    window.addEventListener("load", function (e) {
                        console.log(nickname);
                        nick.innerHTML = nickname + "님^^";

                    })

                    function win_open(page, name) {
                        // window.open("팝업될 문서 경로","팝업될 문서 이름","옵션(위치, bar표시, 크기 등)");
                        window.open(page, name, "width=300, height=400, left=0, top=0");
                    };

                    function joinCheck() {
                        const nickname = localStorage.getItem('nickname'); // 로컬 스토리지에서 nickname 값을 가져옴
                        
                        if (nickname == "null") { // nickname이 undefined, null, 빈 문자열("")인 경우 모두 처리
                            console.log('nickname 값이 없습니다.');
                            window.location.href = './join.html'; // 로그인 페이지로 이동
                        }
                    }
                      
                    
                    function reviewlist() {
                        const reviewList = document.getElementById('reviewList');
                        
                        const listform = new FormData(reviewList);
                        listform.append("storename", storename.innerText);

                        fetch("gonggongyung/review", {
                            method: "POST",
                            body: new URLSearchParams([...listform.entries()]), // post body형식
                            headers: {
                                "Content-Type": "application/x-www-form-urlencoded",
                            }
                        })

                        .then((resp) => {
                            console.log(resp.status);

                            return resp.json();
                            })
                            .then((obj) => {
                                console.log(obj);
                                userReview.innerText ="";
                                if (obj.length > 1) {
                                for (let i = 0; i < obj.length; i++) {
                                        // console.log(obj[i].nickname);
                                        // console.log(obj[i].userreview);
                                        userReview.innerHTML += obj[i].nickname + ":" + obj[i].userreview + "\n";
                                    }
                                } else {
                                    userReview.innerText ="작성 된 리뷰가 없습니다.";
                                }
                            
   
   
                            }).catch((e) => { console.log(e) })
                        };
        





                    

                    reviewform.addEventListener("submit", function (e) {
                        e.preventDefault();

                    })

                    reviewBtn.addEventListener("click", (e) => {
                        console.log("눌림");

                        const rform = new FormData(reviewform);
                        rform.append("username", nickname);
                        rform.append("storename", storename.innerText);

                        fetch("http://localhost:8080/gonggongyung/gogo/review", {
                            method: "POST",
                            body: new URLSearchParams([...rform.entries()]), // post body형식
                            headers: {
                                "Content-Type": "application/x-www-form-urlencoded",
                            }
                        })

                        .then((resp) => {
                            console.log(resp.status);
                            return resp.json();
                            })
                            .then((obj) => {

                                
                                
                            }).catch((e) => { console.log(e) })
                        });
        
                        loginbtn.addEventListener("click", (e)=> {
                            window.location.href = "./resources/html/join.html";
                        })


                </script>


            </div>

        </div>
        <div>
            <button onclick="getCurrentPos()" class="locatedStyle"></button>
        </div>

    </div>
    <hr>
    <ul id="placesList"></ul>
    <div id="pagination"></div>




    <!-- 지도를 표시할 div 입니다 -->
    <!-- <div id="map" style="width:100%; height:0;"></div> -->




    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5dac7b6e7ff06b208b6b3a693668ba9&libraries=services,clusterer,drawing"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>

        // 혜도 빌딩 중심 지도 설정

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(35.15959895331954, 129.0601078522617), // 지도의 중심좌표
                level: 2 // 지도의 확대 레벨
            };







        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();



        // 혜도빌딩 및 주차장, 주유소

        var imageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FG3Iqf%2FbtrY7MDoFpt%2FYI9Vj8cKsPftBBdKOKvOQK%2Fimg.png', // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
            imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다
        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            markerPosition = new kakao.maps.LatLng(35.15959895331954, 129.0601078522617); // 마커가 표시될 위치입니다



        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            image: markerImage // 마커이미지 설정 setOilType
        });


        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
        });
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        //-------------------------------make marker---------------------------------------------------------

        var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
            map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
            drawingMode: [ // drawing manager로 제공할 그리기 요소 모드입니다
                kakao.maps.drawing.OverlayType.MARKER,
            ],
            // 사용자에게 제공할 그리기 가이드 툴팁입니다
            // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
            markerOptions: { // 마커 옵션입니다 
                draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다 
                removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
            },
        };

        // 위에 작성한 옵션으로 Drawing Manager를 생성합니다
       // var manager = new kakao.maps.drawing.DrawingManager(options);







        //----------------------------------------------------------------------------------------------------------------------검색할때 post로 담기




       





     
        //----------------------------------------------------------------------------------------------------------------------검색할때 post로 담기


       
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        // let gasstation = [];
        // let parkinglot = [];
        // window.addEventListener("load", function (e) {


        //     fetch("http://localhost:8080/gonggongyung/gogo/gasstation/", {
        //         method: "GET",
        //         headers: {
        //             "Content-Type": "application/json"
        //         }
        //     })
        //         .then(response => response.json())
        //         .then(data => {
        //             for (let i = 0; i < data.length; i++) {
        //                 gasstation.push(data[i]);
        //             }

        //             console.log(data); // 데이터 출력
        //         });

        //     fetch("http://localhost:8080/gonggongyung/gogo/parkinglot/", {
        //         method: "GET",
        //         headers: {
        //             "Content-Type": "application/json"
        //         }
        //     })
        //         .then(response => response.json())
        //         .then(data => {

        //             for (let i = 0; i < data.length; i++) {
        //                 parkinglot.push(data[i]);
        //             }

        //             console.log(data); // 데이터 출력
        //         });
        // }); //스크립트---------------------

        // 편의점 마커가 표시될 좌표 배열입니다



        

        // function asd() {
        //     let storeMenu = document.getElementsByClassName("storeMenus");

        //     fetch("http://localhost:8080/gonggongyung/gogo/gasstation/", { // 누르면 가라
        //     }).then((response) => response.json())
        //         .then((data) => {
        //             for (let i = 0; i < data.length; i += 2) {
        //                 storePositions.push(new kakao.maps.LatLng(data[i], data[i + 1]));
        //                 console.log(storePositions);
        //             }
        //         })
        //     createStoreMarkers();
        // }

        // 커피숍 마커가 표시될 좌표 배열입니다
        var coffeePositions = [];

        var storePositions = [];


        // 주차장 마커가 표시될 좌표 배열입니다
        var carparkPositions = [
            new kakao.maps.LatLng(35.213725, 129.080538),
            new kakao.maps.LatLng(35.162218, 128.986650),
            new kakao.maps.LatLng(35.207310, 129.078527),
            new kakao.maps.LatLng(35.218925, 129.085617),
            new kakao.maps.LatLng(35.228187, 129.089228),
            new kakao.maps.LatLng(35.231583, 129.089107),
            new kakao.maps.LatLng(35.239165, 129.088416),
            new kakao.maps.LatLng(35.245568, 129.091272),
            new kakao.maps.LatLng(35.271787, 129.086944),
            new kakao.maps.LatLng(35.283211, 129.095100),
            new kakao.maps.LatLng(35.104432, 128.964301),
            new kakao.maps.LatLng(35.148665, 129.001262),
            new kakao.maps.LatLng(35.169164, 129.177395),
            new kakao.maps.LatLng(35.158553, 129.157447),
            new kakao.maps.LatLng(35.154860, 129.131361),
            new kakao.maps.LatLng(35.156248, 129.133637),
            new kakao.maps.LatLng(35.167034, 129.170428),
            new kakao.maps.LatLng(35.157361, 129.151082),
            new kakao.maps.LatLng(35.202879, 129.131858),
            new kakao.maps.LatLng(35.176877, 129.126678),
            new kakao.maps.LatLng(35.236981, 129.016439),
            new kakao.maps.LatLng(35.173494, 129.173747),
            new kakao.maps.LatLng(35.167026, 129.170446),
            new kakao.maps.LatLng(35.167749, 129.175966),
            new kakao.maps.LatLng(35.080702, 129.046095),
            new kakao.maps.LatLng(35.112920, 129.027845),
            new kakao.maps.LatLng(35.167635, 129.178492),
            new kakao.maps.LatLng(35.116586, 129.020095),
            new kakao.maps.LatLng(35.161695, 129.170300),
            new kakao.maps.LatLng(35.220937, 129.146448),
        ];

        var markerImageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FczwJDf%2Fbtr0aQQF3K0%2FAsphV4K9VzNi3sKyOLJXRK%2Fimg.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
        coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
            storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
            carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다


        createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
        createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
        createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

        changeMarker(''); // 지도에 커피숍 마커가 보이도록 설정합니다    


        // 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
     









        // -------------------------------------------------------------------------------------------------------------------------------------------------



        
        // -------------------------------------------------------------------------------------------------------------------------------------------------




        // function relayout() {

        //     // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
        //     // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
        //     // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
        //     map.relayout();
        // }





        // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
        var placeOverlay = new kakao.maps.CustomOverlay({ zIndex: 1 }),
            contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
            markers = [], // 마커를 담을 배열입니다
            currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
        var ps = new kakao.maps.services.Places(map);

        // 지도에 idle 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'idle', searchPlaces);

        // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
        contentNode.className = 'placeinfo_wrap';

        // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
        // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
        addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
        addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

        // 커스텀 오버레이 컨텐츠를 설정합니다
        placeOverlay.setContent(contentNode);

        // 각 카테고리에 클릭 이벤트를 등록합니다
        addCategoryClickEvent();

        // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
        function addEventHandle(target, type, callback) {
            if (target.addEventListener) {
                target.addEventListener(type, callback);
            } else {
                target.attachEvent('on' + type, callback);
            }
        }

        // 카테고리 검색을 요청하는 함수입니다
        // function searchPlaces() {
        //     if (!currCategory) {
        //         return;
        //     }

        //     // 커스텀 오버레이를 숨깁니다 
        //     placeOverlay.setMap(null);

        //     // 지도에 표시되고 있는 마커를 제거합니다
        //     removeMarker();

        //     ps.categorySearch(currCategory, placesSearchCB, { useMapBounds: true });
        // }

        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        // function placesSearchCB(data, status, pagination) {
        //     if (status === kakao.maps.services.Status.OK) {

        //         // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        //         displayPlaces(data);
        //     } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        //         // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

        //     } else if (status === kakao.maps.services.Status.ERROR) {
        //         // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

        //     }
        // }

        // 지도에 마커를 표출하는 함수입니다
        // function displayPlaces(places) {

        //     // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
        //     // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
        //     var order = document.getElementById(currCategory).getAttribute('data-order');



        //     for (var i = 0; i < places.length; i++) {

        //         // 마커를 생성하고 지도에 표시합니다
        //         var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

        //         // 마커와 검색결과 항목을 클릭 했을 때
        //         // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
        //         (function (marker, place) {
        //             kakao.maps.event.addListener(marker, 'click', function () {
        //                 displayPlaceInfo(place);
        //             });
        //         })(marker, places[i]);
        //     }
        // }

        // // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        // function addMarker(position, order) {
        //     var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        //         imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        //         imgOptions = {
        //             spriteSize: new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
        //             spriteOrigin: new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        //             offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        //         },
        //         markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        //         marker = new kakao.maps.Marker({
        //             position: position, // 마커의 위치
        //             image: markerImage
        //         });

        //     marker.setMap(map); // 지도 위에 마커를 표출합니다
        //     markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        //     return marker;
        // }

        // 지도 위에 표시되고 있는 마커를 모두 제거합니다





        //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



 //삭제 예정
        // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
        // function displayPlaceInfo(place) {
        //     var content = '<div class="placeinfo">' +
        //         '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';

        //     if (place.road_address_name) {
        //         content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
        //             '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
        //     } else {
        //         content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
        //     }

        //     content += '    <span class="tel">' + place.phone + '</span>' +
        //         '</div>' +
        //         '<div class="after"></div>';

        //     contentNode.innerHTML = content;
        //     placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
        //     placeOverlay.setMap(map);
        // }


        // 각 카테고리에 클릭 이벤트를 등록합니다
        // function addCategoryClickEvent() {
        //     var category = document.getElementById('category'),
        //         children = category.children;

        //     for (var i = 0; i < children.length; i++) {
        //         children[i].onclick = onClickCategory;
        //     }
        // }

        // // 카테고리를 클릭했을 때 호출되는 함수입니다
        // function onClickCategory() {
        //     var id = this.id,
        //         className = this.className;

        //     placeOverlay.setMap(null);

        //     if (className === 'on') {
        //         currCategory = '';
        //         changeCategoryClass();
        //         removeMarker();
        //     } else {
        //         currCategory = id;
        //         changeCategoryClass(this);
        //         searchPlaces();
        //     }
        // }

        // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
        // function changeCategoryClass(el) {
        //     var category = document.getElementById('category'),
        //         children = category.children,
        //         i;

        //     for (i = 0; i < children.length; i++) {
        //         children[i].className = '';
        //     }

        //     if (el) {
        //         el.className = 'on';
        //     }
        // }





        // -------------------키워드 검색-----------------------------------------------------------



        // // 마커를 담을 배열입니다
        // var markers = [];

        // var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        //     mapOption = {
        //         level: 2 // 지도의 확대 레벨
        //     };


        // // 장소 검색 객체를 생성합니다
        // var ps = new kakao.maps.services.Places();
        // // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        // var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

        // // 키워드로 장소를 검색합니다
        // searchPlaces();

        // // 키워드 검색을 요청하는 함수입니다
        // function searchPlaces() {

        //     var keyword = document.getElementById('keyword').value;

        //     if (!keyword.replace(/^\s+|\s+$/g, '')) {
        //         // alert('키워드를 입력해주세요!');
        //         return false;
        //     } else {

        //     }

        //     // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        //     ps.keywordSearch(keyword, placesSearchCB);

        // }

        // // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        // function placesSearchCB(data, status, pagination) {
        //     if (status === kakao.maps.services.Status.OK) {

        //         // 정상적으로 검색이 완료됐으면
        //         // 검색 목록과 마커를 표출합니다
        //         displayPlaces(data);

        //         // 페이지 번호를 표출합니다
        //         displayPagination(pagination);

        //     } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        //         // alert('검색 결과가 존재하지 않습니다.');
        //         return;

        //     } else if (status === kakao.maps.services.Status.ERROR) {

        //         //alert('검색 결과 중 오류가 발생했습니다.');
        //         return;

        //     }
        // }






        //----------------------------------------------------------- --------------------


        // 검색 결과 목록과 마커를 표출하는 함수입니다
        // function displayPlaces(places) {



        //     // 검색 결과 - =======================
        //     var listEl = document.getElementById('placesList'),
        //         menuEl = document.getElementById('menu_wrap'),
        //         fragment = document.createDocumentFragment(),
        //         bounds = new kakao.maps.LatLngBounds(),
        //         listStr = '';

        //     // 검색 결과 목록에 추가된 항목들을 제거합니다
        //     removeAllChildNods(listEl);

        //     // 지도에 표시되고 있는 마커를 제거합니다
        //     removeMarker();

        //     for (var i = 0; i < places.length; i++) {

        //         // 마커를 생성하고 지도에 표시합니다
        //         var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
        //             marker = addMarker(placePosition, i),
        //             itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        //         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        //         // LatLngBounds 객체에 좌표를 추가합니다
        //         bounds.extend(placePosition);


        //         fragment.appendChild(itemEl);
        //     }

        //     // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        //     listEl.appendChild(fragment);
        //     menuEl.scrollTop = 0;

        //     // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        //     map.setBounds(bounds);

        // }





            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        // function addMarker(position, idx, title) {
        //     var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        //         imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        //         imgOptions = {
        //             spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
        //             spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        //             offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        //         },
        //         markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        //         marker = new kakao.maps.Marker({
        //             position: position, // 마커의 위치
        //             image: markerImage
        //         });

        //     marker.setMap(map); // 지도 위에 마커를 표출합니다
        //     markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        //     return marker;
        // }

        // 지도 위에 표시되고 있는 마커를 모두 제거합니다
        // function removeMarker() {
        //     for (var i = 0; i < markers.length; i++) {
        //         markers[i].setMap(null);
        //     }
        //     markers = [];
        // }

        // // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
        // function displayPagination(pagination) {
        //     var paginationEl = document.getElementById('pagination'),
        //         fragment = document.createDocumentFragment(),
        //         i;

        //     // 기존에 추가된 페이지번호를 삭제합니다
        //     while (paginationEl.hasChildNodes()) {
        //         paginationEl.removeChild(paginationEl.lastChild);
        //     }

        //     for (i = 1; i <= pagination.last; i++) {
        //         var el = document.createElement('a');
        //         el.href = "#";
        //         el.innerHTML = i;

        //         if (i === pagination.current) {
        //             el.className = 'on';
        //         } else {
        //             el.onclick = (function (i) {
        //                 return function () {
        //                     pagination.gotoPage(i);
        //                 }
        //             })(i);
        //         }

        //         fragment.appendChild(el);
        //     }
        //     paginationEl.appendChild(fragment);
        // }
        

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
        // 인포윈도우에 장소명을 표시합니다
        // function displayInfowindow(marker, title) {
        //     var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        //     infowindow.setContent(content);
        //     infowindow.open(map, marker);
        // }




        // 검색결과 목록의 자식 Element를 제거하는 함수입니다
        function removeAllChildNods(el) {
            while (el.hasChildNodes()) {
                el.removeChild(el.lastChild);
            }
        }





        // 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
        // function setMapType(maptype) {
        //     var roadmapControl = document.getElementById('btnRoadmap');
        //     var skyviewControl = document.getElementById('btnSkyview');
        //     if (maptype === 'roadmap') {
        //         map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
        //         roadmapControl.className = 'selected_btn';
        //         skyviewControl.className = 'btn';
        //     } else {
        //         map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
        //         skyviewControl.className = 'selected_btn';
        //         roadmapControl.className = 'btn';
        //     }
        // }

        // // 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
        // function zoomIn() {
        //     map.setLevel(map.getLevel() - 1);
        // }

        // // 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
        // function zoomOut() {
        //     map.setLevel(map.getLevel() + 1);
        // }




    
        




      
        




    </script>
</body>

</html>