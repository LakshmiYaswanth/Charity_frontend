<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<title>Donor List</title>
</head>
<body>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<jsp:include page="adminheader.jsp"></jsp:include>
	<div class="row justify-content-center">
		<div class="col-md-8">
			<table class="table table-hover">
			<h5 align="center">Donor list</h5>
				<thead>
					<tr>
						<th>Donor Id</th>
						<th>Name</th>
						<th>Age</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody id="donorList"></tbody>
			</table>
		</div>
	</div>
	<script src="assets/js/jquery-3.4.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
	$(function donerlist(){
        console.log('This is jquery!');
        let url = "http://localhost:8080/charityapp/ListDonorServlet";
       // let url="http://ec2-13-127-195-177.ap-south-1.compute.amazonaws.com:8080/charity-api/DonorListservlet";
        $.getJSON(url,(res)=>{
           // console.log("res"+res);
           // var data = JSON.parse(res);
            var data=res;
            let donorList = "";
            for(let donor of data)
            {
                donorList += "<tr><td>"+donor.donorId+"</td>";
                donorList += "<td>"+donor.name+"</td>";
                donorList += "<td>"+donor.age+"</td>";
                donorList += "<td>"+donor.email+"</td>";
                donorList += "</tr>";
            }
            $('#donorList').html(donorList);
        });
	}) 
	</script>
	</body>
	</html>
	