<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .actions {
            text-align: left;
            margin-bottom: 15px;
        }

        .btn-add {
            background: #28a745;
            color: white;
            padding: 8px 14px;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
        }

        .btn-add:hover {
            background: #1e7e34;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        table th {
            background: #f0f0f0;
        }

        img {
            border-radius: 4px;
        }

        .btn-edit {
            background: #dc3545;
            color: white;
            padding: 6px 10px;
            border-radius: 4px;
            text-decoration: none;
        }

        .btn-edit:hover {
            background: #b52a37;
        }

        .btn-delete {
            background: #6c757d;
            color: white;
            padding: 6px 10px;
            border-radius: 4px;
            text-decoration: none;
            margin-left: 6px;
        }

        .btn-delete:hover {
            background: #5a6268;
        }

        .back {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #007bff;
        }

        .back:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>DANH SÁCH SẢN PHẨM</h2>

    <div class="actions">
        <a class="btn-add" href="new">Thêm sản phẩm mới</a>
    </div>

    <table>
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
                    <img src="${p.url_image}" width="80">
                </td>
                <td>
                    <a class="btn-edit" href="edit?id=${p.id}">Sửa</a>
                    <a class="btn-delete"
                       href="delete?id=${p.id}"
                       onclick="return confirm('Bạn có chắc muốn xóa?');">
                        Xóa
                    </a>
                </td>
            </tr>
        </c:forEach>

    </table>

    <a class="back" href="index.jsp">Về trang chủ</a>

</div>

</body>
</html>
