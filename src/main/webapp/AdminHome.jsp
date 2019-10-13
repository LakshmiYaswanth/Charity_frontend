<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="asserts/css/bootstrap.min.css">
    <title>Document</title>
        
</head>
<body>
        <jsp:include page="adminheader.jsp"></jsp:include>
        <form onsubmit="request()">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h5>Fund request</h5>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Fund Type
                            </div>
                        </div>
                        <select id="FundType" class="form-control">
                            <option>--Fund type--</option>
                            <option value="CLOTHS">Cloths</option>
                            <option value="FOOD">Food</option>
                            <option value="MEDICAL">Medical</option>
                            <option value="OTHERS">Others</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Amount(Rs)
                            </div>
                        </div>
                        <input type="number" name="amount"min=1   id="amount" class="form-control" placeholder="Amount" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Expire date
                            </div>
                        </div>
                        <input type="date" id="start" name="trip-start" value="2018-07-22" min="2018-01-01" max="2022-12-31" class="form-control" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-outline-secondary">Send</button>
            </div>
        </div>
    </form>
    <script src="asserts/js/jquery-3.4.1.min.js"></script>
  	<script src="asserts/js/bootstrap.min.js"></script>
  	<script>
  	console.log();
  	function logout()
  	{
  	  	console.log('logout success!');
  	  	localStorage.clear();
  	  	window.location.replace("index.jsp");
  	}
  	function request()
    {
  	    event.preventDefault();
    	var data = localStorage.getItem('admin_Data');
		var adminData = JSON.parse(data);
		//var id = JSON.stringify(adminData);
    	var AdminId = adminData.adminId;
        var FundType = $('#FundType').val();
        var amount = $('#amount').val();
        var date = $('#expireDate').val();
        console.log("adminId=>"+AdminId);
        console.log("fundType=>"+FundType);
        console.log("amount=>"+amount);
        console.log("expiredate=>"+date);
        var formData = "adminId="+AdminId+"&fundType="+FundType+"&amount="+amount+"&date="+date;
        console.log(formData);
        var url = "http://localhost:8080/charity-api/Requestservlet?"+formData;
        //var url= "http://ec2-13-127-195-177.ap-south-1.compute.amazonaws.com:8080/charity-api/Requestservlet?"+formData;
        $.get(url,function(data){
            console.log(data)
            alert('fund request success');
            console.log('fund request success!');
        });
    }
    </script>

</body>
</html>

