<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Used for Bootsrap and jquery-->
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title>Edit</title>
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

    Currently your user is:
        <table class="table">
            <thead>
                <tr>
                    
                    <th scope="col">Username</th>
                    <th scope="col">Password</th>
                    <th scope="col">Email</th>
                    <th scope="col">billing address</th>
                    <th scope="col">delivery address</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.email}</td>
                    <td>${user.billingAddress}</td>
                    <td>${user.deliveryAddress}</td>
                    
                </tr>
            </tbody>
        </table>

        <br>
        <br>

        <form>
            <div class="form-group">
                <label for="password">Username</label>
                <input type="password" class="form-control" id="username" >
              </div>
            <div class="form-group">
              <label for="email">Email address</label>
              <input type="email" class="form-control" id="email" aria-describedby="email">
              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" class="form-control" id="password">
            </div>
            <div class="form-group">
                <label for="billingAddress">billingAddress</label>
                <input type="text" class="form-control" id="billingAddress">
              </div>
              <div class="form-group">
                <label for="deliveryAddress">deliveryAddress</label>
                <input type="text" class="form-control" id="deliveryaddress" >
              </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="checkbox">
              <label class="form-check-label" for="checkbox">confirm</label>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>



           <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            


</body>
</html>