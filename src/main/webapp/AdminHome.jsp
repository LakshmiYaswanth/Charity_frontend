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
                                FUND TYPE<i class="text-danger">*</i>
                            </div>
                        </div>
                        <select id="requestType" class="form-control" required>
                            <option value="">--SELECT--</option>
                            <option value="EDUCATION">Education</option>
                            <option value="FOOD">Food</option>
                            <option value="MEDICAL">Medical</option>
                            <option value="AGRICULTURE">Agriculture</option>
                            <option value="OTHERS">Others</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                DESCRIPTION<i class="text-danger">*</i>
                            </div>
                        </div>
                         <input type="text" name="description" pattern="[A-Za-z -]{1,40}$" id="description" class="form-control" placeholder="description" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Amount(Rs)<i class="text-danger">*</i>
                            </div>
                        </div>
                        <input type="number" name="amount"min=1   id="amount" class="form-control" placeholder="Amount" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Expire Date<i class="text-danger">*</i>
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
        var description=$('#description').val();
        var amount = $('#amount').val();
        var date = $('#expireDate').val();
        console.log("adminId=>"+AdminId);
        console.log("fundType=>"+FundType);
        console.log("description=>"+description);
        console.log("amount=>"+amount);
        console.log("expiredate=>"+date);
        var formData = "adminId="+AdminId+"&fundType="+FundType+"&amount="+amount+"&date="+date+"&description="+description;
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

