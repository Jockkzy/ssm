<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

</head>
<body>
<div class="modal fade" id="updateEmp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改员工</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" name="empId">
        <form class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label">员工姓名</label>
            <div class="col-sm-5">
              <input type="text" class="form-control" name="empName" id="update_empname" >
              <span class="help-block"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">员工邮箱</label>
            <div class="col-sm-5">
              <input type="email" class="form-control" name="email" id="update_empemail" >
              <span class="help-block"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">员工性别</label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <input type="radio" name="gender" id="update_gender1" value="男" checked="checked"> 男
              </label>
              <label class="radio-inline">
                <input type="radio" name="gender" id="update_gender2" value="女"> 女
              </label>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label">员工部门</label>
            <div class="col-sm-3">
              <select class="form-control" name="dId" id="update_empselect">

              </select>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="update" >修改</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="addEmp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加员工</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" name="empId">
        <form class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label">员工姓名</label>
            <div class="col-sm-5">
              <input type="text" class="form-control" name="empName" id="empname" >
              <span class="help-block"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">员工邮箱</label>
            <div class="col-sm-5">
              <input type="email" class="form-control" name="email" id="empemail" >
              <span class="help-block"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">员工性别</label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <input type="radio" name="gender" id="gender1" value="男" checked="checked"> 男
              </label>
              <label class="radio-inline">
                <input type="radio" name="gender" id="gender2" value="女"> 女
              </label>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label">员工部门</label>
            <div class="col-sm-3">
              <select class="form-control" name="dId" id="addempselect">

              </select>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="saveemp" >保存</button>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <h1>SSM-CRUD</h1>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12 col-md-offset-10">
      <button class="btn btn-primary" id="add">新增</button>
      <button class="btn btn-danger" id="del">删除</button>
    </div>
  </div>
  <div class="row">
    <table class="table table-striped" id="emps_table">
      <thead>
      <tr>
        <td><input type="checkbox" id="check"></td>
        <td>员工编号</td>
        <td>员工姓名</td>
        <td>员工性别</td>
        <td>员工邮箱</td>
        <td>员工部门</td>
        <td>操作</td>
      </tr>
      </thead>

      <tbody>

      </tbody>

    </table>
  </div>
  <div class="row">
    <div class="container">
      <div class="col-md-6" id="pageinfo">

      </div>

      <div class="col-md-6" id="page_nav">

      </div>
    </div>
  </div>

