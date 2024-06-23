<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>소셜감자</title>
    <style>
        body {
            background-image: url("potato.png"); 
            background-size: cover; 
            background-position: center; 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            text-align: center; 
        }

        .container {
            max-width: 600px; 
            margin: 0 auto; 
            padding: 20px; 
            background-color: rgba(255, 255, 255, 0.8); 
            border: 1px solid #ddd; 
            border-radius: 5px; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
            text-align: center; 
        }

        .container h1 {
            margin-bottom: 10px;
        }

        .container a {
            display: inline-block; 
            padding: 10px 20px; 
            background-color: #007bff; 
            color: white; 
            border: none; 
            border-radius: 5px; 
            text-decoration: none; 
            transition: background-color 0.3s ease; 
        }

        .container a:hover {
            background-color: #0056b3; 
        }

        @media (max-width: 600px) {
            .container {
                width: 90%; 
                padding: 1em; 
            }
        }
    </style>
</head>

<body>
    <div class="container">
    <h1>반가워요 소셜감자입니다.</h1>
    <a href="main.jsp">글쓰기를 위해 이동해주세요!</a>
    </div>
   
</body>