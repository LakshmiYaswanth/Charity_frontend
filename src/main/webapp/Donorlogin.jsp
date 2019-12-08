<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Donor Login</title>
</head>
<body class="bg-light">
<form >
         <jsp:include page="header.jsp"></jsp:include>
    <div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
        <div class="col-md-6 col-lg-3 text-center">
            <h5 class="text-secondary" style="padding: 10px 0">Donor Login</h5>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            USERNAME
                        </div>
                    </div>
                    <input type="Name" name=" name" id="name" class="form-control" placeholder="Name" required/>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            PASSWORD
                        </div>
                    </div>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                </div>
            </div>
            <button type="submit" class="btn btn-outline-secondary" onclick="donorLogin()">Login</button>
           <input type="reset" class="btn btn-outline-danger"/>
            <p><a href="donorRegister.jsp">Forgot password</a></p>
        </div>
    </div>
    </form>
     <script src="asserts/js/jquery-3.4.1.min.js"></script>
  	<script src="asserts/js/bootstrap.min.js"></script>
    <script>
    
function donorLogin()
        {
	event.preventDefault();
            var name = $('#name').val();
            var password = $('#password').val();
            var formData = "name="+name+"&password="+password;
            var url = "http://localhost:8080/charityapp/DonorLoginServlet?"+formData;
            //var url ="http://ec2-13-127-195-177.ap-south-1.compute.amazonaws.com:8080/charity-api/Donorloginservlet?"+formData
                        $.getJSON(url,function(data){
                       	 console.log(data);
                       	 //resData = JSON.parse(data);
                       	 resData = data;
                    	 console.log("resData=>"+JSON.stringify(resData));
                         if(resData == null) {
                        	 $('input[type="text"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
                        	 $('input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
                        	 alert("Invalid username or password");
                        	 }else{
                            alert("donor Login success");
                               window.location.replace('donorHome.jsp');
                                localStorage.setItem('Donor_Data',JSON.stringify(resData));
                        	 }
                       	 
                        });
          
        }
        </script> 
        </body>
</html>