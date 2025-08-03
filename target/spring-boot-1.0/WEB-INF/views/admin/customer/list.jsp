<%@ taglib prefix="fprm" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>
<c:url var="customerListURL" value="/admin/customer-list"/>
<html>
<head>
    <title>Danh sách khách hàng</title>
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
                    <a href="/admin/home">Trang chủ</a>
                </li>
                <li class="active">Quản lý khách hàng</li>
            </ul><!-- /.breadcrumb -->

        </div>
        <div class="page-content">
            <div class="ace-settings-container" id="ace-settings-container">
            </div> <!--/.ace-settings-box -->
            <div class="page-header">
                <h1>
                    Quản lý khách hàng
                </h1>
            </div>
            <div class="row">
                <div class="col-xs-12 ">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title"> Tìm kiếm </h4>

                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>


                            </div>
                        </div>

                        <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                            <div class="widget-main">
                                <form:form modelAttribute="modelSearch" method="get" action="${customerListURL}"
                                           id="listForm">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-4">
                                                <label class="name">Tên khách hàng</label>

                                                    <%--                                                <input type="text" id="name" class="form-control" name="" >--%>
                                                <form:input path="customerName" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="form-field-8">Di động</label>

                                                    <%--                                                <input type="number" class="form-control" name="" id="">--%>
                                                <form:input path="phone" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="form-field-9" class="name"> Email </label>
                                                    <%--                                                <input type="number" name="" id="" class="form-control">--%>
                                                <form:input path="email" cssClass="form-control"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-4">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <label for="" class="name"> Chọn nhân viên</label>
                                                    <form:select path="staffId" cssClass="form-control">
                                                        <form:option value="" label="-- Chọn nhân viên --"/>
                                                        <form:options items="${staffs}"/>
                                                    </form:select>
                                                </security:authorize>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <button class="btn btn-xs btn-danger" id="btnSearchCustomer">
                                                    <i class="ace-icon glyphicon glyphicon-search"></i>
                                                    Tìm kiếm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    </form:form>

                                </div>
                            </div>
                            <div class="pull-right">
                                <a href="/admin/customer-edit">
                                    <button class="btn btn-info btn-white" title="Thêm khách hàng">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                                            <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                                            <path fill-rule="evenodd"
                                                  d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5"/>
                                        </svg>
                                    </button>
                                </a>
                                <button class="btn btn-white btn-danger btn-bold" id="btnDeleteCustomer"
                                        title="Xoá khách hàng">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-person-dash-fill" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                              d="M11 7.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5"/>
                                        <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                                    </svg>
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Danh sách khách hàng -->
            <h1></h1>
            <h2></h2>
            <div class="row">
                <div class="col-xs-12">
                    <table id="tableList"
                           class="table table-striped table-bordered table-hover ">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" name="checkList" value="" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên khách hàng</th>
                            <th>Di động</th>
                            <th>Email</th>
                            <th>Nhu cầu</th>
                            <th>Tình trạng</th>
                            <th>Ngày sửa đổi</th>
                            <th>Người sửa đổi</th>
                            <th class="hidden-480">Thao Tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${customers}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>${item.fullName}</td>
                                <td>${item.phone}</td>
                                <td>${item.email}</td>
                                <td>${item.demand}</td>
                                <td>${item.status}</td>
                                <td>${item.modifiedDate}</td>
                                <td>${item.modifiedBy}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <security:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-success" title="Giao khách hàng"
                                                    onclick="assingmentCustomer(${item.id})">
                                                <i class="ace-icon glyphicon glyphicon-list"></i>
                                            </button>
                                        </security:authorize>
                                        <a class="btn btn-xs btn-info" title="Sửa khách hàng"
                                           href="/admin/customer-edit-${item.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>

                                        <button class="btn btn-xs btn-danger" title="Xóa khách hàng"
                                                onclick="deleteCustomer(${item.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>   <!-- /.span -->
            </div>
        </div> <!-- /.span -->
    </div>
