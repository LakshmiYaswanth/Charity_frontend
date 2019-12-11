<script src="assets/js/app.js"></script>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <a class="navbar-brand" href="#">FundingApp</a>
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    
                        <li class="nav-item">
                            <a class="nav-link" href="adminHome.jsp">Add FundRequest</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listdonors.jsp">Donor List</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="listRequest.jsp">FundRequest List</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="updateRequest.jsp">Update FundRequest</a>
                        </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                        <a href="#" class="nav-link" id="username">Welcome Username</a> 
                        </li>
                        <li class="nav-item">
                    <a class="nav-link" href="#" id="logout" onclick="logout()">Logout</a>
                     </li>
                     </ul>
                
                </div>
            </nav>
            
            <script>
				function displayName(){
					 var data = localStorage.getItem('admin_Data');
					 var res=JSON.parse(data);
					 var name = res.name;
						var e = document.querySelector("#username");
						e.innerHTML = "Welcome "+ name;
					}
			  displayName();
            </script>
