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
	
	
	let emailClean = DOMPurify.sanitize(email.value,{ALLOWED_TAGS: ['b']});
	let pwClean = DOMPurify.sanitize(pw.value,{ALLOWED_TAGS: ['b']});
	let firstNameClean = DOMPurify.sanitize(firstName.value,{ALLOWED_TAGS: ['b']});
	let lastNameClean = DOMPurify.sanitize(lastName.value,{ALLOWED_TAGS: ['b']});
	let idCardClean = DOMPurify.sanitize(idCard.value,{ALLOWED_TAGS: ['b']});
	let phoneClean = DOMPurify.sanitize(phone.value,{ALLOWED_TAGS: ['b']});
	let pw2Clean = DOMPurify.sanitize(pw2.value,{ALLOWED_TAGS: ['b']});
	
	
	email.value=emailClean;
	pw.value=pwClean;
	firstName.value=firstNameClean;
	lastName.value=lastNameClean;
	idCard.value=idCardClean;
	phone.value=phoneClean;
	pw2.value=pw2Clean;
	
}

function validateEditProfile(){
	const firstName = document.getElementById("firstName");
	const lastName = document.getElementById("lastName");
	const idCard = document.getElementById("idCard");
	const phone = document.getElementById("phone");
	const address = document.getElementById("address");
	
	let firstNameClean = DOMPurify.sanitize(firstName.value,{ALLOWED_TAGS: ['b']});
	let lastNameClean = DOMPurify.sanitize(lastName.value,{ALLOWED_TAGS: ['b']});
	let idCardClean = DOMPurify.sanitize(idCard.value,{ALLOWED_TAGS: ['b']});
	let phoneClean = DOMPurify.sanitize(phone.value,{ALLOWED_TAGS: ['b']});
	let addressClean = DOMPurify.sanitize(address.value,{ALLOWED_TAGS: ['b']});
	
	firstName.value=firstNameClean;
	lastName.value=lastNameClean;
	idCard.value=idCardClean;
	phone.value=phoneClean;
	address.value=addressClean;
	
		
}

function validateVendorInput(){
	const id = document.getElementById("_id");
	const name = document.getElementById("name");
	const bio = document.getElementById("bio");
	const avatarFile = document.getElementById("avatarFile");
	const coverFile = document.getElementById("coverFile");
	const featuredImagesFile = document.getElementById("featuredImagesFile");
	
	let idClean = DOMPurify.sanitize(id.value,{ALLOWED_TAGS: ['b']});
	let nameClean = DOMPurify.sanitize(name.value,{ALLOWED_TAGS: ['b']});
	let bioClean = DOMPurify.sanitize(bio.value,{ALLOWED_TAGS: ['b']});
	let avtClean = DOMPurify.sanitize(avatarFile.value,{ALLOWED_TAGS: ['b']});
	let coverFileClean = DOMPurify.sanitize(coverFile.value,{ALLOWED_TAGS: ['b']});
	let featuredImgClean = DOMPurify.sanitize(featuredImagesFile.value,{ALLOWED_TAGS: ['b']});
	
	id.value = idClean;
	name.value = nameClean;
	bio.value = bioClean;
	avatarFile.value = avtClean;
	coverFile.value = coverFileClean;
	featuredImagesFile.value = featuredImgClean;
	
}