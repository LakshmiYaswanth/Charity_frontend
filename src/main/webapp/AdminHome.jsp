<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <title>Document</title>
        
</head>
<body>
        <jsp:include page="adminheader.jsp"></jsp:include>
        <form onsubmit="request()">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h5 align="center">Fund request</h5>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Fund Type
                            </div>
                        </div>
                         <input type="text" name="fundType" pattern="[A-Za-z]{1,40}$" id="FundType" class="form-control" placeholder="FundType" required>
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
                        <input type="date" id="expireDate" name="trip-start" value="2018-07-22" min="2018-01-01" max="2022-12-31" class="form-control" required>
                    </div>
                </div>
                
                 <div class="form-group text-center" >
                <button type="submit" class="btn btn-primary btn-lg center-block" >Send</button>
                </div>  
            </div>
        </div>
        </form>
    <script src="assets/js/jquery-3.4.1.min.js"></script>
  	<script src="assets/js/bootstrap.min.js"></script>
  	<script>
 
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
        var url = "http://localhost:8080/charityapp/FundRequestServlet";
        $.post(url,formData).then (function(data){
            console.log(data)
            alert('fund request success');
            console.log('fund request success!');
        });
    }
    </script>

</body>
</html>

