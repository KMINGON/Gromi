<!DOCTYPE html>
<html lang="en">

<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <% String uid=(String) session.getAttribute("user_id"); String uname=(String) session.getAttribute("user_name");
        String boardType=request.getParameter("boardType"); %>


        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
                <script src="https://kit.fontawesome.com/ae70f4c5ab.js" crossorigin="anonymous"></script>
            <style>
                .nav-item {
                    padding-left: 50px;
                }

                /* 버튼 선택했을 때 테두리 색 변경 */
                .btn-outline-secondary:focus,
                .btn-outline-secondary:active,
                .btn-outline-secondary.active {
                    outline: none;
                    box-shadow: none;
                    border-color: green !important;
                    background-color: transparent !important;
                    /* 배경색 투명으로 설정 */
                    color: green !important;
                    /* 글자색 초록색으로 설정 */
                }

                /* 버튼에 마우스를 올려놓았을 때 배경색 변화 없음 */
                .btn-outline-secondary:hover {
                    background-color: transparent !important;
                    /* 배경색 투명으로 설정 */
                }

                .btn-outline-secondary:focus:not(:active) {
                    box-shadow: none;
                }

                /* 페이지 이동 시 슬라이드*/
                .slide-container {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    height: 100vh;
                    overflow: hidden;
                }

                .slide-content {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    text-align: center;
                    position: relative;
                    animation: slide 1s forwards;
                }

                .slide-out-left {
                    animation: slide-out-left 1s forwards;
                }

                @keyframes slide {
                    0% {
                        opacity: 0;
                        transform: translateX(-100%);
                    }

                    100% {
                        opacity: 1;
                        transform: translateX(0);
                    }
                }

                @keyframes slide-out-left {
                    0% {
                        opacity: 1;
                        transform: translateX(0);
                    }

                    100% {
                        opacity: 0;
                        transform: translateX(-100%);
                    }
                }

                /* 푸터 CSS*/
                .site-footer {
                    background-color: #26272b;
                    padding: 45px 0 20px;
                    font-size: 15px;
                    line-height: 24px;
                    color: #737373;
                }

                .site-footer hr {
                    border-top-color: #bbb;
                    opacity: 0.5
                }

                .site-footer hr.small {
                    margin: 20px 0
                }

                .site-footer h6 {
                    color: #fff;
                    font-size: 16px;
                    text-transform: uppercase;
                    margin-top: 5px;
                    letter-spacing: 2px
                }

                .site-footer a {
                    color: #737373;
                }

                .site-footer a:hover {
                    color: #3366cc;
                    text-decoration: none;
                }

                .footer-links {
                    padding-left: 0;
                    list-style: none
                }

                .footer-links li {
                    display: block
                }

                .footer-links a {
                    color: #737373
                }

                .footer-links a:active,
                .footer-links a:focus,
                .footer-links a:hover {
                    color: #3366cc;
                    text-decoration: none;
                }

                .footer-links.inline li {
                    display: inline-block
                }

                .site-footer .social-icons {
                    text-align: right
                }

                .site-footer .social-icons a {
                    width: 40px;
                    height: 40px;
                    line-height: 40px;
                    margin-left: 6px;
                    margin-right: 0;
                    border-radius: 100%;
                    background-color: #33353d
                }

                .copyright-text {
                    margin: 0
                }

                @media (max-width:991px) {
                    .site-footer [class^=col-] {
                        margin-bottom: 30px
                    }
                }

                @media (max-width:767px) {
                    .site-footer {
                        padding-bottom: 0
                    }

                    .site-footer .copyright-text,
                    .site-footer .social-icons {
                        text-align: center
                    }
                }

                .social-icons {
                    padding-left: 0;
                    margin-bottom: 0;
                    list-style: none
                }

                .social-icons li {
                    display: inline-block;
                    margin-bottom: 4px
                }

                .social-icons li.title {
                    margin-right: 15px;
                    text-transform: uppercase;
                    color: #96a2b2;
                    font-weight: 700;
                    font-size: 13px
                }

                .social-icons a {
                    background-color: #eceeef;
                    color: #818a91;
                    font-size: 16px;
                    display: inline-block;
                    line-height: 44px;
                    width: 44px;
                    height: 44px;
                    text-align: center;
                    margin-right: 8px;
                    border-radius: 100%;
                    -webkit-transition: all .2s linear;
                    -o-transition: all .2s linear;
                    transition: all .2s linear
                }

                .social-icons a:active,
                .social-icons a:focus,
                .social-icons a:hover {
                    color: #fff;
                    background-color: #29aafe
                }

                .social-icons.size-sm a {
                    line-height: 34px;
                    height: 34px;
                    width: 34px;
                    font-size: 14px
                }

                .social-icons a.facebook:hover {
                    background-color: #3b5998
                }

                .social-icons a.twitter:hover {
                    background-color: #00aced
                }

                .social-icons a.linkedin:hover {
                    background-color: #007bb6
                }

                .social-icons a.dribbble:hover {
                    background-color: #ea4c89
                }

                @media (max-width:767px) {
                    .social-icons li.title {
                        display: block;
                        margin-right: 0;
                        font-weight: 600
                    }
                }
            </style>
        </head>

        <body>
            <nav class="navbar navbar-expand-md navbar-dark bg-dark" aria-label="main-navbar">
                <div class="container">
                    <a class="navbar-brand" href="../index.jsp">
                    <div class="box">
                        <div class="title">
                            <span class="block"></span>
                            <h1>Gromi<span></span></h1>
                        </div>
                    </div>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navBoard"
                        aria-controls="navBoard" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navBoard">
                        <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                            <li class="nav-item"><a class="nav-link" aria-current="page" href="../index.jsp">홈</a></li>
                            <li class="nav-item"><a class="nav-link" href="../recommend.jsp">식물 추천</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">블로그</a></li>
                            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle active" href="#"
                                    data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="viewBoard.jsp?boardType=free">자유 게시판</a></li>
                                    <li><a class="dropdown-item" href="viewBoard.jsp?boardType=QA">Q&A 게시판</a></li>
                                    <li><a class="dropdown-item" href="viewBoard.jsp?boardType=sale">분양 게시판</a></li>
                                </ul>
                            </li>
                        </ul>

                        <div class="justify-content-end">
                            <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                                <li class="nav-item dropdown">
                                    <% if (uid==null) { %> <a class="nav-link dropdown-toggle" href="#"
                                            data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="../login/signin.jsp">로그인</a></li>
                                            <li><a class="dropdown-item" href="../login/signup.jsp">회원가입</a></li>
                                        </ul>
                                        <% } else { %> <a class="nav-link dropdown-toggle" href="#"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <%=uname%>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">개인정보수정</a></li>
                                                <li><a class="dropdown-item" href="../login/logout.jsp">로그아웃</a></li>
                                            </ul>
                                            <% } %>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>

            <!--코드 작성-->



            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ZitOzZa+3RRRtJW0n6BeuUp8A51EeWU0s6H+FdFYGPAq8fyEZv9Ql/ZsDMZV0Lze"
                crossorigin="anonymous"></script>



            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                <symbol id="instagram" viewBox="0 0 16 16">
                    <path
                        d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
                </symbol>
            </svg>

            <!--Site footer-->
            <footer class="site-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <h6>Gromi</h6>
                            <p class="text-justify">Company. 구름빵 | Owner. 김시은 
                                <br>Businuess No. 051-xxx-xxxx | E-mail. xxxxx@gmail.com <br>
                                Address. 부산광역시 부산진구 엄광로176(가야동)
                            </p>
                        </div>

                        <div class="col-xs-6 col-md-3">
                            <h6>Categories</h6>
                            <ul class="footer-links">
                                <li><a href="http://scanfcode.com/category/c-language/">ABOUT US</a></li>
                                <li><a href="http://scanfcode.com/category/front-end-development/">GUIDE</a></li>
                                <li><a href="http://scanfcode.com/category/back-end-development/">PRIVACY</a></li>
                                <li><a href="http://scanfcode.com/category/back-end-development/">HELP</a></li>
                            </ul>
                        </div>

                        <div class="col-xs-6 col-md-3">
                            <h6>Social</h6>
                            <ul class="footer-links">
                                <li><a href="http://scanfcode.com/about/">Instagram</a></li>
                                <li><a href="http://scanfcode.com/contact/">Kakao</a></li>
                            </ul>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-sm-6 col-xs-12">
                            <p class="copyright-text">Copyright &copy; Goormbbang Company, All rights reserved.
                            </p>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <ul class="social-icons">
                                <li><a class="facebook" href="https://www.instagram.com/nuexsera/"><i class="fa fa-instagram"></i></a></li>
                                <li><a class="twitter" href="https://www.instagram.com/jongmln_/"><i class="fa fa-instagram"></i></a></li>
                                <li><a class="dribbble" href="https://www.instagram.com/min_gon_med._.j/"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
</html>