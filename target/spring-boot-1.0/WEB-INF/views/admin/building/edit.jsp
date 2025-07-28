<%@ taglib prefix="fprm" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<c:url var="buildingEditURL" value="/admin/building-edit"/>
<html>
<head>
    <title>Thêm or Sửa Tòa Nhà</title>
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
                <li class="active">Thêm or sửa</li>
            </ul><!-- /.breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="nav-search-input"
                                       id="nav-search-input" autocomplete="off"/>
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content">
            <div class="ace-settings-container" id="ace-settings-container">
                <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                    <i class="ace-icon fa fa-cog bigger-130"></i>
                </div>

                <div class="ace-settings-box clearfix" id="ace-settings-box">
                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                </select>
                            </div>
                            <span>&nbsp; Choose Skin</span>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar"/>
                            <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                            <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs"/>
                            <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                            <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                            <label class="lbl" for="ace-settings-add-container">
                                Inside
                                <b>.container</b>
                            </label>
                        </div>
                    </div><!-- /.pull-left -->

                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover"/>
                            <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact"/>
                            <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight"/>
                            <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                        </div>
                    </div><!-- /.pull-left -->
                </div><!-- /.ace-settings-box -->
            </div><!-- /.ace-settings-container -->

            <div class="page-header">
                <h1 style="font-family: 'Times New Roman', Times, serif;">
                    Sửa or thêm tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">

                </div>
            </div>
            <%--					bảng danh sach--%>
            <div class="row">
                <form:form modelAttribute="buildingEdit" id="listForm" method="POST" action="${buildingEditURL}">
                    <div class="col-xs-12 ">
                        <form class="form-horizontal" role="form" style="margin-bottom: 40px;">
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Tên Tòa Nhà </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="text" id="name" name="name" />--%>
                                    <form:input cssClass="form-control" path="name"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-5">
                                    <form:select class="form-control" path="district">
                                        <form:option value="">Chọn Quận</form:option>
                                        <form:options items="${districts}"></form:options>
                                    </form:select>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Phường </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="text" id="ward" name="ward" />--%>
                                    <form:input cssClass="form-control" path="ward"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Đường </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="text" id="street" name="street" />--%>
                                    <form:input cssClass="form-control" path="street"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Kết cấu </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="text" id="structure" name="structure" value="" />--%>
                                    <form:input cssClass="form-control" path="structure"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Số tầng hầm </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="number" id="numberOfBasement"--%>
                                        <%--											name="numberOfBasement" value=""/>--%>
                                    <form:input cssClass="form-control" path="numberOfBasement"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Diện tích sàn </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="number" id="floorarea" name="floorarea" value=""/>--%>
                                    <form:input cssClass="form-control" path="floorArea"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Hướng </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="text" id="diretion" name="diretion" value=""/>--%>
                                    <form:input cssClass="form-control" path="direction"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Hạng </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="number" id="level" name="level" value="" />--%>
                                    <form:input cssClass="form-control" path="level"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Diện tích thuê </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="text" id="rentarea" name="rentarea" value=""/>--%>
                                    <form:input cssClass="form-control" path="rentArea"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Giá thuê </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="number" id="rentprice" name="rentprice" value=""/>--%>
                                    <form:input cssClass="form-control" path="rentPrice"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Mô tả giá </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="text" id="rentpricedescription"--%>
                                        <%--											name="rentpricedescription" value=""/>--%>
                                    <form:input cssClass="form-control" path="rentPriceDescription"/>
                                </div>
                            </div>
                            <!-- ------- -->

                            <!-- ------- ------ -->
                            <div class="form-group">
                                <label class="col-xs-3"> Tên quản lí </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="text" id="managerName" name="managerName" value="" />--%>
                                    <form:input cssClass="form-control" path="managerName"/>
                                </div>
                            </div>
                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3"> Số điện thoại quản lí </label>
                                <div class="col-sm-9">
                                        <%--										<input class="form-control" type="number" id="managerPhone" name="managerPhone" value=""/>--%>
                                    <form:input cssClass="form-control" path="managerPhone"/>
                                </div>
                            </div>

                            <!-- ------- -->
                            <div class="form-group">
                                <label class="col-xs-3">Loại tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${not empty buildingEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btlAddOrUpdateBuilding">
                                            Uptade
                                            Building
                                        </button>
                                        <button type="button" class="btn btn-primary" id="btlCancel"> Cancel</button>
                                    </c:if>
                                    <c:if test="${empty buildingEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btlAddOrUpdateBuilding"> Add
                                            Building
                                        </button>
                                        <button type="button" class="btn btn-primary" id="btlCancel"> Cancel</button>
                                    </c:if>
                                </div>

                            </div>
                            <form:hidden path="id" id="buildingId"/>
                        </form>
                    </div>
                </form:form>

            </div>
        </div>
    </div>
    <!-- ...existing code... -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<%--<script>--%>
<%--    $('#btlAddOrUpdateBuilding').click(function () {--%>
<%--        var data = {};--%>
<%--        var typeCode = [];--%>
<%--        var formData = $('#listForm').serializeArray();--%>
<%--        $.each(formData, function (i, v) {--%>
<%--            if (v.name != 'typeCode') {--%>
<%--                data["" + v.name + ""] = v.value;--%>
<%--            } else {--%>
<%--                typeCode.push(v.value);--%>
<%--            }--%>
<%--        });--%>
<%--        data['typeCode'] = typeCode;--%>
<%--        if (typeCode != '') {--%>
<%--            addOrUpdateBuilding(data);--%>
<%--        } else {--%>
<%--            window.location.href = "<c:url value="/admin/building-edit?typeCode=require"/>";--%>
<%--        }--%>
<%--    });--%>
<%--    function addOrUpdateBuilding(data) {--%>
<%--        $.ajax({--%>
<%--            url: "${buildingAPI}",--%>
<%--            type: 'POST',--%>
<%--            data: JSON.stringify(data), // chuyển đổi đối tượng thành chuỗi JSON--%>
<%--            contentType: 'application/json',--%>
<%--            dataType: 'json',--%>
<%--            success: function (response) {--%>
<%--                console.log("Building added successfully");--%>
<%--            },--%>
<%--            error: function (response) {--%>
<%--                console.error("Error adding building:", response);--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    $('#btlCancel').click(function () {--%>
<%--        window.location.href = "/admin/building-list";--%>

<%--    });--%>
<%--</script>--%>
<script>
    $('#btlAddOrUpdateBuilding').click(function () {
        var data = {};
        var typeCode = [];
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            if (v.name !== 'typeCode') {
                data[v.name] = v.value;
            } else {
                typeCode.push(v.value);
            }
        });
        data['typeCode'] = typeCode;
        if (typeCode.length === 0) {
            window.location.href = "<c:url value='/admin/building-edit?typeCode=require'/>";
            return;
        }
        var buildingId = $('#buildingId').val();
        if (buildingId) {
            data.id = buildingId;
            updateBuilding(data);
        } else {
            addBuilding(data);
        }
    });

    function addBuilding(data) {
        $.ajax({
            url: "${buildingAPI}",
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: 'json',
            success: function (response) {
                console.log("Building added successfully:", response);
                window.location.href = "/admin/building-list";
            },
            error: function (response) {
                console.error("Error adding building:", response);
                 window.location.href = "/admin/building-list";
            }
        });
    }

    function updateBuilding(data) {
    var buildingId = $('#buildingId').val();
    console.log("Sending PUT to URL:", "${buildingAPI}/" + buildingId);
    console.log("PUT data:", JSON.stringify(data));
    $.ajax({
        url: "${buildingAPI}/" + buildingId,
        type: 'PUT',
        data: JSON.stringify(data),
        contentType: 'application/json',
        dataType: 'json',
        success: function (response) {
            console.log("Building updated successfully:", response);
            window.location.href = "/admin/building-list";
        },
        error: function (response) {
            console.error("Error updating building:", response);
            window.location.href = "/admin/building-list";
        }
    });
}

    $('#btlCancel').click(function () {
        window.location.href = "/admin/building-list";
    });
</script>
</body>
</html>
