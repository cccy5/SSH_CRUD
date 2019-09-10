<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/8
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>list</title>



    <link href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery-3.3.1/jquery-3.3.1.min.js"></script>
</head>
<body>
<button class="btn btn-success">按钮list</button>

<div class="container">
         <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSH_CRUD</h1>
        </div>
    </div>
        <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary btn-lg">增加</button>
            <button class="btn btn-danger btn-lg">删除</button>
        </div>
    </div>
        <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered">
                <tr>
                    <td>序号</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>邮箱</td>
                    <td>部门</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td>${emp.empId}</td>
                        <td>${emp.empName}</td>
                        <td>${emp.gender=="M"?"男":"女"}</td>
                        <td>${emp.email}</td>
                        <td>${emp.department.deptName}</td>
                        <td>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑</button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除</button>
                        </td>

                    </tr>
                </c:forEach>

            </table>

        </div>
    </div>
        <%--分页--%>
    <div class="row">

            <%--分页文字信息--%>
            <div class="col-md-6">
                当前${pageInfo.pageNum}页，总共有${pageInfo.pages}页,
                总共有 ${pageInfo.total}记录
            </div>
                <%--分页条信息--%>
            <div class="col-md-6">

            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="<%=request.getContextPath()%>/emp/all?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li>
                            <a href="<%=request.getContextPath()%>/emp/all?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach  items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                                <li class="active"><a href="#">${page_Num }</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                                <li><a href="<%=request.getContextPath()%>/emp/all?pn=${page_Num }">${page_Num }</a></li>
                        </c:if>
                    </c:forEach>


                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="<%=request.getContextPath()%>/emp/all?pn=${pageInfo.pageNum+1 }"aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                             </a>
                        </li>
                    </c:if>
                    <li><a href="<%=request.getContextPath()%>/emp/all?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>

    </div>


</div>
</body>
</html>