</div>
<script type="text/javascript" src="jquery/jquery-3.6.0.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<script>
    var currentPage;
  $("#empname").change(function(){
    //发送ajax请求校验用户名是否可用
    var empName = this.value;
    $.ajax({
      url:"/checkuser",
      data:"empName="+empName,
      type:"POST",
      success:function(result){
        if(result.code==200){
          show_validate_msg("#empname","success","用户名可用");
          $("#saveemp").attr("ajax-va","success");
        }else{
          show_validate_msg("#empname","error",result.map.va_msg);
          $("#saveemp").attr("ajax-va","error");
        }
      }
    });
  });

  function validate_add(){
    //1、拿到要校验的数据，使用正则表达式
    var empName = $("#empname").val();
    var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
    if(!regName.test(empName)){
      show_validate_msg("#empname", "error", "用户名必须是2-5位中文或者6-16位英文和数字的组合!");
      return false;
    }else{
      show_validate_msg("#empname", "success", "");
    };

    //2、校验邮箱信息
    var email = $("#empemail").val();
    var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if(!regEmail.test(email)){
      show_validate_msg("#empemail", "error", "邮箱格式不正确");
      return false;
    }else{
      show_validate_msg("#empemail", "success", "");
    }
    return true;
  }
  //显示校验结果的提示信息
  function show_validate_msg(ele,status,msg){
    //清除当前元素的校验状态
    $(ele).parent().removeClass("has-success has-error");
    $(ele).next("span").text("");
    if("success"==status){
      $(ele).parent().addClass("has-success");
      $(ele).next("span").text(msg);
    }else if("error" == status){
      $(ele).parent().addClass("has-error");
      $(ele).next("span").text(msg);
    }
  }

    $("#saveemp").click(function () {
      if(!validate_add()){
        return false;
      }
      if($(this).attr("ajax-va")=="error"){
          return false;
      }
        $.post({
            url:'/emp',
            data:$("#addEmp form").serialize(),
            success:function (result) {
              console.log(result);
              if(result.code==200){
                $("#addEmp").modal("hide");
                $("#check").prop("checked",false);
                topage(9999);
              }else{
                if(undefined!=result.map.errormsg.email){
                  show_validate_msg("#empemail", "error",result.map.errormsg.email);
                }
                if(undefined!=result.map.errormsg.empName){
                  show_validate_msg("#empname", "error",result.map.errormsg.empName);
                }
              }

          }
        })
    })
    
  function getDept(ele){
      $.get({
          url: "/dept",
          success:function (result){
           $.each(result.map.depts,function () {
             let options=$("<option></option>").append(this.deptName).attr("value",this.deptId);
             options.appendTo(ele);
           })
        }
      })
  }

  function reset_form(ele){
    $(ele)[0].reset();
    $(ele).find("*").removeClass("has-success has-error");
    $(ele).find(".help-block").text("");
  }

  $("#del").click(function () {
      let empName="";
      let del_ids="";
      $.each($(".check_item:checked"),function () {
          empName +=$(this).parents("tr").find("td:eq(2)").text()+",";
          del_ids +=$(this).parents("tr").find("td:eq(1)").text()+"-";
      })
      empName=empName.substring(0,empName.length-1);
      del_ids=del_ids.substring(0,del_ids.length-1);
      if(confirm("确认删除["+empName+"]吗?")){
        $.ajax({
            url:"/delemp/"+del_ids,
            type:"DELETE",
            success:function (result) {
                alert(result.msg);
                $("#check").prop("checked",false);
                topage(currentPage);
            }
        })
      }
  })

  $("#add").click(function () {
    reset_form("#addEmp form");
    $("#addempselect").empty();
    getDept("#addempselect");
    $("#addEmp").modal({
      backdrop:"static"
    });
  })

  $("#update").click(function() {
    //2、校验邮箱信息
    var email = $("#update_empemail").val();
    var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if (!regEmail.test(email)) {
      show_validate_msg("#update_empemail", "error", "邮箱格式不正确");
      return false;
    } else {
      show_validate_msg("#update_empemail", "success", "");
    }

    $.ajax({
      url:"/updateEmp/"+$(this).attr("update-id"),
      type:"PUT",
      data:$("#updateEmp form").serialize(),
      success: function (result) {
          console.log(result);
          $("#updateEmp").modal("hide");
          $("#check").prop("checked",false);
          topage(currentPage);
          //alert(result.msg);
      }
    });
  });

  $(document).on("click",".updatebtn",function () {
    $("#update_empselect").empty();
    getEmp($(this).attr("update-id"));
    getDept("#update_empselect");
    $("#update").attr("update-id",$(this).attr("update-id"));
    $("#updateEmp").modal({
      backdrop:"static"
    });
  })

    $(document).on("click",".delbtn",function () {
       let empName = $(this).parents("tr").find("td:eq(2)").text();
       let empId = $(this).parents("tr").find("td:eq(1)").text();
       if(confirm("确认删除["+empName+"]吗?")){
           $.ajax({
                url:"/delemp/"+empId,
                type:"DELETE",
                success:function (request) {
                    alert(request.msg);
                    $("#check").prop("checked",false);
                    topage(currentPage);
                }
           })
       }
    })

    $("#check").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    })

    $(document).on("click",".check_item",function () {
        let flag=$(".check_item:checked").length==$(".check_item").length;
        $("#check").prop("checked",flag);
    })


  function getEmp(id){
    $.get({
      url:"/getemp/"+id,
      success:function (result) {
        var empData = result.map.emp;
        $("#update_empname").val(empData.empName);
        $("#update_empemail").val(empData.email);
        $("#updateEmp input[name=gender]").val([empData.gender]);
        $("#updateEmp select").val([empData.dId]);
      }
    })
  }
  
  topage(1);

  function topage(pn){
    $.get({
      url:"/emp",
      data:"pagenumber="+pn,
      success:function (result) {
        emps_table(result);
        page_info(result);
        page_nav(result);
      }
    })
  }


  function emps_table(result) {
    $("#emps_table tbody").empty();
      let emps=result.map.PageInfo.list;
      $.each(emps,function (index,item) {
          let checkId=$("<td><input type='checkbox' class='check_item'></td>")
          let empId=$("<td></td>").append(item.empId);
          let empName=$("<td></td>").append(item.empName);
          let gender=$("<td></td>").append(item.gender);
          let email=$("<td></td>").append(item.email);
          let deptName=$("<td></td>").append(item.department.deptName);
          let editbtn=$("<button></button>").addClass("btn btn-info updatebtn").append("编辑");
          editbtn.attr("update-id",item.empId);
          let delbtn=$("<button></button>").addClass("btn btn-danger delbtn").append("删除");
          let btn=$("<td></td>").append(editbtn).append(" ").append(delbtn);
          $("<tr></tr>").append(checkId).append(empId).append(empName).append(gender).append(email).append(deptName)
                  .append(btn).appendTo("#emps_table tbody");
      })
  }

    function page_info(result) {
      $("#pageinfo").empty();
      $("#pageinfo").append("当前"+result.map.PageInfo.pageNum+"页,共计"+
              result.map.PageInfo.pages+"页,共"+result.map.PageInfo.total+"条记录");
        currentPage=result.map.PageInfo.pageNum;
    }
    function page_nav(result) {
      $("#page_nav").empty();
      var ul = $("<ul></ul>").addClass("pagination");
      var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
      firstPageLi.click(function () {
        topage(1);
      })
      
      var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
      prePageLi.click(function () {
        topage(result.map.PageInfo.pageNum-1);
      })
      if(result.map.PageInfo.hasPreviousPage==false){
        firstPageLi.addClass("disabled");
        prePageLi.addClass("disabled");
      }
      var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
      nextPageLi.click(function () {
        topage(result.map.PageInfo.pageNum+1);
      })
      var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
      lastPageLi.click(function () {
        topage(result.map.PageInfo.pages);
      })
      if(result.map.PageInfo.hasNextPage==false){
        nextPageLi.addClass("disabled");
        lastPageLi.addClass("disabled");
      }

      ul.append(firstPageLi).append(prePageLi);
      $.each(result.map.PageInfo.navigatepageNums,function (index,item) {
        let numLi = $("<li></li>").append($("<a></a>").append(item));
        numLi.click(function () {
          topage(item);
        })
        if(result.map.PageInfo.pageNum==item){
          numLi.addClass("active")
        }
        ul.append(numLi);
      })
      ul.append(nextPageLi).append(lastPageLi);
      $("<nav></nav>").append(ul).appendTo("#page_nav");
    }


</script>
</body>
</html>
