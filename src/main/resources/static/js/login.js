/**
 * 
 */



function validateInput(){
	const email = document.getElementById("email");
	const pw = document.getElementById("password");
	const firstName = document.getElementById("firstName");
	const lastName = document.getElementById("lastName");
	const idCard = document.getElementById("idCard");
	const phone = document.getElementById("phone");
	const pw2 = document.getElementById("password2");
	const address = document.getElementById("address");
	
	
	let emailClean = DOMPurify.sanitize(email.value, {SAFE_FOR_TEMPLATES: true});
	let pwClean = DOMPurify.sanitize(pw.value, {SAFE_FOR_TEMPLATES: true});
	let firstNameClean = DOMPurify.sanitize(firstName.value, {SAFE_FOR_TEMPLATES: true});
	let lastNameClean = DOMPurify.sanitize(lastName.value, {SAFE_FOR_TEMPLATES: true});
	let idCardClean = DOMPurify.sanitize(idCard.value, {SAFE_FOR_TEMPLATES: true});
	let phoneClean = DOMPurify.sanitize(phone.value, {SAFE_FOR_TEMPLATES: true});
	let pw2Clean = DOMPurify.sanitize(pw2.value, {SAFE_FOR_TEMPLATES: true});
	let addressClean = DOMPurify.sanitize(address.value, {SAFE_FOR_TEMPLATES: true});
	
	
	email.value=emailClean;
	pw.value=pwClean;
	firstName.value=firstNameClean;
	lastName.value=lastNameClean;
	idCard.value=idCardClean;
	phone.value=phoneClean;
	pw2.value=pw2Clean;
	address.value=addressClean;
}

function validateEditProfile(){
	const firstName = document.getElementById("firstName");
	const lastName = document.getElementById("lastName");
	const idCard = document.getElementById("idCard");
	const phone = document.getElementById("phone");
	const address = document.getElementById("address");
	
	let firstNameClean = DOMPurify.sanitize(firstName.value, {SAFE_FOR_TEMPLATES: true});
	let lastNameClean = DOMPurify.sanitize(lastName.value, {SAFE_FOR_TEMPLATES: true});
	let idCardClean = DOMPurify.sanitize(idCard.value, {SAFE_FOR_TEMPLATES: true});
	let phoneClean = DOMPurify.sanitize(phone.value, {SAFE_FOR_TEMPLATES: true});
	let addressClean = DOMPurify.sanitize(address.value, {SAFE_FOR_TEMPLATES: true});
	
	firstName.value=firstNameClean;
	lastName.value=lastNameClean;
	idCard.value=idCardClean;
	phone.value=phoneClean;
	address.value=addressClean;
	
	console.log(firstName.value);
	console.log(lastName.value);
	console.log(idCard.value);
	console.log(phone.value);
	console.log(address.value);
	
		
}