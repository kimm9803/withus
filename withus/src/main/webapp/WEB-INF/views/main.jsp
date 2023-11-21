<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            margin: 50px auto 0;
        }

        .card-container .card:nth-child(n+5) {
            display: none;
        }

        .loadMore {
            text-align: center;
        }

        .card-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin: 30px auto 0;
        }

        .card {
            width: calc(50% - 20px);
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            overflow: hidden;
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

        #collapseBtn {
            display: none;
        }

        .card-text {
            margin-right: 4px;
        }

        #noDataMessage {
            display: none;
            color: red;
            font-weight: bold;
            padding: 50px;
        }

        .custom-image-style {
            /* 직사각형 이미지에 대한 사용자 정의 스타일 추가 */
            border-radius: 10px;
            /* 필요에 따라 border-radius를 조절하세요 */
        }
        .category-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-evenly;
            gap: 10px;
            
        }

        .category-item {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 10px;
            text-align: center;
        }
        #mainimg {
		    display: flex;
		    justify-content: center;
		}
		
		#mainimg img {
		    width: 60%;
		    height: 700px;
		    object-fit: cover;
		}
		#mainbody{
		margin-bottom: 50px;
		margin-top: 100px;
		}
		#cardheader{
		margin-top: 20px; 	
		}

    </style>
</head>

<body>
<header><%@ include file="header.jsp" %></header>
<div id="mainbody">
<div id="mainimg">
<img src="/img/main.jpg">
</div>
<div id="main">
    <!-- 카테고리 부분 -->
		<div class="category-container">
			<div class="category-item">
				<a href="/groups/loadall" class="category-link"> 
				<span>전체</span>
				</a>
			</div>			
		    <div class="category-item">
		        <a href="/groups/loadcate/1" class="category-link"> 
		            <span>아웃도어/여행</span>
		        </a>
		    </div>
		    <div class="category-item">
		        <a href="/groups/loadcate/2" class="category-link">
		            <span>운동/스포츠</span>
		        </a>
		    </div>
		    <div class="category-item">
		        <a href="/groups/loadcate/3" class="category-link">
		            <span>책/글</span>
		        </a>
		    </div>
		    <div class="category-item">
		        <a href="/groups/loadcate/4" class="category-link">
		            <span>외국/언어</span>
		        </a>
		    </div>
		    <div class="category-item">
		        <a href="/groups/loadcate/5" class="category-link">
		            <span>문화/공연/축제</span>
		        </a>
		    </div>
		    <div class="category-item">
		        <a href="/groups/loadcate/6" class="category-link">
		            <span>음악/악기</span>
		        </a>
		    </div>
		    <div class="category-item">
		        <a href="/groups/loadcate/7" class="category-link">
		            <span>사진/영상</span>
		        </a>
		    </div>
		    <div class="category-item">
		        <a href="/groups/loadcate/8" class="category-link">
		            <span>게임/오락</span>
		        </a>
		    </div>
		    <div class="category-item">
		        <a href="/groups/loadcate/9" class="category-link">
		            <span>차/오토바이</span>
		        </a>
		    </div>
		</div>    
<hr style="margin-bottom: 50px;">		
	<!--  그룹 부분 -->
	<div id="cardheader"><h5>전체 그룹</h5></div>
	<div class="card-container" id="groupContainer">
       <c:forEach var="group" items="${cateGroupList}"> 
            <div class='card border-dark'>
                <!-- 그룹 표시 코드 -->
                <div class='card-header bg-light'>
                    <div style='display: flex; align-items: center; width: 100%'>
                        <!-- 이미지 표시 코드 -->
                        <c:if test="${group.newImageName eq null}">
                            <img src='/img/basic.jpg' class='custom-image-style' style='height: 120px; width: 120px; border: 1px solid black; margin-right: 10px;'>
                        </c:if>
                        <c:if test="${group.newImageName ne null}">
                            <img src='/${group.newImageName}' class='custom-image-style' style='height: 120px; width: 120px; border: 1px solid black; margin-right: 10px;'>
                        </c:if>
                        <div style='flex-grow: 1;'>
                            <h5>
                                <a href='/groups/view/${group.gno}' class='text-dark'>${group.gname}</a>
                            </h5>
                            <div class='card-body d-flex flex-column justify-content-between'style='width: 70%; margin-left: 70px;'>
                                <!-- 그룹 정보 표시 코드 -->
                                <div class='d-flex justify-content-between mb-2'>
                                    <div class='card-text mr-2'>정원: ${group.memberCnt} / ${group.gperson}</div>
                                    <div class='card-text'>추천: ${group.glike}</div>
                                </div>
                                <div class='d-flex justify-content-between'>
                                    <div class='card-text'>생성일: ${group.gdate}</div>
                                    <div class='card-text'>그룹장: ${group.name}</div>
                                </div>
                                <div class='d-flex justify-content-between'>
                                    <div class='card-text mr-2'>분류: ${group.catename != null ? group.catename : '기타'}</div>
								    <div class='card-text'>지역: ${group.rname != null ? group.rname : '기타'}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- "더보기" 버튼 -->
    <div class="loadMore">
        <button type="button" class="btn btn-dark" id="loadMoreBtn">더보기</button>
    </div>
    <!-- 전제 그룹 목록 끝 -->
