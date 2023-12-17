
	// Get the modal
	var modal = document.getElementById("searchModal");

	// Get the link that opens the modal
	var searchLink = document.querySelector("#navigation a[href='#']");

	// When the user clicks on the link, open the modal
	searchLink.onclick = function() {
	  modal.style.display = "block";
	}

	// Function to close the modal
	function closeModal() {
	  modal.style.display = "none";
	}

	// Function to handle form submission
	function submitSearch() {
	  // Add your logic to handle the form submission here
	  closeModal(); // Close the modal after submission
	  return false; // Prevent the form from actually submitting
	}

	// Close the modal if the user clicks outside of it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    closeModal();
	  }
	}
