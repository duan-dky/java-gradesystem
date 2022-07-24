<%--
  Created by IntelliJ IDEA.
  User: fengzhanwei
  Date: 2022/6/28
  Time: 下午 5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>主页</title>
  <!--写base标签，永远固定相对路径跳转的结果-->
  <base href="http://localhost:8080/std_war_exploded//">
  <link rel="stylesheet" href="../fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
  <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/templatemo-xtra-blog.css" rel="stylesheet">
  <style type="text/css">
    .login_banner {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    .login_banner {
      height: 700px;
      background-color: #cceac7;
    }
    .login_banner .register_form {
      width: 506px;
      height: 450px;
      background-color: #c6c698;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .login_banner .register_form form .form-item .errMess{
      font-size: 12px;
      color: red;
      visibility: hidden;
      margin: 2px 0;
    }
    .errMess{
      height: 14px;
    }
    .login_banner .register_form form {
      width: 100%;
      height: 100%;
      font-size: 16px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .login_banner .register_form form .form-item div {
      margin: 0;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .login_banner .register_form form .form-item {
      display: flex;
      width: 346px;
      flex-direction: column;
      margin: 0;
    }
    .login_banner .register_form .form-item {
      margin-top: 10px !important;
    }
    .login_banner .register_form form .form-item div input {
      width: 262px;
      height: 40px;
      border: 1px #e3e3e3 solid;
      outline: none;
    }
    .login_banner .register_form form .btn {
      width: 360px;
      height: 40px;
      background-color: #39987c;
      color: #fff;
      outline: none;
      border: none;
      margin-top: 10px;
    }
  </style>
  <script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
  <script type="text/javascript">
    $(function () {
      $(".btn").click(function () {
        //邮箱验证：xxxx@xxx.com
        //1.获取邮箱里的内容
        var emailText=$("#email").val();
        //2.创建正则表达式对象
        var emailPatt=/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
        //3.使用test方法验证
        if(!emailPatt.test(emailText)){
          alert("*邮箱格式不合法！*");
          return false;
        }
      });
    });
  </script>
</head>
<body>
<%@include file="../common/header_student.jsp"%>
<div class="container-fluid">
  <div style="border: 1px black solid;width: 1200px;position: absolute;left: 320px;">
    <div class="login_banner">
      <div class="register_form">
        <form action="StudentServlet" method="get">
          <input type="hidden" name="action" value="updateUsr"/>
          <input type="hidden" name="id" value="${requestScope.user.id}"/>
          <input type="hidden" name="urole" value="${requestScope.user.urole}"/>
          <div class="form-item">
            <div>
              <label>邮箱:</label>
              <input type="text" name="email" id="email" placeholder="请输入邮箱"  value="${requestScope.user.email}"/>
            </div>
            <span class="errMess" >请输入正确的邮箱</span>
          </div>
          <div class="form-item">
            <div>
              <label>密码:</label>
              <input type="password" name="passwd" placeholder="请输入密码" value="${requestScope.user.passwd}" />
            </div>
            <span class="errMess">请输入正确密码</span>
          </div>
          <div class="form-item">
            <div>
              <label>确认密码:</label>
              <input type="password" name="passwd_1" placeholder="请输入密码" value="" />
            </div>
            <span class="errMess">两次密码不一致</span>
          </div>
          <button class="btn">提交</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
