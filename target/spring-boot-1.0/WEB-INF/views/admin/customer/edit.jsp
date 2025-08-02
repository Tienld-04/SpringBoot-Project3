<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thông tin khách hàng</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="/admin/customer-list">Trang chủ</a>
                </li>
                <c:if test="${empty customerEdit.id}">
                    <li class="active">Thêm khách hàng</li
                </c:if>
                <c:if test="${not empty customerEdit.id}">
                    <li class="active">Chỉnh sửa thông tin khách hàng</li
                </c:if>
            </ul><!-- /.breadcrumb -->


        </div>

        <div class="page-content">
            <div class="ace-settings-container" id="ace-settings-container">

            </div> <!--/.ace-settings-box -->
            <div class="page-header">
                <%--                <h1>--%>
                <%--                    Dashboard--%>
                <%--                    <small>--%>
                <%--                        <i class="ace-icon fa fa-angle-double-right"></i>--%>
                <%--                        overview &amp; stats--%>
                <%--                    </small>--%>
                <%--                </h1>--%>
            </div><!-- /.page-header -->
            <form:form modelAttribute="customerEdit" action="/admin/customer-edit" id="customerForm" method="post">
                <div class="row" style="font-family:'Times New Roman', Times, serif ">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="form-edit">
                            <div class="form-group row">
                                <label class="col-sm-3" for=""> Tên khách hàng </label>
                                <div class="col-sm-9">
                                        <%--                                <input type="text" name="" id="name" name="name" class="form-control">--%>
                                    <form:input path="fullName" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3" for=""> Số điện thoại </label>
                                <div class="col-sm-9">
                                        <%--                                <input type="text" name="" id="" class="form-control">--%>
                                    <form:input path="phone" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3" for=""> Email </label>
                                <div class="col-sm-9">
                                        <%--                                <input type="text" name="" id="" class="form-control">--%>
                                    <form:input path="email" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3" for=""> Tên công ty </label>
                                <div class="col-sm-9">
                                        <%--                                <input type="text" name="" id="" class="form-control">--%>
                                    <form:input path="companyName" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3" for=""> Nhu cầu </label>
                                <div class="col-sm-9">
                                        <%--                                <input type="number" name="numberOfBasement" id="numberOfBasement" class="form-control">--%>
                                    <form:input path="demand" cssClass="form-control"/>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="" class="col-sm-3"> Ghi chú </label>
                                <div class="col-sm-3">
                                        <%--                                                            <select name="district" id="district" class="form-control">--%>
                                        <%--                                                                <option value="">--Chọn Quận--</option>--%>
                                        <%--                                                                <option value="1"> Quận 1 </option>--%>
                                        <%--                                                                <option value="2"> Quận Bình Thạnh </option>--%>
                                        <%--                                                            </select>--%>
                                    <form:select path="status" cssClass="form-control">
                                        <form:option value="" label="-- Chọn tình trạng --"/>
                                        <form:options items="${statusCode}"/>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="" class="col-sm-3"></label>
                                <div class="col-sm-9">
                                    <c:if test="${empty customerEdit.id}">
                                        <button class="btn btn-primary" type="button" id="btnAddCustomer"> Thêm khách
                                            hàng
                                        </button>
                                        <button class="btn btn-primary" id="cancelBtn" type="button"> Hủy thao tác
                                        </button>
                                    </c:if>
                                    <c:if test="${not empty customerEdit.id}">
                                        <button class="btn btn-primary" type="button" id="btnAddCustomer"> Cập nhật
                                            khách hàng
                                        </button>
                                        <button class="btn btn-primary" id="cancelBtn" type="button"> Hủy thao tác
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                            <form:hidden path="id" id="customerId"/>
<%--                            <form:hidden path="modifiedDate" id="modifiedDate"/>--%>
                            <form:hidden path="modifiedBy" id="modifiedBy"/>
                        </form>
                    </div>
                </div>
            </form:form>
        </div>
    </div>

    <c:forEach var="item" items="${transactionType}">
        <div class="col-xs-12">
            <div class="col-sm-12">
                <h3 class="header smaller lighter blue">${item.value}</h3>
                <button class="btn btn-lg btn-primary" onclick="transactionType('${item.key}',${customerEdit.id})">
                        <%--                    <i class="orange ace-icon fa fa-location-arrow bigger-130"></i>--%>
                    Add
                </button>
            </div>
            <div class="col-xs-12">
                <table class="table table-striped table-bordered table-nover">
                    <thead>
                    <tr>
                        <th>Ngày tạo</th>
                        <th>Người tạo</th>
                        <th>Ngày sửa</th>
                        <th>Người sửa</th>
                        <th>Chi tiết giao dịch</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${item.key == 'CSKH' ? CSKHList : DDXList}">
                        <tr>
                            <td>${list.createdDate}</td>
                            <td>${list.createdBy}</td>
                            <td>${list.modifiedDate}</td>
                            <td>${list.modifiedBy}</td>
                            <td>${list.note}</td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <button class="btn btn-xs btn-primary" title="Sửa chi tiết giao dịch"
                                            onclick="showFormUpdate(${list.id},'${item.key}')">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
                                        </svg>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:forEach>


    <div class="modal fade" id="transactionTypeModal" role="dialog"
         style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Nhập giao dịch</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group has-success" id="formSerial">
                        <label for="transactionNote" class="col-xs-12 col-sm-3 control-label no-padding-right">Chi tiết
                            giao dịch</label>
                        <div class="col-xs-12 col-sm-9">
			    <span class="block input-icon input-icon-right">
				    <input type="text" id="transactionNote" class="width-100">
