<!DOCTYPE html>
<html lang="kr">
<#include "/common/head.ftl">
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
    margin:120px 0 80px 0 ;
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
        font-size: 23px;
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
          background:#DBE5FD ;
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
          background:#DBE5FD;
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

    .signin__btn{
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
<body>
  <div class="container">
    <h1><img src="images/logo.png" class="img-fluid"/><span>집하자</span></h1>
    <ul class="links">
      <li>
        <a href="" id="signin">로그인</a>
      </li>
      <li>
        <a href="/register" id="signup">회원가입</a>
      </li>

    </ul>

    <form  action="/login" method="post">
      <div class="first-input input__block first-input__block">
        <input type="text" placeholder="전화번호" class="input" id="phone" name="phone"/>
      </div>
      <div class="input__block">
        <input type="password" placeholder="비밀번호" class="input" id="password" name="password"/>
      </div>
      <div class="input__block">
        <input type="password" placeholder="비밀번호를 한번더 입력해주세요" class="input repeat__password" id="repeat__password"    />
      </div>
      <button type="submit" class="signin__btn">
        로그인
      </button>
    </form>
    <!-- separator -->
    <div>
      <p>비밀번호를 잊으셨나요? <a href="reset_password.html">여기를 클릭하세요.</a></p>
    </div>

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
  $(document).ready(function() {
    // Reference to form elements using jQuery selectors
    const loginForm = $('.container form');
    const phone = $('#phone'); // Corrected ID selector
    const password = $('#password');
    const repeatPasswordInput = $('#repeat__password');
    const signInButton = $('.signin__btn');

    function showError(input, message) {
      let container = $(input).parent();
      let error = container.find('.error');
      if (error.length === 0) {
        container.append('<div class="error"></div>');
        error = container.find('.error');
      }
      error.text(message);
      input.addClass('input error');
    }

    function clearError(input) {
      let container = $(input).parent();
      let error = container.find('.error');
      if (error.length) {
        error.remove();
      }
      input.removeClass('input error').addClass('input');
    }

    loginForm.on('submit', function(event) {
      let hasError = false;

      // Check phone number input
      if (phone.val().trim() === '') {
        showError(phone, '전화번호를 입력해주세요.');
        hasError = true;
      } else {
        clearError(phone);
      }

      // Check password input
      if (password.val().trim() === '') {
        showError(password, '비밀번호를 입력해주세요.');
        hasError = true;
      } else {
        clearError(password);
      }

      // Prevent form submission if there are errors
      if (hasError) {
        event.preventDefault();
      }
    });

  });

</script>
</body>
</html>