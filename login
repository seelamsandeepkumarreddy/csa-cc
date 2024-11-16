

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Travel Website</title>
    <link rel="perconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/
    css2?family=poppins:wght@300@display=swap" rel="stylesheet">
    <link rel="stylesheet"type="text/css"href="style.css">
    <style>* {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }
    
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background: url(v.jpg) no-repeat center fixed;
        background-color: #f3f4f6;
    }
    div{
        color:white;
    }
    .login-container {
        background-color: transparent;
        background: url(gr.jpg) no-repeat center fixed;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }
    .login-container h2 {
        margin-bottom: 1.5rem;
        font-size: 1.8rem;
        color: black;
    }
    
    .login-form .form-group {
        margin-bottom: 1.2rem;
        text-align: left;
    }
    
    .login-form label {
        display: block;
        color:white;
        margin-bottom: 0.5rem;
        font-weight: bold;
        color: black;
    }
    
    .login-form input {
        width: 100%;
        padding: 0.75rem;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 1rem;
        color: grey;
    }
    
    .login-form input:focus {
        border-color: #007;
        outline: none;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }
    
    .btn {
        width: 100%;
        padding: 0.75rem;
        background-color: grey;
        border: none;
        border-radius: 4px;
        font-size: 1rem;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    .btn:hover {
        background-color: green;
    }
    
    .login-container p {
        margin-top: 1rem;
        font-size: 0.9rem;
        color: white;
    }
    
    .login-container a {
        color: blue;
        text-decoration: none;
    }
    
    .login-container a:hover {
        text-decoration: underline;
    }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="su.php" method="POST" class="login-form">

            <div class="form-group">
                <label for="username">User Name</label>
                <input type="text" id="username" name="username" placeholder="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="password" required>
            </div>
            <button type="submit" class="btn" >Login</button>
        </form>
        <p>Don’t have an account? <a href="sign up.html">Sign up here</a></p>
    </div>
</body>
</html>





<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
       $username = filter_input(INPUT_POST, 'username');
    $password = filter_input(INPUT_POST, 'password');

    if (!empty($username) && !empty($password)) 
{
        
        $host = "localhost";
        $dbusername = "root";
        $dbpassword = "";
        $dbname = "travel";

        $conn = new mysqli($host, $dbusername, $dbpassword, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        } else {
            
            $sql = "SELECT * FROM users1 WHERE username = ?";


            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $username); // 's' is for string
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) 
{
                    
                    $_SESSION['username'] = $username;
                    echo "Logged in successfully!";
                    header("refresh:3; url=login.html");
                    exit();
                } else {
                    echo "logged in  successful.";
                   header("refresh:3; url=home.html");

                }
            } else {
                echo "No user found with that username. Please sign up.";
            }

            $stmt->close();
            $conn->close();
        }
    } else {
        echo "Please fill in both fields.";
    }
}
?>








<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
       $username = filter_input(INPUT_POST, 'username');
    $password = filter_input(INPUT_POST, 'password');

    if (!empty($username) && !empty($password)) 
{
        
        $host = "localhost";
        $dbusername = "root";
        $dbpassword = "";
        $dbname = "travel";

        $conn = new mysqli($host, $dbusername, $dbpassword, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        } else {
            
            $sql = "SELECT * FROM users1 WHERE username = ?";


            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $username); // 's' is for string
            if($stmt->execute())
            {

           
                    echo "Logged in successfully!";
                    header("refresh:3; url=login.html");
                    exit();
              }
             else
               {
                  echo "error";
                       }

            $stmt->close();
            $conn->close();
        }
    } else {
        echo "Please fill in both fields.";
    }
}
?>

