<!DOCTYPE html>
<html lang="en">
<#include "/common/head.ftl">
<style>
    #icon:hover{
        background-color: darkgray;
    }
    #register:hover {
        font-size: 22px;
    }
    #inspectorTable td{
        font-size: 19px;
    }
   #inspectorTable{
        text-align: center;
    }


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
            <div class="row">
                <div class="col-md-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h3>점검원리스트</h3>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table mb-0 table-striped table-hover text-nowrap" id="inspectorTable">
                                                <thead class="table-light">
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="d-flex align-items-center">
                                                            <a class="nav-link text-muted border border-2 rounded-3 text-decoration-none d-flex justify-content-center align-items-center px-4 py-2 " id="icon" href="/inspectorregister">
                                                                <div class="icon-shape icon-lg fs-3 ">
                                                                    +
                                                                </div>
                                                            </a>
                                                            <div class="ms-3">
                                                                <h4 class="mb-0 fs-5"><a href="/inspectorregister" class="text-decoration-none" id="register" style="color: #1E293B">접수</a></h4>
                                                            </div>
                                                        </div>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <th class="fs-5">번호</th>
                                                    <th class="fs-5">이름</th>
                                                    <th class="fs-5">작업수</th>
                                                    <th class="fs-5">등록일</th>
                                                </tr>

                                                </thead>
                                                <tbody>
                                                <!-- Table rows will be dynamically generated here -->
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <#include "/common/footer.ftl">
    </div>

</div>



<!-- Common JavaScript Files -->
<#include "/common/js.ftl">
<script src="/page/inspector.js"></script>
</body>
</html>
