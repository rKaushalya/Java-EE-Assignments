<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lk.ijse.jsp.dto.ItemDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Item Manage</title>
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
        <li class="list-group-item bg-white" id="lnkCustomer"><a href="customer.jsp">Customer</a></li>
        <li class="list-group-item bg-danger text-white" id="lnkItem"><a class="text-white" href="item.jsp">Item</a>
        </li>
        <li class="list-group-item bg-white" id="lnkOrders"><a href="purchase-order.jsp">Orders</a></li>
    </ul>
</header>

<!--item content-->
<main class="container-fluid" id="itemContent">
    <section class="row">
        <div class="col-12 col-lg-4">
            <h1>Item Form</h1>
            <form id="itemForm">
            <div class="form-group">
                <label for="itemCode">Item Code</label>
                <input name="code" class="form-control" id="itemCode" type="text">
                <span class="control-error" id="lblCode"></span>
            </div>
            <div class="form-group">
                <label for="itemName">Item Name</label>
                <input name="description" class="form-control" id="itemName" type="text">
                <span class="control-error" id="lblname"></span>
            </div>
            <div class="form-group">
                <label for="itemQty">Item Qty</label>
                <input name="qty" class="form-control" id="itemQty" type="text">
                <span class="control-error" id="lblqty"></span>
            </div>
            <div class="form-group">
                <label for="itemPrice">Unit Price</label>
                <input name="unitPrice" class="form-control" id="itemPrice" type="text">
                <span class="control-error" id="lblprice"></span>
            </div>
            </form>
            <div class="btn-group">
                <button form="itemForm" formmethod="post"  formaction="item?option=add" class="btn btn-primary" id="btnItem">Add Item</button>
                <button form="itemForm" formmethod="post"  formaction="item?option=delete" class="btn btn-danger" id="btnItemDelete">Remove</button>
                <button form="itemForm" formmethod="post"  formaction="item?option=update" class="btn btn-warning" id="btnItemUpdate">Update</button>
                <button form="itemForm" formaction="item" class="btn btn-success">Get All</button>
                <button form="itemForm" type="reset" class="btn btn-danger" id="btn-clear">Clear All</button>
            </div>

        </div>
        <div class="col-12 col-lg-8 mt-3">
            <table class="table table-bordered table-hover">
                <thead class="bg-danger text-white">
                <tr>
                    <th>Item Code</th>
                    <th>Item Name</th>
                    <th>Item Qty</th>
                    <th>Item Price</th>
                </tr>
                </thead>
                <tbody id="tblItem">
                <%
                    ArrayList<ItemDTO> allItems = (ArrayList<ItemDTO>) request.getAttribute("keyTwo");
                    if (allItems != null) {
                %>
                <%for (ItemDTO itemDTO : allItems) { %>
                <tr>
                    <td><%=itemDTO.getCode()%></td>
                    <td><%=itemDTO.getDescription()%></td>
                    <td><%=itemDTO.getQtyOnHand()%></td>
                    <td><%=itemDTO.getUnitPrice()%></td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </section>

</main>

</body>
</html>
