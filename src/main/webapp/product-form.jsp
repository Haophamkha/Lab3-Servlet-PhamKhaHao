<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form sản phẩm</title>
</head>
<body>

<h2>
    <c:if test="${product == null}">Thêm sản phẩm</c:if>
    <c:if test="${product != null}">Sửa sản phẩm</c:if>
</h2>

<form action="<c:if test='${product == null}'>insert</c:if><c:if test='${product != null}'>update</c:if>" method="post">

    <c:if test="${product != null}">
        <input type="hidden" name="id" value="${product.id}">
    </c:if>

    Tên sản phẩm:
    <input type="text" name="name" value="${product.name}" required>
    <br><br>

    Giá:
    <input type="number" step="0.01" name="price" value="${product.price}" required>
    <br><br>

    URL hình ảnh:
    <input type="text" name="url_image" value="${product.urlImage}">
    <br><br>

    <button type="submit">Lưu</button>
</form>

<br>
<a href="list">⬅ Quay lại danh sách</a>

</body>
</html>
