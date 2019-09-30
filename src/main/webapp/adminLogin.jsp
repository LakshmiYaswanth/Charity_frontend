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
         <jsp:include page="header.jsp"></jsp:include>
    <div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
        <div class="col-md-6 col-lg-3 text-center" style="box-shadow: 5px 8px 18px -8px">
            <h5 class="text-secondary" style="padding: 10px 0">Admin Login</h5>
            <form>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            Name
                        </div>
                    </div>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Name" required/>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            Password
                        </div>
                    </div>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                </div>
            </div>
            <button type="submit" class="btn btn-outline-secondary" onclick="adminLogin()">Login</button>
            <input type="reset" class="btn btn-outline-danger"/>
            </form>
        </div>
    </div>
     <script src="asserts/js/jquery-3.4.1.min.js"></script>
  	<script src="asserts/js/bootstrap.min.js"></script>
<script>


//$(function(){
	///console.log('this is jquery!');
//})
function adminLogin()
        {
          event.preventDefault();
            var name = $('#name').val();
            var password = $('#password').val();
            if( name =='' || password ==''){
            	$('input[type="text"],input[type="name"]').css("border","2px solid red");
            	$('input[type="text"],input[type="password"]').css("box-shadow","0 0 3px red");
            	alert("Please fill all fields...!!!!!!");
            	}else{
            var formData ="name="+name+"&password="+password;
            var url="http://localhost:8080/charity-api/Adminloginservlet?"+formData;
            	 $.getJSON(url,function(data){
                	 resData = (data);
                	 console.log("resData=>"+resData);
                     if(resData.isLoggedin == false) {
                    	 $('input[type="text"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
                    	 $('input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
                    	 alert("Invalid username or password");
                    	 }else if(resData.isLoggedin == true){
	                    	 //$("form")[0].reset();
	                    	 //$('input[type="text"],input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
	                    	 alert("Admin Login success");
	                    	 window.location.replace('AdminHome.jsp');
	                         localStorage.setItem('admin_Data',JSON.stringify(data));
                    	 }
            	 });
            	 }
            	 }
              
         
</script>
</body>
</html>