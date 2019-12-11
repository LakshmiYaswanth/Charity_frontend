<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <title>Donor Register</title>
</head>
<body class="bg-light">
     <jsp:include page="header.jsp"></jsp:include>
    <div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
        <div class="col-md-6 col-lg-3 text-center">
            <h5 class="text-secondary" style="padding: 10px 0">Donor Register</h5>
            <form onsubmit="donorRegister()">
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    Name
                                </div>
                            </div>
                             <input type="text" name="name" id="name" pattern="[A-Za-z]{1,10}$" class="form-control" title="Enter only alphabets" placeholder="name" required/>
                        </div>
                    </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Email
                            </div>
                        </div>
                        <input type="email" name="email" id="email" class="form-control"pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Entre in email format" placeholder="Email" required/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Password
                            </div>
                        </div>
                     <input type="password" name="password" id="password" class="form-control" pattern="[A-Za-z]{1,10}$" title="Enter only alphabets" placeholder="Password" required/>
                    </div>
                </div>
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    Age
                                </div>
                            </div>
                            <input type="number" min="10" max="100"  name="Age" id="Age" class="form-control" placeholder="Age" required/>
                        </div>
                    </div>
                 <button type="submit"class="btn btn-outline-primary">Register</button>
                <input type="reset" class="btn btn-outline-danger"/>
                <br>
                </form>
                <p>Already using this App?Sign in <a href="donorlogin.jsp">Click here</a>.</p>
        </div>
    </div>
    
    <script src="assets/js/jquery-3.4.1.min.js"></script>
  	<script src="assets/js/bootstrap.min.js"></script>
<script>


function donorRegister()
{
	event.preventDefault();
    let name = $('#name').val();
    let email = $('#email').val();
    let password = $('#password').val();
    let Age = $('#Age').val();
    var formData = "name="+name+"&email="+email+"&password="+password+"&Age="+Age;
    var url = "http://localhost:8080/charityapp/DonorRegisterServlet";
    console.log(url);
    $.post(url,formData).then (function(response){
       alert('register success!');
      window.location.replace('donorlogin.jsp');
    });
} 
</script>
</body>
</html>