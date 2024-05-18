<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
  <script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js" defer></script>
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <title>InspectorManagement</title>
  <style>
    body{
      font-family: 'Montserrat', sans-serif;
      background:#dfe8ff;
    }

    .container{
      display:block;
      max-width:680px;
      width:80%;
      margin:120px auto;
    }

    h1{
      color:#182978;
      font-size:48px;
      letter-spacing:-3px;
      text-align:center;
      margin:80px 0 80px 0 ;
      display: flex;
      align-items: center;
      justify-content: center;
      transition:.2s linear;
    }
    h1 img{
      width:60px;
      margin-right:10px;
    }

    .links{
      list-style-type:none;
      li{
        display:inline-block;
        margin:0 20px 0 0;
        transition:.2s linear;
        &:nth-child(2){
          opacity : .6;
          &:hover{
            opacity : 1;
          }
        }
        &:nth-child(3){
          opacity : .6;
          float:right;
          &:hover{
            opacity : 1;
          }
        }
        a{
          text-decoration:none;
          color:#0f132a;
          font-weight:bolder;
          text-align:center;
          cursor : pointer;
        }
      }
    }


    form{
      width:100%;
      max-width:680px;
      margin:40px auto 10px;
      .input__block{
        margin:20px auto;
        display:block;
        position:relative;

        &.first-input__block {
          &::before {
            content: "";
            position: absolute;
            top: -15px;
            left: 50px;
            display: block;
            width: 0;
            height: 0;
            background:#e9e9e9 ;
            border-left: 15px  solid transparent;
            border-right: 15px solid transparent;
            border-bottom: 15px solid rgba(#0f132a, 0.1);
            transition: 0.2s linear;
          }
        }

        &.signup-input__block{
          &::before{
            content:"";
            position:absolute;
            top:-15px;
            left:150px;
            display:block;
            width:0;
            height:0;
            background:#ffffff;
            border-left:15px solid transparent;
            border-right:15px solid transparent;
            border-bottom:15px solid rgba(#0f132a,.1);
            transition:.2s linear;
          }
        }
        input{
          display:block;
          width:90%;
          max-width:680px;
          height:50px;
          margin:0 auto;
          border-radius:8px;
          border:none;
          background: rgba(#0f132a,.1);
          color : rgba(#0f132a,.3);
          padding:0 0 0 15px;
          font-size:14px;
          font-family: 'Montserrat', sans-serif;
          &:focus,
          &:active{
            outline:none;
            border:none;
            color : rgba(#0f132a,1);
          }
          &.repeat__password{
            opacity : 0;
            display : none;
            transition:.2s linear;
          }
        }
      }

      .signup__btn{
        background:#182978;
        color: #DBE5FD;
        display:block;
        width:92.5%;
        max-width:680px;
        height:50px;
        border-radius:8px;
        margin:0 auto;
        border:none;
        cursor:pointer;
        font-size:14px;
        font-family: 'Montserrat', sans-serif;
        box-shadow:0 15px 30px rgba(#e91e63,.36);
        transition:.2s linear;
        &:hover{
          box-shadow:0 0 0 rgba(#e91e63,.0);
        }
      }
    }

    .separator{
      display:block;
      margin:30px auto 10px;
      text-align:center;
      height:40px;
      position:relative;
      background:transparent;
      color: rgba(#0f132a,.4);
      font-size:13px;
      width:90%;
      max-width:680px;
      &::before{
        content:"";
        position:absolute;
        top:8px;
        left:0;
        background: rgba(#0f132a,.2);
        height:1px;
        width:45%;
      }
      &::after{
        content:"";
        position:absolute;
        top:8px;
        right:0;
        background: rgba(#0f132a,.2);
        height:1px;
        width:45%;
      }
    }

    footer {
      p {
        text-align: center;
        .fa{
          color: #e91e63;
        }

        a {
          text-decoration: none;
          font-size: 17px;
          margin: 0 5px;

        }
      }

    }



  </style>
</head>
<body>
  <div class="container">
    <h1><img src="images/logo.png" class="img-fluid"/><span>집하자</span></h1>
    <ul class="links">
      <li>
        <a href="" id="">회원가입</a>
      </li>
      <li>
        <a href="login" id="signin">로그인</a>
      </li>
    </ul>


    <form action="/registers" method="post">

      <div>
        <label for="name">이름</label>
        <input type="text" id="name" name="name" required>
      </div>

      <div>
        <label for="phone">전화번호</label>
        <input type="text" id="phone" name="phone" required>
      </div>

      <div>
        <label for="email">메일</label>
        <input type="text" id="email" name="email" required>
      </div>


      <div>
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password" required>
      </div>

      <div>
        <label for="password_confirmation">비밀번호 다시 입력하기</label>
        <input type="password" id="password_confirmation" name="password_confirmation" required>
      </div>

      <div class="separator">
        <button type="submit" class="signup__btn">
          가입하기
        </button>
      </div>
    </form>
    <footer>
      <p>
        켑스톤 디자인 프로재트
        <i class="fa ti-heart"></i>
        <i class="fa ti-heart"></i>
        <i class="fa ti-heart"></i>
      </p>

    </footer>

  </div>
<#include "/common/js.ftl">
<script>
  document.addEventListener('DOMContentLoaded', function() {
    <#if errorMessage??>
    alert("${errorMessage}");
    </#if>
    const form = document.querySelector('form');
    form.addEventListener('submit', function(event) {
      const name = document.getElementById('name').value.trim();
      const phone = document.getElementById('phone').value.trim();
      const email = document.getElementById('email').value.trim();
      const password = document.getElementById('password').value.trim();
      const passwordConfirmation = document.getElementById('password_confirmation').value.trim();

      if (!name || !phone || !email || !password) {
        event.preventDefault(); // Prevent the form from submitting
        alert('All fields must be filled in!');
      } else if (password !== passwordConfirmation) {
        event.preventDefault();
        alert('Passwords do not match!');
      } else {

      }
    });
  });

</script>
</body>

</html>