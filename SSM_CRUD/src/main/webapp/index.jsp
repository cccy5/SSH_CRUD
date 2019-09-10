<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/9
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery-3.3.1/jquery-3.3.1.min.js"></script>
    <link href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <title>index</title>
</head>
<body>
<button class="btn btn-success" id="aa">按钮list</button>


<!-- Modal提交 模态框 -->
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">增加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empNameInpute" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empNameInpute" placeholder="姓名" name="empName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_inpute" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email_inpute" placeholder="邮箱" name="email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_inpute" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_inpute" value="S"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_inpute" class="col-sm-2 control-label"></label>
                        <div class="col-sm-4">

                            <select class="form-control" name="did" id="dept_add_select">

                            </select>
                        </div>
                    </div>





                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>








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
            <button class="btn btn-primary btn-lg" id="emp_add_modal_btn12">增加1</button>
            <button class="btn btn-danger btn-lg">删除</button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered" id="emps_table">
                <thead>
                    <tr>
                        <td>序号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>邮箱</td>
                        <td>部门</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>

                </tbody>
                <%--<c:forEach items="${pageInfo.list}" var="emp">--%>
                    <%--<tr>--%>
                        <%--<td>${emp.empId}</td>--%>
                        <%--<td>${emp.empName}</td>--%>
                        <%--<td>${emp.gender=="M"?"男":"女"}</td>--%>
                        <%--<td>${emp.email}</td>--%>
                        <%--<td>${emp.department.deptName}</td>--%>
                        <%--<td>--%>
                            <%--<button class="btn btn-primary btn-sm">--%>
                                <%--<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>--%>
                                <%--编辑</button>--%>
                            <%--<button class="btn btn-danger btn-sm">--%>
                                <%--<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>--%>
                                <%--删除</button>--%>
                        <%--</td>--%>

                    <%--</tr>--%>
                <%--</c:forEach>--%>

            </table>

        </div>
    </div>
    <%--分页--%>
    <div class="row">

        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">
        </div>

    </div>


</div>

    <script type="text/javascript">
        $(function () {
            //去首页
            to_page(1) ;
        })

        //1.页面加载完直接发送ajax请求
        $(function () {
            $.ajax({
                url:"<%=request.getContextPath()%>/emp/getAll",
                data:"pn=1",
                type:"POST",
                success:function (result) {
                    //console.log(result);
                    //1.解析并显示员工数据
                    build_emps_table(result);
                    //2.解析并显示分页信息
                    build_page_info(result);
                    //解析显示分页条信息
                    build_page_nav(result);
                }
            })
        });
        function to_page(pn) {
            $.ajax({
                url:"<%=request.getContextPath()%>/emp/getAll",
                data:"pn="+pn,
                type:"POST",
                success:function (result) {
                    //console.log(result);
                    //1.解析并显示员工数据
                    build_emps_table(result);
                    //2.解析并显示分页信息
                    build_page_info(result);
                    //解析显示分页条信息
                    build_page_nav(result);
                }
            })
        }
        //表格
        function build_emps_table(result) {
            //清空table表格
            $("#emps_table tbody").empty()  ;
            var emps = result.stend.pageInfo.list ;
        // 传入的两个参数   索引  当前对象
           $.each(emps ,function(index,item) {
               var empIdTd = $("<td></td>").append(item.empId) ;
               var empNameTd = $("<td></td>").append(item.empName) ;
               var empGenderTd = $("<td></td>").append(item.gender=='M'?"男":"女") ;
               var empEmailTd = $("<td></td>").append(item.email) ;
               var empDeptNameTd = $("<td></td>").append(item.department.deptName) ;
               var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
                   .append($("<span ></span>").addClass("glyphicon glyphicon-pencil")).append("编辑") ;
               var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                   .append($("<span ></span>").addClass("glyphicon glyphicon-trash")).append("删除") ;

               var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn) ;

               $("<tr></tr>").append(empIdTd)
                   .append(empNameTd)
                   .append(empGenderTd)
                   .append(empEmailTd)
                   .append(empDeptNameTd)
                   .append(btnTd)
                   .appendTo("#emps_table tbody") ;
            })
        }
        //解析显示分页信息
        function build_page_info(result) {
            //    清空分页信息
            $("#page_info_area").empty() ;
            $("#page_info_area").append("当前"+result.stend.pageInfo.pageNum+"页，" +
                "总共有"+result.stend.pageInfo.pages+"页," +
                "总共有"+result.stend.pageInfo.total+"记录") ;
        }
        //解析显示分页条信息
        function build_page_nav(result) {
            // page_nav_area
            //    <li>
            // <a href="#" aria-label="Previous">
            //     <span aria-hidden="true">&laquo;</span>
            // </a>
            // </li>
            //清空分页条
            $("#page_nav_area").empty() ;
            var uluu = $("<ul></ul>").addClass("pagination") ;
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#")) ;
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;")) ;
            if(result.stend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled") ;
                prePageLi.addClass("disabled")
            }else{
                firstPageLi.click(function () {
                    to_page(1) ;
                }) ;
                prePageLi.click(function () {
                    to_page(result.stend.pageInfo.pageNum -1) ;
                }) ;
            }

            uluu.append(firstPageLi).append(prePageLi) ;
            //遍历页码
            $.each(result.stend.pageInfo.navigatepageNums,function (index,item) {
                var  numLi = $("<li></li>").append($("<a></a>").append(item)) ;
                if(result.stend.pageInfo.pageNum==item){
                    numLi.addClass("active")
                }
                numLi.click(function () {
                    to_page(item) ;
                }) ;
                uluu.append(numLi)
            });
                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;")) ;
                var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#")) ;
                uluu.append(nextPageLi).append(lastPageLi) ;

                var navEle = $("<nav></nav>").append(uluu);
            if(result.stend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled") ;
                lastPageLi.addClass("disabled")
            }else{
                nextPageLi.click(function () {
                    to_page(result.stend.pageInfo.pageNum+1) ;
                }) ;
                lastPageLi.click(function () {
                    to_page(result.stend.pageInfo.pages) ;
                }) ;
            }
                navEle.appendTo("#page_nav_area") ;
        }
        //点击新增按钮 弹出模态框
        $("#emp_add_modal_btn12").click(function () {
            //发送ajax请求 查出部门信息 显示在下拉列表中
            //弹出模态窗
            getDeparts("#dept_add_select") ;
            $('#empAddModel').modal({
                backdrop:"static"
            })
        });
        //查出所有部门信息 并显示在下拉列表中
        function getDeparts() {
            $("#dept_add_select").empty() ;
            $.ajax({
                url:"<%=request.getContextPath()%>/dept/all",
                type:"POST",
                success:function (result) {
                    // console.log(result) ;

                    // $("#dept_add_select").append("")
                    $.each(result.stend.depts,function () {
                        // console.log(result);
                        var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId) ;
                       optionEle.appendTo("#dept_add_select") ;

                     });
                 }
             });
        }

        $("#emp_save_btn").click(function () {
            //模态框中填写的表单数据提交给服务器保存
        }) ;
    </script>
</body>
</html>
