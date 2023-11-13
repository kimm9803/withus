<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>그룹 목록</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
		    * {
		   font-family: 'Sunflower', sans-serif;
		}
        #main {
            text-align: center;
            width: 60%;
            margin: 0 auto;       
        }

        .card-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin: 0 auto;
        }

        .card {
            width: calc(50% - 20px);
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            overflow: hidden; /* 추가된 부분: 둥근 테두리 적용 시 튀어나온 부분을 감춤 */
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-header {
            background-color: #E6E1E1;
            color: black !important;
            height: 150px;
            display: flex;
            align-items: center;
            padding: 0 10px;
        }

        a {
            color: black;
            text-decoration: none;
        }

        #create {
            margin-bottom: 20px;
            margin-top: 20px;
        }

        h5 {
            margin-top: 10px;
            font-weight: bold;
        }

        .card-body {
            padding: 10px;
        }
        .loadMore{
            margin-bottom: 50px;
        }
        #collapseBtn {
        display: none;
        }
        .card-text{
        margin-right: 4px;        
        } 
    </style>
</head>
<body>
    <div id="main">
        <h2>그룹 목록</h2>
        <a href="/groups/create" class="btn btn-dark" id="create">그룹 생성</a>
        <a href="/" class="btn btn-dark" id="create">홈으로</a>
        <div class="card-container" id="groupContainer">
            <!-- 초기 데이터를 서버에서 받아와서 렌더링 -->
        </div>
        <div class="loadMore">    
        <button class="btn btn-dark" id="loadMore">더보기</button>
        <button class="btn btn-dark" id="collapseBtn">접기</button>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            var page = 1; // 현재 페이지
            var pageSize = 4; // 한 번에 로드될 그룹 수

            function loadInitialData() {
                $.ajax({
                    url: "/groups/loadMore",
                    type: "GET",
                    data: {
                        page: page,
                        pageSize: pageSize
                    },
                    success: function (data) {
                        if (data.length > 0) {
                            for (var i = 0; i < data.length; i++) {
                            	var cardHtml = "<div class='card border-dark'>" +
                                "<div class='card-header bg-light'>" +
                                "<div style='display: flex; align-items: center;'>";

                            if (data[i].newImageName) {
                                cardHtml += "<img src='/" + data[i].newImageName + "' style='height: 100px; width: 100px; border: 1px solid black; margin-right: 10px;' class='rounded-circle'>";
                            } else {
                                cardHtml += "<img src='/img/basic.jpg' style='height: 100px; width: 100px; border: 1px solid black; margin-right: 10px;' class='rounded-circle'>";
                            }

                            cardHtml += "<div style='flex-grow: 1;'>" +
                                "<h5><a href='/groups/view/" + data[i].gno + "' class='text-dark'>" + data[i].gname + "</a></h5>" +
                                "<div class='card-body d-flex flex-column justify-content-between'>" +
                                "<div class='d-flex justify-content-between mb-2'>" +
                                "<div class='card-text'>생성일: " + data[i].gdate + "</div>" +
                                "<div class='card-text'>그룹장: " + data[i].name + "</div>" +
                                "</div>" +
                                "<div class='d-flex justify-content-between'>" +
                                "<div class='card-text '>정원: " + data[i].memberCnt +"/" + data[i].gperson + "</div>" +
                                "<div class='card-text '>추천: " + data[i].glike + "</div>" +
                                "<div class='card-text '>분류: " + (data[i].catename ? data[i].catename : "기타") + "</div>" +
                                "<div class='card-text '>지역: " + (data[i].rname ? data[i].rname : "기타") + "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>";


                                $("#groupContainer").append(cardHtml);
                            }
                            page++;
                        } else {
                            $("#loadMore").hide();
                            $("#collapseBtn").show(); // 데이터가 없으면 접기 버튼을 보이게 함
                        }
                    },
                    error: function () {
                        alert("데이터를 불러오는 데 실패했습니다.");
                    }
                });
            }

            // 초기 데이터 로드
            loadInitialData();

            // 더보기 버튼 클릭 이벤트
            $("#loadMore").click(function () {
                loadInitialData();
            });
            // 접기 버튼 클릭 이벤트
            $("#collapseBtn").click(function () {
                location.reload();
            });
        });
    </script>
</body>
</html>
