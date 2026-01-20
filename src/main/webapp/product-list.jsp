<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
</head>
<body>

<h2>DANH SÁCH SẢN PHẨM</h2>

<a href="new">Thêm sản phẩm mới</a>
<br><br>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Hình ảnh</th>
        <th>Hành động</th>
    </tr>

    <c:forEach var="p" items="${listProduct}">
        <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>${p.price}</td>
            <td>
                <img src="${p.urlImage}" width="100">
            </td>
            <td>
                <a href="edit?id=${p.id}">Sửa</a> |
                <a href="delete?id=${p.id}"
                   onclick="return confirm('Bạn có chắc muốn xóa?');">
                    Xóa
                </a>
            </td>
        </tr>
    </c:forEach>

</table>

<br>
<a href="index.jsp">⬅ Về trang chủ</a>

</body>
</html>
