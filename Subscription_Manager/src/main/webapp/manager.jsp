<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <!-- Materialize CSS CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <!-- Custom CSS -->
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }

        .container {
            max-width: 960px;
            margin: 0 auto;
            padding: 0 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        #logout {
            background-color: #ff6347;
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-left: 10px;
            transition: background-color 0.3s ease;
        }

        #logout:hover {
            background-color: #cc4c39;
        }

        .user-info {
            text-align: right;
        }

        .user-info span {
            margin-right: 10px;
        }

        .user-info a {
            color: #fff;
            text-decoration: none;
        }

        main {
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            width: 80%;
            margin-left: 180px;
            /* align-items: ; */
        }

        .section {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: calc(33% - 20px);
            transition: transform 0.3s ease;

        }

        .box h2 {
            margin-top: 0;
            font-size: 0.5rem;
            margin-bottom: 20px;
            color: #333;
        }

        .btn {
            display: flex;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            justify-content: center;
            align-items: center;
        }

        .btn:hover {
            background-color: #555;
        }

        .form-container {
            display: none;
            background-color: #f9f9f9;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .form-container.active {
            display: block;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .section:nth-child(7) {
            margin: 0 auto;
            /* Center the box horizontally */
            max-width: 500px;
            /* Adjust the max-width as needed */
        }

        /* Side Menu */
        .side-menu {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #333;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .side-menu .profile-info {
            padding: 20px;
            color: #fff;
        }

        .side-menu a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: #fff;
            display: block;
            transition: 0.3s;
        }

        .side-menu a:hover {
            background-color: #555;
        }

        .side-menu .close-btn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 10px;
            margin-left: 50px;
        }

        .side-menu .close-btn:hover {
            color: #ccc;
            text-decoration: none;
            cursor: pointer;
        }

        #adminProfileBtn {
            cursor: pointer;
        }

        .menu-icon {
            cursor: pointer;
            font-size: 24px;
            margin-right: 10px;
        }

        /* New CSS for adjusting layout when side menu is opened */
        .container {
            display: flex;
            justify-content: space-between;
        }

        .menu-icon {
            cursor: pointer;
            font-size: 24px;
            margin-right: 10px;
        }

        .side-menu {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #333;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .side-menu .profile-info {
            padding: 20px;
            color: #fff;
        }

        .side-menu a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: #fff;
            display: block;
            transition: 0.3s;
        }

        .side-menu a:hover {
            background-color: #555;
        }

        .side-menu .close-btn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        .side-menu .close-btn:hover {
            color: #ccc;
            text-decoration: none;
            cursor: pointer;
        }

        /* New CSS for adjusting layout when side menu is opened */
        .container {
            display: flex;
            justify-content: space-between;
        }

        .menu-icon {
            cursor: pointer;
            font-size: 24px;
            margin-right: 10px;
        }

        .main-content {
            margin-left: 0;
            /* Added */
            transition: margin-left 0.5s;
            /* Added */
        }

        .side-menu {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #333;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .side-menu .profile-info {
            padding: 20px;
            color: #fff;
        }

        .side-menu a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: #fff;
            display: block;
            transition: 0.3s;
        }

        .side-menu a:hover {
            background-color: #555;
        }

        .side-menu .close-btn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        .side-menu .close-btn:hover {
            color: #ccc;
            text-decoration: none;
            cursor: pointer;
        }

        /* New CSS for sliding effect */
        .slide-left {
            transform: translateX(140px);
            /* Adjust the distance as per your side menu width */
            transition: transform 0.5s ease;
        }
    </style>
    
    <%
  
    String institute = (String) session.getAttribute("Institute");
%>

</head>

