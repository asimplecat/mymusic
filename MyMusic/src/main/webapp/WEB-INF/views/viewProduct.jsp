<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="card" style="width: 18rem;">
        <img src="${product.img}" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">${prod.title}</h5>
          <p class="card-text">
          	${product.artist}<br>
          	${product.album}<br>
          	${product.genre}<br>
          	<br>
          	${product.price}<br>         
          </p>
          	         
		  <a href="/viewProduct/${product.prdId}" class="btn btn-primary">View Details</a>
		  <a href="/addtocart/${product.prdId}" class="btn btn-primary">add to cart</a>
    </div>
</body>
</html>