<hr style="margin-bottom: 50px;">
    
            <!-- 선호 카테고리 그룹 부분 -->
            <c:if test="${not empty memberid && not empty favorGroupList}">
            <div id="cardheader" class="favorcate">
                <h5>선호 카테고리 그룹</h5>
                <div class="card-container" id="favorGroupContainer">
                    <c:forEach var="favorgroup" items="${favorGroupList}"> 
                        <div class='card border-dark'>
                            <!-- 그룹 표시 코드 -->
                            <div class='card-header bg-light'>
                                <div style='display: flex; align-items: center; width: 100%'>
                                    <!-- 이미지 표시 코드 -->
                                    <c:if test="${favorgroup.newImageName eq null}">
                                        <img src='/img/basic.jpg' class='custom-image-style' style='height: 120px; width: 120px; border: 1px solid black; margin-right: 10px;'>
                                    </c:if>
                                    <c:if test="${favorgroup.newImageName ne null}">
                                        <img src='/${favorgroup.newImageName}' class='custom-image-style' style='height: 120px; width: 120px; border: 1px solid black; margin-right: 10px;'>
                                    </c:if>
                                    <div style='flex-grow: 1;'>
                                        <h5>
                                            <a href='/groups/view/${favorgroup.gno}' class='text-dark'>${favorgroup.gname}</a>
                                        </h5>
                                        <div class='card-body d-flex flex-column justify-content-between'style='width: 70%; margin-left: 70px;'>
                                            <!-- 그룹 정보 표시 코드 -->
                                            <div class='d-flex justify-content-between mb-2'>
                                                <div class='card-text mr-2'>정원: ${favorgroup.memberCnt} / ${favorgroup.gperson}</div>
                                                <div class='card-text'>추천: ${favorgroup.glike}</div>
                                            </div>
                                            <div class='d-flex justify-content-between'>
                                                <div class='card-text'>생성일: ${favorgroup.gdate}</div>
                                                <div class='card-text'>그룹장: ${favorgroup.name}</div>
                                            </div>
                                            <div class='d-flex justify-content-between'>
                                                <div class='card-text mr-2'>분류: ${favorgroup.catename != null ? favorgroup.catename : '기타'}</div>
								    			<div class='card-text'>지역: ${favorgroup.rname != null ? favorgroup.rname : '기타'}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- "더보기" 버튼 -->
                <div class="loadMore">
                    <button type="button" class="btn btn-dark" id="loadMoreFavorGroupBtn">더보기</button>
                </div>
            </div>
			</c:if>
			<!-- 선호카테고리 끝 -->