<body>

    <header>
        <div class="container">
           
            <h1 id="adminProfileBtn"><%= institute %></h1>
            <div class="user-info">
                <span>Welcome, <span id="adminName">Admin</span></span>
                <a href="login.html" id="logout" class="btn">Logout</a>
            </div>
        </div>
    </header>

    <!-- Side Menu -->
    <div id="sideMenu" class="side-menu">
        <a href="#" class="close-btn" id="closeBtn">&times;</a>
        <div class="profile-info">
            <h2>Admin Profile</h2>
            <!-- Add profile information here -->
        </div>
    </div>

    <main>
        <div class="section">
            <h4>Add New Student</h4>
            <button id="addStudentBtn" class="btn waves-effect waves-light">Add Student</button>
            <form id="addStudentForm"  action="AddMember" class="form-container card" method="post" >
                <input name="MemberName" type="text" placeholder="Member Name" required>
                <input name="MemberId" type="text" placeholder="Member ID" required>
                <input name="phoneNumber" type="text" placeholder="Phone Number" required>
                <label for="joining_date">Enter joining date</label>
                <input name="joining_date" type="date" placeholder="Joining date" required>
                 <input name="subscription_month" type="text" placeholder="Total Months of Subscription" required>
                <button class="btn waves-effect waves-light" type="submit">Submit</button>
            </form>
        </div>

        <div class="section">
            <h4>Delete Student</h4>
            
            <button id="deleteStudentBtn" class="btn waves-effect waves-light">Delete Student</button>
            <form id="deleteStudentForm" action="DeleteMember"  method="post" class="form-container card">
               												
                <input name="studentToDelete" type="text" placeholder="Enter Student ID to Delete" required>
                <button class="btn waves-effect waves-light" type="submit">Delete</button>
                
            </form>
            
        </div>

        <div class="section">
            <h4>Update Student Subscription</h4>
                <button id="updateSubscriptionBtn" class="btn waves-effect waves-light">Update Subscription</button>
                <form id="updateSubscriptionForm" action="UpdateSub"  method="post" class="form-container card">
                    <input name="studentId" type="text" placeholder="Enter Student Id"
                        required>
                    <input name="newSubscription" type="text" placeholder="extended month of subscription" required>
                    <button class="btn waves-effect waves-light" type="submit">Update Subscription</button>
                </form>
        </div>

        <div class="section">
            <h4>Display Student Payment Status</h4>
                <button id="displayPaymentStatusBtn" class="btn waves-effect waves-light">Display Payment
                    Status</button>
                <form id="displayPaymentStatusForm" action="DisplayOne.jsp" method="post" class="form-container card">
                    
                    <input name="studentId" type="text" placeholder="Enter Student ID" required>

                    <button class="btn waves-effect waves-light" type="submit">Check Status</button>
                </form>
        </div>

           <div class="section">
            <h4>Display All Student Information</h4>
                   <form action="DisplayAll.jsp">  <button class="btn waves-effect waves-light" type="submit">Display All Info</button></form>
                
        </div>


        <div class="section">
            <h4>Pending Payment Student List</h4>
                 <form action="PendingDetails.jsp">  <button class="btn waves-effect waves-light" type="submit">Pending Payments</button></form>
               
        </div>

    
    </main>

    <!-- Materialize JS CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
    
    		
    
        document.addEventListener('DOMContentLoaded', function () {
            const addStudentBtn = document.getElementById('addStudentBtn');
            const deleteStudentBtn = document.getElementById('deleteStudentBtn');
            const updateSubscriptionBtn = document.getElementById('updateSubscriptionBtn');
            const displayPaymentStatusBtn = document.getElementById('displayPaymentStatusBtn');
            
            

            const addStudentForm = document.getElementById('addStudentForm');
            const deleteStudentForm = document.getElementById('deleteStudentForm');
            const updateSubscriptionForm = document.getElementById('updateSubscriptionForm');
            const displayPaymentStatusForm = document.getElementById('displayPaymentStatusForm');
           
        

            addStudentBtn.addEventListener('click', function () {
                addStudentForm.classList.toggle('active');
                deleteStudentForm.classList.remove('active');
                updateSubscriptionForm.classList.remove('active');
                displayPaymentStatusForm.classList.remove('active');
              
                
            });

            deleteStudentBtn.addEventListener('click', function () {
                deleteStudentForm.classList.toggle('active');
                addStudentForm.classList.remove('active');
                updateSubscriptionForm.classList.remove('active');
                displayPaymentStatusForm.classList.remove('active');
             
             
            });

            updateSubscriptionBtn.addEventListener('click', function () {
                updateSubscriptionForm.classList.toggle('active');
                addStudentForm.classList.remove('active');
                deleteStudentForm.classList.remove('active');
                displayPaymentStatusForm.classList.remove('active');
              
              
            });

            displayPaymentStatusBtn.addEventListener('click', function () {
                displayPaymentStatusForm.classList.toggle('active');
                addStudentForm.classList.remove('active');
                deleteStudentForm.classList.remove('active');
                updateSubscriptionForm.classList.remove('active');
              
                
            });

         

          
        });

        document.addEventListener('DOMContentLoaded', function () {
            const adminProfileBtn = document.getElementById('adminProfileBtn');
            const sideMenu = document.getElementById('sideMenu');
            const closeBtn = document.getElementById('closeBtn');
            const menuIcon = document.getElementById('menuIcon'); // Added

            menuIcon.addEventListener('click', function () { // Added
                sideMenu.style.width = '250px';
            });

            adminProfileBtn.addEventListener('click', function () {
                sideMenu.style.width = '250px';
            });

            closeBtn.addEventListener('click', function () {
                sideMenu.style.width = '0';
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            const adminProfileBtn = document.getElementById('adminProfileBtn');
            const sideMenu = document.getElementById('sideMenu');
            const closeBtn = document.getElementById('closeBtn');
            const menuIcon = document.getElementById('menuIcon');
            const sections = document.querySelectorAll('.section');

            menuIcon.addEventListener('click', function () {
                sideMenu.style.width = '250px';
                sections.forEach(section => {
                    section.classList.add('slide-left');
                });
            });

            adminProfileBtn.addEventListener('click', function () {
                sideMenu.style.width = '250px';
                sections.forEach(section => {
                    section.classList.add('slide-left');
                });
            });

            closeBtn.addEventListener('click', function () {
                sideMenu.style.width = '0';
                sections.forEach(section => {
                    section.classList.remove('slide-left');
                });
            });
        });

    </script>
</body>

</html>