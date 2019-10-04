
<?php

// Keys of Database connection
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "NAME_YOUR_DATABASE";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
    
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connection OK, ";
}
    
// Variables that await values ​​from the mobile application
$name = $_POST['a'];
$age = $_POST['b'];

// SQL command for the datas insert 
$sql = "INSERT INTO users (name, age) VALUES ('$name','$age');";

// Connection and query control
if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>