<hr style="margin-bottom: 50px;">			
            <!-- 선호 지역 그룹 부분 -->
			<c:if test="${not empty memberid && not empty favorRegionGroupList}">
			    <div id="cardheader" class="favorregion">
			        <h5>선호 지역 그룹</h5>
			        <div class="card-container" id="favorRegionGroupContainer">
                    <c:forEach var="favorregion" items="${favorRegionGroupList}"> 
                        <div class='card border-dark'>
                            <!-- 그룹 표시 코드 -->
                            <div class='card-header bg-light'>
                                <div style='display: flex; align-items: center; width: 100%'>
                                    <!-- 이미지 표시 코드 -->
                                    <c:if test="${favorregion.newImageName eq null}">
                                        <img src='/img/basic.jpg' class='custom-image-style' style='height: 120px; width: 120px; border: 1px solid black; margin-right: 10px;'>
                                    </c:if>
                                    <c:if test="${favorregion.newImageName ne null}">
                                        <img src='/${favorregion.newImageName}' class='custom-image-style' style='height: 120px; width: 120px; border: 1px solid black; margin-right: 10px;'>
                                    </c:if>
                                    <div style='flex-grow: 1;'>
                                        <h5>
                                            <a href='/groups/view/${favorregion.gno}' class='text-dark'>${favorregion.gname}</a>
                                        </h5>
                                        <div class='card-body d-flex flex-column justify-content-between'style='width: 70%; margin-left: 70px;'>
                                            <!-- 그룹 정보 표시 코드 -->
                                            <div class='d-flex justify-content-between mb-2'>
                                                <div class='card-text mr-2'>정원: ${favorregion.memberCnt} / ${favorregion.gperson}</div>
                                                <div class='card-text'>추천: ${favorregion.glike}</div>
                                            </div>
                                            <div class='d-flex justify-content-between'>
                                                <div class='card-text'>생성일: ${favorregion.gdate}</div>
                                                <div class='card-text'>그룹장: ${favorregion.name}</div>
                                            </div>
                                            <div class='d-flex justify-content-between'>
                                                <div class='card-text mr-2'>분류: ${favorregion.catename != null ? favorregion.catename : '기타'}</div>
								    			<div class='card-text'>지역: ${favorregion.rname != null ? favorregion.rname : '기타'}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- "더보기" 버튼 -->
                <div class="loadMore">
                    <button type="button" class="btn btn-dark" id="loadMoreFavorRegionBtn">더보기</button>
                </div>
            </div>
			</c:if>
			<!-- 선호 지역 끝 -->
<hr style="margin-bottom: 50px;">			
        </div>
    </div>

<footer><%@ include file="footer.jsp" %></footer>
</body>
    <script>
    // 전체그룹 더보기 버튼
    var increment = 4;
    var visibleGroups = 4;
    var totalGroups = ${totalGroup}; // totalGroup 값 할당
    if (visibleGroups >= totalGroups) {
        document.getElementById('loadMoreBtn').style.display = 'none';
    }

    function loadMoreGroups() {
        visibleGroups += increment;

        // 보여질 그룹 수까지만 숨겨진 그룹을 나타냄
        $('#groupContainer .card:hidden:lt(' + increment + ')').show();

        if (visibleGroups >= totalGroups) {
            document.getElementById('loadMoreBtn').style.display = 'none';
        }
    }

    document.getElementById('loadMoreBtn').addEventListener('click', loadMoreGroups);
    

    //선호 카테고리그룹 더보기 버튼
    var visibleFavorGroups = 4;
    var totalFavorGroups = ${not empty totalFavorGroups ? totalFavorGroups : 0};
    function loadMoreFavorGroups() {
        visibleFavorGroups += increment;

        // 보여질 선호 카테고리 그룹 수까지만 숨겨진 그룹을 나타냄
        $('#favorGroupContainer .card:hidden:lt(' + increment + ')').show();

        if (visibleFavorGroups >= totalFavorGroups) {
            document.getElementById('loadMoreFavorGroupBtn').style.display = 'none';
        }
    }
    var memberid = "${memberid}"; // ${memberid} 값을 가져와서 변수에 할당

	 // memberid가 공백이 아닌 경우에만 이벤트 리스너 등록
	 if (memberid.trim() !== '') {
	     document.getElementById('loadMoreFavorGroupBtn').addEventListener('click', loadMoreFavorGroups);
	 }
    
    
	 // 선호 지역 그룹 더보기 버튼 관련 스크립트 추가
	    var visibleFavorRegionGroups = 4;
	    var totalFavorRegionGroups = ${not empty totalFavorRegionGroups ? totalFavorRegionGroups : 0};

	    function loadMoreFavorRegionGroups() {
	        visibleFavorRegionGroups += increment;

	        // 보여질 선호 지역 그룹 수까지만 숨겨진 그룹을 나타냄
	        $('#favorRegionGroupContainer .card:hidden:lt(' + increment + ')').show();

	        if (visibleFavorRegionGroups >= totalFavorRegionGroups) {
	            document.getElementById('loadMoreFavorRegionBtn').style.display = 'none';
	        }
	    }

	    // memberid가 공백이 아닌 경우에만 이벤트 리스너 등록
	    if (memberid.trim() !== '') {
	        document.getElementById('loadMoreFavorRegionBtn').addEventListener('click', loadMoreFavorRegionGroups);
	    }
    </script>
</html>
