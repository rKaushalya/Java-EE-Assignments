<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/20/2023
  Time: 7:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Manage</title>
  <meta content="width=device-width initial-scale=1" name="viewport">
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/css/styles.css" rel="stylesheet">
  <link crossorigin="anonymous" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" rel="stylesheet">
  <style>
    ul > li {
      cursor: pointer;
    }
  </style>
</head>
<body>

<!--header-->
<header class="jumbotron bg-primary text-white p-3">
  <h1 class="position-absolute" id="nav"></h1>
  <ul class="list-group list-group-horizontal text-danger justify-content-end font-weight-bold">
    <li class="list-group-item bg-white" id="lnkHome"><a href="../index.jsp">Home</a></li>
    <li class="list-group-item bg-danger text-white" id="lnkCustomer"><a class="text-white" href="customer.jsp">Customer</a></li>
    <li class="list-group-item bg-white" id="lnkItem"><a href="item.jsp">Item</a></li>
    <li class="list-group-item bg-white" id="lnkOrders"><a href="purchase-order.jsp">Orders</a></li>
  </ul>
</header>

<!--customer content-->
<main class="container-fluid" id="customerContent">
  <section class="row">
    <div class="col-12 col-lg-4">
      <h1>Customer Registration</h1>
      <form id="customerForm">
        <div class="form-group">
          <label for="txtCustomerID">Customer ID</label>
          <input name="cusID" class="form-control" id="txtCustomerID" type="text">
          <span class="control-error" id="lblcusid"></span>
        </div>
        <div class="form-group">
          <label for="txtCustomerName">Customer Name</label>
          <input name="cusName" class="form-control" id="txtCustomerName" type="text">
          <span class="control-error" id="lblcusname"></span>
        </div>
        <div class="form-group">
          <label for="txtCustomerAddress">Customer Address</label>
          <input name="cusAddress" class="form-control" id="txtCustomerAddress" type="text">
          <span class="control-error" id="lblcusaddress"></span>
        </div>
        <div class="form-group">
          <label for="txtCustomerSalary">Customer Salary</label>
          <input name="cusSalary" class="form-control" id="txtCustomerSalary" type="text">
          <span class="control-error" id="lblcussalary"></span>
        </div>
        <div class="btn-group">
          <button  type="button" class="btn btn-primary" id="btnCustomer">
            Save Customer
          </button>
          <button  type="button" class="btn btn-danger"
                   id="btnCusDelete">Remove
          </button>
          <button  type="button" class="btn btn-warning"
                   id="btnUpdate">Update
          </button>
          <button type="button" class="btn btn-success" id="btnGetAll">Get All</button>
          <button  type="button" class="btn btn-danger" id="btn-clear1">Clear All</button>
        </div>
      </form>
    </div>
    <div class="col-12 col-lg-8 mt-3">
      <table class="table table-bordered table-hover">
        <thead class="bg-danger text-white">
        <tr>
          <th>Customer ID</th>
          <th>Customer Name</th>
          <th>Customer Address</th>
        </tr>
        </thead>
        <tbody id="tblCustomer">

        </tbody>
      </table>
    </div>
  </section>
</main>


<script src="../assets/js/jquery-3.6.1.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>


<!--bind a event on btn GetAll btn-->
<script>

  getAllCustomers();

  $("#btnGetAll").click(function () {
    getAllCustomers();
  });

  function getAllCustomers(){
    $("#tblCustomer").empty();
    <!--send ajax request to the customer servlet using jQuery-->
    $.ajax({
      url: 'customer',
      dataType:"json",
      success: function (customers) {
        for (let i in customers) {
          let cus = customers[i];
          let id = cus.id;
          let name = cus.name;
          let address = cus.address;

          let row = "<tr><td>" + id + "</td><td>" + name + "</td><td>" + address + "</td></tr>";
          $("#tblCustomer").append(row);
        }
      },
      error:function(error){
        console.log(error);
      }
    });
  }

  $("#btnCustomer").click(function (){
    let formData=$("#customerForm").serialize();
    $.ajax({
      url:"customer",
      method:"post",
      data:formData,
      success:function (res){
        console.log(res);
        alert(res.message);
        getAllCustomers();
      },
      error:function (error){
        console.log(error.responseJSON);
        alert(error.responseJSON.message);
      }
    });

  });

  $("#btnCusDelete").click(function(){
      let id = $("#txtCustomerID").val();
    $.ajax({
      url:'customer',
      method:'delete',
      data:JSON.stringify({
        "id":id
      }),
      success:function (resp){
        alert(resp.message);
        getAllCustomers();
      },
      error:function(error){
        console.log(error);
      }
    });
  });

  $("#btnUpdate").click(function (){
    let id = $("#txtCustomerID").val();
    let name = $("#txtCustomerName").val();
    let address = $("#txtCustomerAddress").val();

    $.ajax({
      url:'customer',
      contentType: "application/json",
      method:'put',
      data:JSON.stringify({
        "id":id,
        "name":name,
        "address":address
      }),
      success:function (resp){
        alert(resp.message);
        getAllCustomers();
      },
      error:function(error){
        console.log(error);
      }
    });
  });
</script>


</body>
</html>

