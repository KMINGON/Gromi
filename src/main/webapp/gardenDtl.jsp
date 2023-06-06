<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.net.URL"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실내정원용 식물</title>
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
String cntntsNo = request.getParameter("cntntsNo");
%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" src="style.css">
</head>
<body>
<%
//인테러뱅 상세조회

	//apiKey
	String apiKey="20230522XJWYEFWOSP5UXDCRIUCMG";
	//서비스 명
	String serviceName="garden";
	//오퍼레이션 명
	String operationName="gardenDtl";
	
	//XML 받을 URL 생성
	String parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	parameter += "&cntntsNo="+ request.getParameter("cntntsNo");
	
	//서버와 통신
	URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
	InputStream apiStream = apiUrl.openStream();
	
	Document doc = null;
	try{
		//xml document
		doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		apiStream.close();
	}
	String resultCode="";
	String resultMsg="";
	try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
	try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}
	
	
	//콘텐츠 번로 
	cntntsNo             =""; 
	//식물 학명         
	String plntbneNm            =""; 
	//식물 영명        
	String plntzrNm             =""; 
	//유통 명                 
	String distbNm              =""; 
	//과명                  
	String fmlNm                =""; 
	String fmlCodeNm			="";
	//원산지 명           
	String orgplceInfo          =""; 
	//조언 정보                  
	String adviseInfo           =""; ; 
	//성장 높이 정보               
	String growthHgInfo         =""; 
	//성장 넓이 정보              
	String growthAraInfo        =""; 
	//잎 형태 정보             
	String lefStleInfo          =""; 
	//냄새 코드               
	String smellCode            =""; 
	//독정 정보                 
	String toxctyInfo           =""; 
	//번식 시기             
	String prpgtEraInfo         =""; 
	//기타 시기 정보             
	String etcEraInfo           =""; 
	//관리수준 코드          
	String managelevelCode      =""; 
	//생장속도 코드             
	String grwtveCode           =""; 
	//생육 온도 코드        
	String grwhTpCode           =""; 
	//겨울 최저 온도 코드         
	String winterLwetTpCode     =""; 
	//습도 코드    
	String hdCode               =""; 
	//비료 정보                 
	String frtlzrInfo           =""; 
	//토양 정보           
	String soilInfo             =""; 
	//물주기 봄 코드          
	String watercycleSprngCode  =""; 
	//물주기 여름 코드            
	String watercycleSummerCode =""; 
	//물주기 가을 코드            
	String watercycleAutumnCode =""; 
	//물주기 겨울 코드               
	String watercycleWinterCode =""; 
	//병충해 관리 정보          
	String dlthtsManageInfo     =""; 
	//특별관리 정보              
	String speclmanageInfo      =""; 
	//기능성 정보                 
	String fncltyInfo           =""; 
	//관리요구도 코드                  
	String managedemanddoCode   =""; 
	
	try{cntntsNo             = doc.getElementsByTagName("cntntsNo").item(0).getFirstChild().getNodeValue();             }catch(Exception e){cntntsNo             = "";}
	try{plntbneNm            = doc.getElementsByTagName("plntbneNm").item(0).getFirstChild().getNodeValue();            }catch(Exception e){plntbneNm            = "";}
	try{plntzrNm             = doc.getElementsByTagName("plntzrNm").item(0).getFirstChild().getNodeValue();             }catch(Exception e){plntzrNm             = "";}
	try{distbNm              = doc.getElementsByTagName("distbNm").item(0).getFirstChild().getNodeValue();              }catch(Exception e){distbNm              = "";}
	try{fmlNm                = doc.getElementsByTagName("fmlNm").item(0).getFirstChild().getNodeValue();                }catch(Exception e){fmlNm                = "";}
	try{fmlNm                = doc.getElementsByTagName("fmlCodeNm").item(0).getFirstChild().getNodeValue();            }catch(Exception e){fmlCodeNm            = "";}
	try{orgplceInfo          = doc.getElementsByTagName("orgplceInfo").item(0).getFirstChild().getNodeValue();          }catch(Exception e){orgplceInfo          = "";}
	try{adviseInfo           = doc.getElementsByTagName("adviseInfo").item(0).getFirstChild().getNodeValue();           }catch(Exception e){adviseInfo           = "";}
	
	try{growthHgInfo         = doc.getElementsByTagName("growthHgInfo").item(0).getFirstChild().getNodeValue();         }catch(Exception e){growthHgInfo         = "";}
	try{growthAraInfo        = doc.getElementsByTagName("growthAraInfo").item(0).getFirstChild().getNodeValue();        }catch(Exception e){growthAraInfo        = "";}
	try{lefStleInfo          = doc.getElementsByTagName("lefStleInfo").item(0).getFirstChild().getNodeValue();          }catch(Exception e){lefStleInfo          = "";}
	try{smellCode            = doc.getElementsByTagName("smellCode").item(0).getFirstChild().getNodeValue();            }catch(Exception e){smellCode            = "";}
	try{toxctyInfo           = doc.getElementsByTagName("toxctyInfo").item(0).getFirstChild().getNodeValue();           }catch(Exception e){toxctyInfo           = "";}
	try{prpgtEraInfo         = doc.getElementsByTagName("prpgtEraInfo").item(0).getFirstChild().getNodeValue();         }catch(Exception e){prpgtEraInfo         = "";}
	try{etcEraInfo           = doc.getElementsByTagName("etcEraInfo").item(0).getFirstChild().getNodeValue();           }catch(Exception e){etcEraInfo           = "";}
	try{managelevelCode      = doc.getElementsByTagName("managelevelCode").item(0).getFirstChild().getNodeValue();      }catch(Exception e){managelevelCode      = "";}
	try{grwtveCode           = doc.getElementsByTagName("grwtveCode").item(0).getFirstChild().getNodeValue();           }catch(Exception e){grwtveCode           = "";}
	try{grwhTpCode           = doc.getElementsByTagName("grwhTpCode").item(0).getFirstChild().getNodeValue();           }catch(Exception e){grwhTpCode           = "";}
	try{winterLwetTpCode     = doc.getElementsByTagName("winterLwetTpCode").item(0).getFirstChild().getNodeValue();     }catch(Exception e){winterLwetTpCode     = "";}
	try{hdCode               = doc.getElementsByTagName("hdCode").item(0).getFirstChild().getNodeValue();               }catch(Exception e){hdCode               = "";}
	try{frtlzrInfo           = doc.getElementsByTagName("frtlzrInfo").item(0).getFirstChild().getNodeValue();           }catch(Exception e){frtlzrInfo           = "";}
	try{soilInfo             = doc.getElementsByTagName("soilInfo").item(0).getFirstChild().getNodeValue();             }catch(Exception e){soilInfo             = "";}
	try{watercycleSprngCode  = doc.getElementsByTagName("watercycleSprngCode").item(0).getFirstChild().getNodeValue();  }catch(Exception e){watercycleSprngCode  = "";}
	try{watercycleSummerCode = doc.getElementsByTagName("watercycleSummerCode").item(0).getFirstChild().getNodeValue(); }catch(Exception e){watercycleSummerCode = "";}
	try{watercycleAutumnCode = doc.getElementsByTagName("watercycleAutumnCode").item(0).getFirstChild().getNodeValue(); }catch(Exception e){watercycleAutumnCode = "";}
	try{watercycleWinterCode = doc.getElementsByTagName("watercycleWinterCode").item(0).getFirstChild().getNodeValue(); }catch(Exception e){watercycleWinterCode = "";}
	try{dlthtsManageInfo     = doc.getElementsByTagName("dlthtsManageInfo").item(0).getFirstChild().getNodeValue();     }catch(Exception e){dlthtsManageInfo     = "";}
	try{speclmanageInfo      = doc.getElementsByTagName("speclmanageInfo").item(0).getFirstChild().getNodeValue();      }catch(Exception e){speclmanageInfo      = "";}
	try{fncltyInfo           = doc.getElementsByTagName("fncltyInfo").item(0).getFirstChild().getNodeValue();           }catch(Exception e){fncltyInfo           = "";}

	try{managedemanddoCode   = doc.getElementsByTagName("managedemanddoCode").item(0).getFirstChild().getNodeValue();   }catch(Exception e){managedemanddoCode   = "";}
	
	if(resultCode.equals("00")){
%>
<header>
		<nav class="navbar navbar-expand-md navbar-dark bg-dark"
			aria-label="main-navbar">
			<div class="container">
				<a class="navbar-brand" href="index.jsp">Gromi</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navBoard"
					aria-controls="navBoard" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navBoard">
					<ul class="navbar-nav me-auto mb-2 mb-sm-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.jsp">홈</a></li>
						<li class="nav-item"><a class="nav-link"
							href="recommend/recommend.html">식물 추천</a></li>
						<li class="nav-item"><a class="nav-link" href="#">블로그</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="board/viewBoard.jsp?boardType=free">자유 게시판</a></li>
								<li><a class="dropdown-item"
									href="board/viewBoard.jsp?boardType=QA">Q&A 게시판</a></li>
								<li><a class="dropdown-item"
									href="board/viewBoard.jsp?boardType=sale">분양 게시판</a></li>
							</ul></li>
					</ul>

					<div class="justify-content-end">
						<ul class="navbar-nav me-auto mb-2 mb-sm-0">
							<li class="nav-item dropdown">
								<%
								if (uid == null) {
								%> <a class="nav-link dropdown-toggle" href="#"
								data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="login/signin.jsp">로그인</a></li>
									<li><a class="dropdown-item" href="login/signup.jsp">회원가입</a></li>
								</ul> <%
 } else {
 %> <a class="nav-link dropdown-toggle" href="#"
								data-bs-toggle="dropdown" aria-expanded="false"><%=uname%></a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">개인정보수정</a></li>
									<li><a class="dropdown-item" href="login/logout.jsp">로그아웃</a></li>
								</ul> <%
 }
 %>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>

	</header>
	<h3><%= cntntsNo%></h3>
	
	<table class="table"  border="1" cellspacing="0" cellpadding="0">
		<colgroup>
			<col width="15%">
			<col width="*">
		</colgroup>
		<tr>
            <th>식물학명</th>
            <td><%=plntbneNm%></td>
        </tr>
        <tr>
            <th>식물영명</th>
            <td><%=plntzrNm%></td>
        </tr>
        <tr>
            <th>유통명</th>
            <td><%=distbNm%></td>
        </tr>
        <tr>
            <th>과명</th>
            <td><%=fmlNm%></td>
        </tr>
        <tr>
            <th>원산지 정보</th>
            <td><%=orgplceInfo%></td>
        </tr>
        <tr>
            <th>조언 정보</th>
            <td><%=adviseInfo%></td>
        </tr>
        <tr>
            <th>성장 높이 정보</th>
            <td><%=growthHgInfo%></td>
        </tr>
        <tr>
            <th>성장 넓이 정보</th>
            <td><%=growthAraInfo%></td>
        </tr>
        <tr>
            <th>잎 형태 정보</th>
            <td><%=lefStleInfo%></td>
        </tr>
        
        <tr>
            <th>관리수준 코드</th>
            <td><%=managelevelCode%></td>
        </tr>
        <tr>
            <th>생장속도 코드</th>
            <td><%=grwtveCode%></td>
        </tr>
        <tr>
            <th>생육 온도 코드</th>
            <td><%=grwhTpCode%></td>
        </tr>
        <tr>
            <th>겨울 최저 온도 코드</th>
            <td><%=winterLwetTpCode%></td>
        </tr>
        <tr>
            <th>습도 코드</th>
            <td><%=hdCode%></td>
        </tr>
        <tr>
            <th>비료 정보</th>
            <td><%=frtlzrInfo%></td>
        </tr>
        <tr>
            <th>토양 정보</th>
            <td><%=soilInfo%></td>
        </tr>
        
        <tr>
            <th>물주기 여름 코드</th>
            <td><%=watercycleSummerCode%></td>
        </tr>
        
        <tr>
            <th>물주기 겨울 코드</th>
            <td><%=watercycleWinterCode%></td>
        </tr>
        
       
        <tr>
            <th>관리요구도 코드</th>
            <td><%=managedemanddoCode%></td>
        </tr>
	</table>
<%
	}else{
		out.println(resultMsg);
	}
%>
<input type="button" onclick="javascript:fncList();" value="목록"/>
<form name="searchApiForm">
<%
String[] searchNmArr = {"pageNo", "sType", "sText", "wordType", "word", "lightChkVal", "grwhstleChkVal", "lefcolrChkVal", "lefmrkChkVal", "flclrChkVal", "fmldecolrChkVal", "ignSeasonChkVal", "winterLwetChkVal", "priceType", "priceTypeSel", "waterCycleSel"};
for(int i=0; i<searchNmArr.length; i++){
	out.println("<input type='hidden' name='"+searchNmArr[i]+"' value='"+request.getParameter(searchNmArr[i])+"' />");
}
%>
</form>
<script type="text/javascript">
//목록이동
function fncList(){
	with(document.searchApiForm){
		method="get";
		action = "gardenList.jsp";
		target = "_self";
		submit();
	}
}
</script>
</body>
</html>