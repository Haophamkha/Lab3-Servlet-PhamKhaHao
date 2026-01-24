<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form sản phẩm</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 18px;
        }

        input:focus {
            outline: none;
            border-color: #007bff;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        button {
            background: #28a745;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 15px;
        }

        button:hover {
            background: #218838;
        }

        .back {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        .back:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>
        <c:if test="${product == null}">Thêm sản phẩm</c:if>
        <c:if test="${product != null}">Sửa sản phẩm</c:if>
    </h2>

    <form action="${product == null ? 'insert' : 'update'}" method="post">

        <c:if test="${product != null}">
            <input type="hidden" name="id" value="${product.id}">
        </c:if>

        <label>Tên sản phẩm</label>
        <input type="text" name="name" value="${product.name}" required>

        <label>Giá</label>
        <input type="number" step="0.01" name="price" value="${product.price}" required>

        <label>URL hình ảnh</label>
        <input type="text" name="url_image" value="${product.url_image}">


        <div class="btn-group">
            <button type="submit">Lưu</button>
            <a class="back" href="list">Quay lại danh sách</a>
        </div>

    </form>

</div>

</body>
</html>
