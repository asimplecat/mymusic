<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>My Restaurant</title>
      
	    <%@ page import="com.hcl.model.User" %>
	    <!-- my css-->
	    <link rel='stylesheet' href='index.css'>
	
	    <!--Used for Bootsrap and jquery-->
	    
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
      
      
	<title>Home Page</title>
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
					<a class="nav-link" href="shoppingcart"></a>
				</li>
			
			
				
			
          	</ul>
          
          <form class="d-flex" action="search" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
	    
	<div class="card-columns mb-5">
  	<c:forEach items="${cart}" var="prod">

	
      <div class="card" style="width: 18rem;">
        <img src="${prod.img}" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">${prod.title}</h5>
          <p class="card-text">
          	${prod.artist}<br>
          	${prod.album}<br>
          	${prod.genre}<br>
          	<br>
          	${prod.price}<br>         
          </p>
          	    
        </div>
      </div>
  </c:forEach>
  </div>

	
	<a href="checkout" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">checkout</a>


      <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
    </body>
</html>