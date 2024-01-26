<!DOCTYPE html>
<html lang="en">
<#include "/common/head.ftl">
<style>
    #sidebar {
        width: 250px;
        position: fixed;
        left: -250px;
        transition: left 0.3s;
    }

    #sidebar.active {
        left: 0;
    }
    .main-panel {
        transition: width 0.3s;
        width: 100%;

    }

    .main-panel.shrunk {
        padding-left: 250px;
    }
    #formSubmit
    {
        font-size: 18px;
    }


</style>
<body>
<div class="container-scroller">
    <nav class="navbar">
        <button id="sidebarToggle">
            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-text-indent-left text-muted" viewBox="0 0 16 16">
                <path d="M2 3.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm.646 2.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1 0 .708l-2 2a.5.5 0 0 1-.708-.708L4.293 8 2.646 6.354a.5.5 0 0 1 0-.708zM7 6.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm-5 3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"></path>
            </svg>
        </button>
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown show">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown" aria-expanded="true">
                    <img src="/images/user.png" alt="profile">
                    <#if username?? && username != "">
                        ${username}
                    <#else>
                        User
                    </#if>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                    <a class="dropdown-item" href="/logout"><i class="ti-power-off text-primary"></i>Logout</a>
                </div>
            </li>

        </ul>
    </nav>
    <!-- Include Sidebar -->
    <#include "common/sidebar.ftl">
    <div class="main-panel">
        <!-- Main Content -->
        <div class="content-wrapper">
            <form id="myForm" method="post">
                <div class="row mb-3">
                    <div class="col-md-2 h5 mt-3">고객명</div>
                    <div class="col-md-10"><input type="text" name="name" class="form-control form-control-lg" placeholder="Enter customer name"></div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-2 h5 mt-3">휴대폰</div>
                    <div class="col-md-10"><input type="text" name="phone" class="form-control form-control-lg" placeholder="Enter phone number"></div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-2 h5 mt-3">이메일</div>
                    <div class="col-md-10"><input type="email" name="email" class="form-control form-control-lg" placeholder="Enter email"></div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-2 h5 mt-3">아파트명</div>
                    <div class="col-md-10"><input type="text" name="apartmentName" class="form-control form-control-lg" placeholder="Enter apartment name"></div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-2 h5 mt-3">주소</div>
                    <div class="col-md-10"><textarea name="address" class="form-control form-control-lg" placeholder="Enter address"></textarea></div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-2 h5 mt-3">평수</div>
                    <div class="col-md-10"><input type="text" name="area" class="form-control form-control-lg" placeholder="Enter area in 평"></div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-2 h5 mt-3">점검일</div>
                    <div class="col-md-10">
                        <input type="date" name="inspectionDate" class="form-control form-control-lg" placeholder="Select inspection date">
                    </div>
                </div>

                <div class="row">
                    <div class="col text-center">
                        <button type="button" class="btn btn-primary btn-lg" id="formSubmit">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


        <!-- Footer -->
        <#include "/common/footer.ftl">
    </div>

</div>



<!-- Common JavaScript Files -->
<#include "/common/js.ftl">
<script src="/page/index.js"></script>
</body>
</html>