</div>
<div class="modal fade" id="assingmentCustomerModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh Sách Nhân Viên</h4>
            </div>
            <form>
                <div class="modal-body">
                    <table class="table table-striped table-bordered table-hover" id="staffList">
                        <thead>
                        <tr>
                            <th class="center">Chọn</th>
                            <th>Tên Nhân Viên</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <input type="hidden" id="customerId" name="customerId" value="">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnAssignmentCustomer">Done
                        Customer
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function assingmentCustomer(customerId) {
        $('#assingmentCustomerModal').modal();
        loadStaff(customerId);
        $('#customerId').val(customerId);
    }

    function loadStaff(customerId) {
        $.ajax({
            url: "${customerAPI}/" + customerId + '/staffs',
            type: 'GET',
            //data: JSON.stringify(data),
            //contentType: 'application/json',
            dataType: 'json',
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId + '" class="check-box-element"' + item.checked + '/></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("success")
            },
            error: function (response) {
                window.location.href = "/admin/customer-list?message=error";
                console.error("Error add customer:", response);
            }
        });
    }

    ////////////////////////
    $('#btnAssignmentCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        var staffs = $('#staffList').find('tbody input[type="checkbox"]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assignmentCus(data);
        }
        console.log("ok");
    });

    function assignmentCus(data) {
        $.ajax({
            url: "${customerAPI}" + '/assignment',
            type: 'post',
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: 'json',
            success: function (response) {
                console.info("success")
            },
            error: function (response) {
                console.info("not Done")
                window.location.href = "/admin/customer-list?message=error";
                console.error("Error adding customer:", response);
            }
        });
    }

    /////////////////////
    $('#btnSearchCustomer').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    });

    //////////////////////////////

    function deleteCustomer(customerDataId) {
        var customerId = [customerDataId];
        $('#customerId').val();
        deleteCustomers(customerId);
    }

    $('#btnDeleteCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        var customerIds = $('#tableList').find('tbody input[type="checkbox"]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteCustomers(customerIds);
    });

    function deleteCustomers(data) {
        $.ajax({
            url: "${customerAPI}/" + data,
            type: 'Delete',
            data: JSON.stringify(data),
            contentType: 'application/json',
            //dataType: 'json',
            success: function (respond) {
                console.log("customer delete successfully");
                window.location.href = "/admin/customer-list";
            },
            error: function (respond) {
                window.location.href = "/admin/customer-list";
                console.error("Error delete customer:", respond);

            }
        });
    }

    ///////////////////////
    <%--function deleteCustomer(customerId) {--%>
    <%--    if (confirm('Bạn có chắc chắn muốn xóa khách hàng này?')) {--%>
    <%--        $.ajax({--%>
    <%--            url: "${customerAPI}/" + customerId,--%>
    <%--            type: 'DELETE',--%>
    <%--            dataType: 'json',--%>
    <%--            success: function (response) {--%>
    <%--                window.location.href = "/admin/customer-list?message=success";--%>
    <%--            },--%>
    <%--            error: function (response) {--%>
    <%--                window.location.href = "/admin/customer-list?message=error";--%>
    <%--            }--%>
    <%--        });--%>
    <%--    }--%>
    <%--}--%>
    <%--$('#btnDeleteCustomer').click(function (e) {--%>
    <%--    e.preventDefault();--%>
    <%--    var data = {};--%>
    <%--    var ids = $('tbody input[type="checkbox"]:checked').map(function () {--%>
    <%--        return $(this).val();--%>
    <%--    }).get();--%>
    <%--    if (ids.length > 0) {--%>
    <%--        data['ids'] = ids;--%>
    <%--        deleteCustomers(data);--%>
    <%--    } else {--%>
    <%--        alert('Vui lòng chọn khách hàng cần xóa!');--%>
    <%--    }--%>
    <%--});--%>

    <%--function deleteCustomers(data) {--%>
    <%--    if (confirm('Bạn có chắc chắn muốn xóa các khách hàng đã chọn?')) {--%>
    <%--        $.ajax({--%>
    <%--            url: "${customerAPI}/delete",--%>
    <%--            type: 'POST',--%>
    <%--            data: JSON.stringify(data),--%>
    <%--            contentType: 'application/json',--%>
    <%--            dataType: 'json',--%>
    <%--            success: function (response) {--%>
    <%--                window.location.href = "/admin/customer-list?message=success";--%>
    <%--            },--%>
    <%--            error: function (response) {--%>
    <%--                window.location.href = "/admin/customer-list?message=error";--%>
    <%--            }--%>
    <%--        });--%>
    <%--    }--%>
    <%--}--%>
</script>
</body>
</html>