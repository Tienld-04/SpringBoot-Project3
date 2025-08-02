<%@ taglib prefix="fprm" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Danh Sách Tòa Nhà</title>
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
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Quản lí tòa nhà</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Danh Sách Tòa Nhà
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12 ">
                    <div class="widget-box ui-sortable-handle">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm Kiếm</h5>

                            <div class="widget-toolbar">
                                <div class="widget-menu">

                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>

                                    <a href="#" data-action="close">
                                        <i class="ace-icon fa fa-times"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" style="font-family: 'Times New Roman' , Times, serif;">
                                <div class="widget-main">
                                    <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListURL}"
                                               method="GET">
                                        <div class="row">
                                            <div class="from-group">
                                                <!------------ -->
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <label class="name">Tên Tòa Nhà</label>
                                                            <%--                                                        <input type="text" class="form-control" id="name"--%>
                                                            <%--                                                               name="name" value="${modelSearch.name}">--%>
                                                        <form:input cssClass="form-control" path="name"/>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <label class="name">Diện tích sàn</label>
                                                            <%--                                                        <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                        <form:input cssClass="form-control" path="floorArea"/>
                                                    </div>

                                                </div>
                                                <!------------ -->
                                                <div class="col-xs-12">
                                                    <div class="col-xs-2">
                                                            <%--                                                        --%>
                                                            <%--                                                        <label class="name">Quận</label>--%>
                                                            <%--                                                        <select class="form-control" name="district">--%>
                                                            <%--                                                            <option value="">Chọn Quận</option>--%>
                                                            <%--                                                            <option value="Quan_1">Quận 1</option>--%>
                                                            <%--                                                            <option value="Quan_2">Quận 2</option>--%>
                                                            <%--                                                            <option value="Quan_3">Quận 3</option>--%>
                                                            <%--                                                        </select>--%>
                                                        <div>
                                                            <label class="name">Quận</label>
                                                            <form:select class="form-control" path="district">
                                                                <form:option value="">Chọn Quận</form:option>
                                                                <form:options items="${districts}"></form:options>

                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Phường</label>
                                                            <%--                                                        <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                        <form:input cssClass="form-control" path="ward"/>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Đường</label>
                                                            <%--                                                        <input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                                                        <form:input cssClass="form-control" path="street"/>
                                                    </div>
                                                </div>
                                                <!------------ -->
                                                <div class="col-xs-12">
                                                    <div class="col-xs-4">
                                                        <label class="name">Số tầng hầm</label>
                                                            <%--                                                        <input type="number" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}">--%>
                                                        <form:input cssClass="form-control" path="numberOfBasement"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">Hướng</label>
                                                            <%--                                                        <input type="text" class="form-control" name="direction" value="${modelSearch.direction}">--%>
                                                        <form:input cssClass="form-control" path="direction"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">Hạng</label>
                                                            <%--                                                        <input type="number" class="form-control" name="level" value="${modelSearch.level}">--%>
                                                        <form:input cssClass="form-control" path="level"/>
                                                    </div>
                                                </div>
                                                <!------------ -->
                                                <div class="col-xs-12">
                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích từ</label>
                                                            <%--                                                        <input type="number" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">--%>
                                                        <form:input cssClass="form-control" path="areaFrom"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích đến</label>
                                                            <%--                                                        <input type="number" class="form-control" name="areaTo" value="${modelSearch.areaTo}">--%>
                                                        <form:input cssClass="form-control" path="areaTo"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê từ</label>
                                                            <%--                                                        <input type="number" class="form-control" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">--%>
                                                        <form:input cssClass="form-control" path="rentPriceFrom"/>
                                                    </div>

                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê đến</label>
                                                            <%--                                                        <input type="number" class="form-control" name="rentPriceTo" value="${modelSearch.rentPriceTo}">--%>
                                                        <form:input cssClass="form-control" path="rentPriceTo"/>
                                                    </div>
                                                </div>
                                                <!------------ -->
                                                <div class="col-xs-12">
                                                    <div class="col-xs-5">
                                                        <label class="name">Tên quản lí</label>
                                                            <%--                                                        <input type="text" class="form-control" name="managerName" value="">--%>
                                                        <form:input cssClass="form-control" path="managerName"/>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Số điện thoại quản lí</label>
                                                            <%--                                                        <input type="text" class="form-control" name="managerPhone" value="">--%>
                                                        <form:input cssClass="form-control" path="managerPhone"/>
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <div>
                                                            <label class="name">Nhân viên</label>
                                                            <form:select class="form-control" path="staffId">
                                                                <form:option value="">Chọn Nhân viên</form:option>
                                                                <form:options items="${listStaffs}"/>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!------------ -->
                                                <div class="col-xs-12">
                                                    <div class="col-sm-6">
                                                        <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                                            <%--                                                        <label class="checkbox-inline">--%>
                                                            <%--                                                            <input name="typeCode" type="checkbox" value="not-that"> Nội thất--%>
                                                            <%--                                                        </label>--%>
                                                            <%--                                                        <label class="checkbox-inline">--%>
                                                            <%--                                                            <input name="typeCode" type="checkbox" value="nguyen-can"> Nguyên căn--%>
                                                            <%--                                                        </label>--%>
                                                            <%--                                                        <label class="checkbox-inline">--%>
                                                            <%--                                                            <input name="typeCode" type="checkbox" value="trang-tret"> Tầng trệt--%>
                                                            <%--                                                        </label>--%>
                                                    </div>
                                                </div>
                                                <!------------ -->

                                                <div class="col-xs-12">
                                                    <h6></h6>
                                                    <div class="col-xs-6">
                                                        <button type="button" class="btn btn-xs btn-danger"
                                                                id="btnSearchBuilding">
                                                            <i class="ace-icon glyphicon glyphicon-search"></i>
                                                            Tìm Kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>

                                </div>
                            </div>
                        </div>
                        <div class="pull-right">
                            <a href="/admin/building-edit">
                                <button class="btn btn-primary" type="submit" title="thêm tòa nhà">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                         fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                        <path
                                                d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                        <path
                                                d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path
                                                d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </a>

                            <button class="btn btn-danger" type="submit" title="Xóa building" id="btlDeleteBuilding">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                     fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                    <path
                                            d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                    <path
                                            d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path
                                            d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bảng danh sách tòa nhà -->
            <h1></h1>
            <h1></h1>
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
                            <th>Tên Tòa Nhà</th>
                            <th>Địa chỉ</th>
                            <th>Số tầng hầm</th>
                            <th>Tên quản lí</th>
                            <th>Số điện thoại</th>
                            <th>Diện tích sàn</th>
                            <th>Diện tích thuê</th>
                            <th>Giá thuê</th>
                            <th>Mô tả giá</th>
                            <th class="hidden-480">Thao Tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="item" items="${buildingList}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>${item.name}</td>
                                <td>${item.address}</td>
                                <td>${item.numberOfBasement}</td>
                                <td>${item.managerName}</td>
                                <td>${item.managerPhone}</td>
                                <td>${item.floorArea}</td>
                                <td>${item.rentArea}</td>
                                <td>${item.rentPrice}</td>
                                <td>${item.rentPriceDescription}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="Giao Tòa Nhà"
                                                onclick="assingmentBuilding(${item.id})">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </button>

                                        <a class="btn btn-xs btn-info" title="Sửa toa nhà"
                                           href="/admin/building-edit-${item.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>

                                        <button class="btn btn-xs btn-danger" title="Xóa Tòa Nhà"
                                                onclick="deleteBuilding(${item.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>
        </div>
    </div><!-- /.main-content -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<div class="modal fade" id="assingmentBuildingModal" role="dialog">
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
                    <input type="hidden" id="buildingId" name="buildingId" value="">
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-default" id="btnAssignmentBuilding">Done
                        Building
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function assingmentBuilding(buildingId) {
        $('#assingmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
    }

    function loadStaff(buildingId) {
        $.ajax({
            url: "${buildingAPI}/" + buildingId + '/staffs',
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
                window.location.href = "/admin/building-list?message=error";
                console.error("Error adding building:", response);
            }
        });
    }

    ////////////////////////
    $('#btnAssignmentBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type="checkbox"]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assignmentBuil(data);
        }
        console.log("ok");
    });

    function assignmentBuil(data) {
        $.ajax({
            url: "${buildingAPI}/" + 'assignment',
            type: 'post',
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: 'json',
            success: function (response) {
                console.info("success")
            },
            error: function (response) {
                console.info("not Done")
                window.location.href = "/admin/building-list?message=error";
                console.error("Error adding building:", response);
            }
        });
    }

    ///////////////////////////
    $('#btnSearchBuilding').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    })

    ////////////////////////////
    function deleteBuilding(buildingDataId) {
        var buildingId = [buildingDataId];
        $('#buildingId').val();
        deleteBuildings(buildingId);
    }

    $('#btlDeleteBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var buildingIds = $('#tableList').find('tbody input[type="checkbox"]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    });

    function deleteBuildings(data) {
        $.ajax({
            url: "${buildingAPI}/" + data,
            type: 'Delete',
            data: JSON.stringify(data),
            contentType: 'application/json',
            //dataType: 'json',
            success: function (respond) {
                console.log("Building added successfully");
                window.location.href = "/admin/building-list";
            },
            error: function (respond) {
                window.location.href = "/admin/building-list";
                console.error("Error adding building:", respond);

            }
        });
    }
</script>
</body>
</html>
