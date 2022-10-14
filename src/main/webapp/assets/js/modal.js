const span = document.getElementsByClassName('close')[0];
const modal = document.getElementById('myModal');
const modalDetailApplicant = document.getElementById('detailApplicant');

const confirmationText = document.querySelector("[apply=confirmation]");
const button = document.querySelector("[apply=button]");

const openApplyForm = (status = "apply", id) => {
    modal.style.display = 'block';
    modal.style.transform = 'translateY(-0.5rem)';
    
    if (status == "apply") {
		confirmationText.textContent = "Are you sure you will hire this job applicant?";
		button.textContent = "Apply";
		button.className = "btn";
	} else {
		confirmationText.textContent = "Are you sure you will reject this job applicant?";
		button.textContent = "Reject";
		button.className = "btn btn-red";
	}
	
	const statusEl = document.querySelector("[name=status]");
	const idEl = document.querySelector("[name=id]");
	
	statusEl.value = status;
	idEl.value = id;
	
};

const openDetailApplicant = (id) => {	
	fetch(`${window.location.origin}/get-detail-response?id=` + id, {
	    method: 'GET',
	    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    	}
	}).then(async (response) => {			
		response.json().then(job => {
			const expectedSalary = document.querySelector("[apply=salary]");
			const application = document.querySelector("[apply=application]");
								
			expectedSalary.textContent = '$' + job.expected_salary + ' / Month';
			application.textContent = job.applicant;
			
			modalDetailApplicant.style.display = 'block';
		})
		
	}).catch(err => {
	  console.log("Error nih", err);
	});
}
	
  span.onclick = () => {
    modal.style.display = 'none';
	modalDetailApplicant.style.display = 'none';
  };

  window.onclick = event => {
    if (event.target == modal || event.target == modalDetailApplicant) {
      modal.style.display = 'none';
      modalDetailApplicant.style.display = 'none';
    }
  };