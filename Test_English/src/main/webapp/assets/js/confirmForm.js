
    function checkFormAdd(event) {
        var word = document.getElementById("word").value;
        var definition = document.getElementById("definition").value;
        // Add similar checks for other required fields

        if (word.trim() === '' || definition.trim() === '') {
            document.getElementById("warning").innerHTML = "Please fill in Word and Definition fields.";
            document.getElementById("warning").style.display = "block";
            event.preventDefault(); // Prevent form submission
            return false;
        }

        // Additional checks for other required fields

        return true; // Form is valid, allow submission
    }
    
    function checkErrorLogin(event) {
            var username = document.forms["login"]["username"].value;
            var password = document.forms["login"]["password"].value;

            if (username === "" || password === "") {
                // Nếu có trường nào chưa nhập, hiển thị thông báo và ngăn chặn submit
                document.getElementById("errorInfor").innerHTML = "Please fill in all fields.";

                event.preventDefault(); // Ngăn chặn việc submit
            }
        }