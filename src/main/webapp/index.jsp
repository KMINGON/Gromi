<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gromi</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <style>
        .nav-item{
            padding-left: 50px;
        }
    </style>
    <link href="style.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark" aria-label="main-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Gromi</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navBoard"
                aria-controls="navBoard" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id = "navBoard">
                <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="recommend/recommend.html">식물 추천</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">블로그</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                            aria-expanded="false">커뮤니티</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="board/viewBoard.jsp?boardType=free">자유 게시판</a></li>
                            <li><a class="dropdown-item" href="board/viewBoard.jsp?boardType=QA">Q&A 게시판</a></li>
                            <li><a class="dropdown-item" href="board/viewBoard.jsp?boardType=sale">분양 게시판</a></li>
                        </ul>
                    </li>
                </ul>
                
                <div class="justify-content-end">
                    <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                aria-expanded="false">마이페이지</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="login/signin.jsp">로그인</a></li>
                                <li><a class="dropdown-item" href="login/signup.jsp">회원가입</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>


    <!--코드 작성-->
    <main>
    	<!-- 인디케이터 포함 캐러셀 --> 
    	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
		  <!-- data-bs-interval : 슬라이드 지연 시간 -->
		    <div class="carousel-item active" data-bs-interval="1000">
		     <h3 class="text-center fw-small">첫번째 공지사항</h3>
			
		    </div>
		    <div class="carousel-item" data-bs-interval="1000">
		     <h3 class="text-center fw-normal">두번째 공지사항</h3>
		    </div>
		    <div class="carousel-item" data-bs-interval="1000">
		     <h3 class="text-center fw-normal">세번째 공지사항</h3>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		
    
        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
          <div class="col-md-5 p-lg-5 mx-auto my-5">
            <h1 class="display-4 fw-bold text-wrap">GROMI 식물커뮤니티</h1>
            <p class="lead fw-bold">알고싶은 식물을 검색하고 원하는 식물에 대해 찾아보세요!</p>
            <a class="btn btn-outline-secondary" href="./plantList.jsp">많은 식물 알아보기</a>
          </div>
          
          <div class="product-plant shadow-sm d-none d-md-block"></div>
          <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
        </div>
      
        <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
          <div class="text-bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
            <div class="my-3 py-3">
              <h2 class="display-5 fw-normal">식물 추천</h2>
              <p class="lead fw-normal">그로미의 추천을 받아 당신의 식물을 찾아보세요.</p>
            </div>
            <div class="bg-light shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
          </div>
          <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
            <div class="my-3 p-3">
              <h2 class="display-5 fw-normal">커뮤니티</h2>
              <p class="lead fw-normal">당신의 식물을 공유해보세요.</p>
            </div>
            <div class="bg-dark shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
          </div>
        </div>
      
        <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
          <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
            <div class="my-3 p-3">
              <h2 class="display-5">Another headline</h2>
              <p class="lead">And an even wittier subheading.</p>
            </div>
            <div class="bg-dark shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
          </div>
          <div class="text-bg-primary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
            <div class="my-3 py-3">
              <h2 class="display-5">Another headline</h2>
              <p class="lead">And an even wittier subheading.</p>
            </div>
            <div class="bg-light shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
          </div>
        </div>
      </main>


    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="instagram" viewBox="0 0 16 16">
            <path
                d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
        </symbol>
    </svg>


    <div class="container">
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
            <div class="col-md-4 d-flex align-items-center">
                <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">

                    <img src="https://starteacher-v5-upload.s3.ap-northeast-2.amazonaws.com/institute/logoaf34051b140f0305b0593ebd85bf43b1170b2268067bd03b3e7a0353b0df1c8e877810ac50891df6e550db9a15ab69fe"
                        width="30">
                </a>
                <span class="mb-3 mb-md-0 text-muted">&copy; Goormbbang Company, Inc</span>
            </div>

            <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24">
                            <use xlink:href="#instagram" />
                        </svg></a></li>
            </ul>
        </footer>
    </div>
</body>

</html>