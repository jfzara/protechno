<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="index.jsp">PROTECHNO</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav ml-auto">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="index.jsp">Accueil</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Contactez-nous</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="panier.jsp">Panier</a>
		        </li>
		        
		     
		    <% if(auth != null) {  %>
		        <li class="nav-item">
				    <a class="nav-link" href="orders.jsp">Commandes</a>
				</li>
				<li class="nav-item">
		          <a class="nav-link" href="log-out">D�connexion</a>
		        </li>
		    <% }else{ %>
		    	 <li class="nav-item">
		          <a class="nav-link" href="login.jsp">Connexion</a>
		         </li>	
		    <%}%>
		         
		      </ul>
		    </div>
		  </div>
	  </div>
	</nav>