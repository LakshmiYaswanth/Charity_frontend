<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Request list</title>
</head>
<body>

	<jsp:include page="adminheader.jsp"></jsp:include>
	<div class="row justify-content-center">
		<div class="col-md-8">
		<h5 align="center">Request List</h5>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Request Id</th>
						<th>Fund Type</th>
						<th>Amount(Rs)</th>
						<th>Expire Date</th>
						<th>Description</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody id="requestList"></tbody>
			</table>
		</div>
	</div>
	<script src="assets/js/jquery-3.4.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
	$(function (){
        console.log('This is jquery!');
        let url = "http://localhost:8080/charityapp/ListFundRequestServlet";
        $.getJSON(url,(res)=>{
        	 console.log("res=>"+res);
            // var data = JSON.parse(res);
             var data=res;
             let requestList = "";
             for(let don of data)
             {
                 requestList += "<tr><td>"+don.requestId+"</td>";
                 requestList += "<td>"+don.fundType+"</td>";
                 requestList += "<td>"+don.amount+"</td>";
                 requestList += "<td>"+don.expireDate.day+"/"+don.expireDate.month+"/"+don.expireDate.year+"</td>";
                 requestList += "<td>"+don.description+"</td>";
                 requestList += "<td>"+don.status+"</td>";
                 requestList += "</tr>";
             }
             $('#requestList').html(requestList);
         });
 	}) 
	</script>
	</body>
	</html>
