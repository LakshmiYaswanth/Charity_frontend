<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="asserts/css/bootstrap.min.css">
<title>Donor Home</title>

</head>
<body>
	<jsp:include page="donorHeader.jsp"></jsp:include>
	<div class="row justify-content-center">
		<div class="col-md-8">
			<select id="Fund_Type" class="form-control" onchange="ListRequest()">
				<option>--SELECT--</option>
				<option value="CLOTHS">CLOTHS</option>
				<option value="FOOD">Food</option>
				<option value="MEDICAL">Medical</option>
				<option value="OTHERS">Others</option>
			</select>
			<!--  <div class="row" id="transaction" style="display:none;">
            	<div class="col">
            		
            		<button onclick=""></button>
            	</div>
            </div>-->
			<table class="table">
				<thead>
					<tr>
						<th>Fund_Type</th>
						<th>Amount(Rs)</th>
						<th>Expired Date</th>
						<th>Amountfunded(Rs)</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody id="requestTable">

				</tbody>
			</table>
		</div>
	</div>

	<script src="asserts/js/jquery-3.4.1.min.js"></script>
	<script src="asserts/js/bootstrap.min.js"></script>
	<script>
	console.log();
	function logout()
  	{
  	  	console.log('logout success!');
  	  	localStorage.clear();
  	  	window.location.replace("Donorlogin.jsp");
  	}
	
		function donate(requestId) {
			/* Get donor details */
			var data = localStorage.getItem('Donor_Data');
			//var donorObj=data;
		    var donarObj = JSON.parse(data);
			console.log(donarObj);
			//donarObj.donor_id
			var amount = $("#amount").val();
			console.log("amountfunded=>" + amount);
			console.log("request_Id=>" + requestId);
			console.log("donor_Id=>" + donarObj.donorId);
			var formData ="amountfunded=" + amount + "&request_Id=" + requestId + "&donor_Id=" + donarObj.donorId;
			var url = "http://localhost:8080/charity-api/Transactionservlet?"
					+ formData;
			$.get(url, function(data) {
				console.log('transaction success!');
				console.log(data);
				alert('transaction success!');
			});

		}

		function ListRequest() {

			var Fund_Type = $('#Fund_Type').val();
			var formData = "Fund_type=" + Fund_Type;
			var url = "http://localhost:8080/charity-api/Requesttypeservlet?" + formData;
			console.log(url);
			$.get(url,function(datas) {
								var res=JSON.parse(datas);
								console.log(datas);
								var tbody = $('#requestTable');
								var content = "";
								for(let data of res)
								{
									content += '<tr><td>';
									content += data.fundType;
									content += '</td><td>';
									content += data.amountneeded
									content += '</td><td>';
									content += data.expireDate.day + "-"
											+ data.expireDate.month + "-"
											+ data.expireDate.year;
									content += '</td><td>';
									content += '<input type="number" id="amount" placeholder="amountfunded"/>';
									content += '</td><td>';
									var click = "donate('" + data.requestId + "')";
									content += '<button class="btn btn-outline-success" onclick=' + click + '>Donate</button>';
									content += '</td></tr>';
								}
								console.log(content);
								tbody.html(content);
							});
		}
	</script>
</body>
</html>