<%--                    <form:input  id="transactionDetail" path="note" cssClass="width-100"/>--%>
			    </span>
                        </div>
                    </div>
                    <input type="hidden" id="customerId">
                    <input type="hidden" id="code">
                    <input type="hidden" id="id">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"> Đóng</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function transactionType(code, customerId) {
        $('#transactionTypeModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function showFormUpdate(id, code) {
        $('#transactionTypeModal').modal();
        $('#id').val(id);
        $('#code').val(code);
        loadTransactionDetail(id);
    }

    function updateTransaction(data, id) {
        $.ajax({
            type: "PUT",
            url: "/api/customer/transaction",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                alert("Update Transaction Successfully");
                window.location.href = "/admin/customer-edit-" + id;
            },
            error: function (response) {

            }
        });

    }

    function loadTransactionDetail(id) {
        $.ajax({
            url: "/api/customer/" + id + "/details",
            type: "GET",
            dataType: "text",
            success: function (res) {
                let row = '<input type="text" id="transactionNote" class="width-100" value="' + res + '" />';
                $('#formSerial .input-icon').html(row);

                $('#transactionTypeModal').modal();
            },
            error: function (res) {
                window.alert("Fail");
            }
        });
    }

    $('#btnAddCustomer').click(function (e) {
        var data = {};
        var formData = $('#customerForm').serializeArray();
        $.each(formData, function (i, it) {
            data[it.name] = it.value;
        });
        //data['modifiedDate'] = $('#modifiedDate').val();
        data['modifiedBy'] = $('#modifiedBy').val().toString();
        if ($('#customerId').val() !== "") {
            updateCustomer(data, $('#customerId').val());
        } else {
            addCustomer(data);
        }
    });


    $('#btnAddOrUpdateTransaction').click(function (e) {
        e.preventDefault();
        var data = {};
        var id = $('#id').val();
        data['id'] = id;
        let customerId = $('#customerId').val();
        data['customerId'] = customerId;
        data['code'] = $('#code').val();
        data['note'] = $('#transactionNote').val();
        if (id !== "") {
            // data['id'] = $('#id').val();
            updateTransaction(data, customerId);
        }
        addTransaction(data, customerId);
    })


    function addCustomer(data) {
        $.ajax({
            type: "POST",
            url: "/api/customer",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                alert("Add customer successfully!!!");
                window.location.href = "/admin/customer-list";
            },
            error: function (response) {
                window.location.href = "/admin/customer-list?message=error";
            }
        })
    }

    function updateCustomer(data, id) {
        $.ajax({
            type: "PUT",
            url: "/api/customer/" + id,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: 'json',
            success: function (response) {
                alert("Update customer succesfully");
                window.location.href = "/admin/customer-list";
            },
            error: function (response) {
                console.log(response);
                window.location.href = "/admin/customer-list?message=error";
            }
        });
    }

    function addTransaction(data, customerId) {
        $.ajax({
            type: "POST",
            url: "/api/customer/transaction",
            data: JSON.stringify(data),
            // dataType: "json",
            contentType: "application/json",
            success: function (response) {
                alert("Add transaction successfully");
                window.location.href = "/admin/customer-edit-" + customerId;
            },
            error: function (response) {
                // alert("Error");
                console.log(response);
            }
        });
    }

    $('#cancelBtn').click(function (e) {
        e.preventDefault();
        window.location.href = "/admin/customer-list";
    })
</script>
</body>
</html>
