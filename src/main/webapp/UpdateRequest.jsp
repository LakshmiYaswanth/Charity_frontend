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
        <form onsubmit="Updaterequest()">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h5>Fund request</h5>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                RequestId
                            </div>
                        </div>
                        <input type="number" min="1" name="requestId" id="requestId" class="form-control" placeholder="requestId" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Fund Type
                            </div>
                        </div>
                        <select id="fundType" class="form-control">
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
                        <input type="number"min="1" name="amount" id="amount" class="form-control" placeholder="amount" required>
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
  	function Updaterequest()
{
	event.preventDefault();
    let requestId = $('#requestId').val();
    let fundType = $('#fundType').val();
    let amount = $('#amount').val();
    let date = $('#expireDate').val();
    var formData = "requestId="+requestId+"&fundType="+fundType+"&amount="+amount+"&date="+date;
    var url = "http://localhost:8080/charity-api/Requestupdateservlet?" + formData;
    //var url ="http://ec2-13-127-195-177.ap-south-1.compute.amazonaws.com:8080/charity-api/Requestupdateservlet?" + formData;
    console.log(url);
    $.getJSON(url,function(response){
       alert('Update success!'); 
       window.location.replace('AdminHome.jsp');
    });
} 
</script> 
</body>
</html>	
  	
  	
  	
  	
  	
  	
  	
  	
  	