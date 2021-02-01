<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
		  <a class="navbar-brand" href="#">MyMusic</a>
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			
			  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
				  <li class="nav-item">
				  <a class="nav-link active" aria-current="page" href="home">Home</a>
				  </li>
				  
				  <c:set var="user" scope="session" value= "<%= request.getSession().getAttribute(\"sesname\")%>">
					 </c:set>
				  <c:set var="exists" scope="session" value= "<%= request.getSession().getAttribute(\"sesname\") != null %>">
					 </c:set>
				  
				  <c:choose>
					  <c:when test = "${exists}">
						  <li class="nav-item">
							  <a class="nav-link active" aria-current="page" href="editUser">${user.username}</a>
							  
						  </li>
					  </c:when>
					  <c:otherwise>
						  <li class="nav-item">
							  <a class="nav-link active" aria-current="page" href="login">Login</a>
						  </li>
					  </c:otherwise>
  
				  </c:choose>  
				  
			  
			 
				  <c:set var="var" scope="session" value= "<%=  request.getSession().getAttribute(\"role\") != null && request.getSession().getAttribute(\"role\").equals(\"admin\")%>">
				  </c:set>
				  
				  <c:choose>
					  <c:when test = "${var}">
						  <li class="nav-item">
							  <a class="nav-link" href="addProduct">Add Products</a>
						  </li>
						  <li class="nav-item">
							  <a class="nav-link" href="editProducts">Edit Products</a>
						  </li>
					  </c:when>
  
				  </c:choose>  
  
				  <li class="nav-item">
					  <a class="nav-link" href="shoppingcart">shoppingcart</a>
				  </li>
			  
			  
				  
			  
				</ul>
			
			<form class="d-flex">
			  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			  <button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		  </div>
		</div>
	  </nav>

	<h1>Welcome, please make an account</h1>
	<br>
	<form action="register" method="post">
		Username: <input type="text" name="username">
		Password: <input type="text" name="password">
		Email: <input type="text" name="email">
		<br>
		<button type="submit">Submit</button>
	</form>
</body>
</html>