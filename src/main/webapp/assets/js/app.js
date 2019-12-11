function logout() {
	console.log('logout success!');
	localStorage.clear();
	window.location.replace("index.jsp");

}