<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Demo: Getting an email address using the Google+ Sign-in
	button</title>
<!-- Include the API client and Google+ client. -->
<script src="https://plus.google.com/js/client:platform.js" async defer></script>
</head>

<body>
	<h1>gglog~~!!!</h1>
	<!-- Container with the Sign-In button. -->
	<div id="gConnect" class="button">
		<button class="g-signin" data-scope="email"
			data-clientid="948481018340-dkdp02e8rb5soim2ivitvqftm335nj6b.apps.googleusercontent.com"
			data-callback="onSignInCallback" data-theme="dark"
			data-cookiepolicy="single_host_origin"></button>
		<!-- Textarea for outputting data -->
		<div id="response" class="hide">
			<textarea id="responseContainer" style="width: 100%; height: 150px"></textarea>
		</div>
	</div>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script>
	/**
	 * Handler for the signin callback triggered after the user selects an account.
	 */
	function onSignInCallback(resp) {
		gapi.client.load('plus', 'v1', apiClientLoaded);
	}

	/**
	 * Sets up an API call after the Google API client loads.
	 */
	function apiClientLoaded() {
		gapi.client.plus.people.get({
			userId : 'me'
		}).execute(handleEmailResponse);
	}

	/**
	 * Response callback for when the API client receives a response.
	 *
	 * @param resp The API response object with the user email and profile information.
	 */
	function handleEmailResponse(resp) {
		var primaryEmail;
		for (var i = 0; i < resp.emails.length; i++) {
			if (resp.emails[i].type === 'account')
				primaryEmail = resp.emails[i].value;
		}
		document.getElementById('responseContainer').value = 'Primary email: '
				+ primaryEmail + '\n\nFull Response:\n' + JSON.stringify(resp);

		console.log("resp");
		console.log(resp);
		console.log(JSON.stringify(resp));
		console.log(resp.displayName);
		console.log(resp.emails[0].value);
		console.log(resp.gender);
		
		
	
		
		
		$.ajax({
			url: 'gglog/check',
			method: 'post',
		    dataType: 'JSON',		    
		    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		    data: {
		    	name : resp.displayName ,
		    	email: resp.emails[0].value,
		    	gender:resp.gender
		    	
		    } ,
		    success: function(re) {
		  
				console.log(re.name);
				console.log(re.email);
				console.log(re.gender);
		        
		    },
		});
		

	}
</script>
</body>

</html>