<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<jsp:include page="donorHeader.jsp"></jsp:include>
	<div class="row justify-content-center">
		<div class="col-md-8">
		<h5 align="center">donor fund Details</h5>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Name</th>
						<th>Fund type</th>
						<th>Amount_Funded(Rs)</th>
					</tr>
				</thead>
				<tbody id="fundingDetails"></tbody>
			</table>
		</div>
	</div>
	<script src="assets/js/jquery-3.4.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
	
	$(function donerlist(){
        console.log('This is jquery!');
        var data = localStorage.getItem('Donor_Data');
        var donorData = JSON.parse(data);
        var formData = "name="+donorData.name;
        let url = "http://localhost:8080/charityapp/DonorFundinglistServlet?"+formData;
        $.getJSON(url,(res)=>{
	        var donarObj = res;
		    console.log(donarObj);
		    //console.log("name=>" + donarObj.name);
            let donorList = "";
            for(let donor of donarObj)
            {
                donorList += "<tr><td>"+donor.name+"</td>";
                donorList += "<td>"+donor.request.fundType+"</td>";
                donorList += "<td>"+donor.transaction.amountfunded+"</td>";
                donorList += "</tr>";
            }
            $('#fundingDetails').html(donorList);
        });
	})
</script>
</body>
</html>