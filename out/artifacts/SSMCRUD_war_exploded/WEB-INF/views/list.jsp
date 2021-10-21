<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="../../jquery/jquery-3.6.0.min.js">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <table class="table table-striped">
            <tr>
                <td>员工编号</td>
                <td>员工姓名</td>
                <td>员工性别</td>
                <td>员工邮箱</td>
                <td>员工部门</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <td>${emp.empId}</td>
                    <td>${emp.empName}</td>
                    <td>${emp.gender}</td>
                    <td>${emp.email}</td>
                    <td>${emp.department.deptName}</td>
                    <td>
                        <button class="btn btn-info">编辑</button>
                        <button class="btn btn-danger">删除</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="row">
        <div class="container">
            <div class="col-md-6">
                当前${pageInfo.pageNum}页,共计${pageInfo.pages}页,共${pageInfo.total}条记录
            </div>

            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="/emp?pagenumber=1">首页</a></li>

                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="/emp?pagenumber=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                            <c:if test="${pageInfo.pageNum==page}">
                                <li class="active"><a href="#">${page}</a></li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum!=page}">
                                <li><a href="/emp?pagenumber=${page}">${page}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="/emp?pagenumber=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="/emp?pagenumber=${pageInfo.pages}">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</div>
</body>
</html>
