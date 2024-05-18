<!DOCTYPE html>
<html lang="kr">
<#include "/common/head.ftl">
<body>
<div class="container mt-5">
    <h1 class="mb-4">새 비밀번호 설정</h1>
    <div class="row justify-content-center"> <!-- Center the form in the middle of the page -->
        <div class="col-lg-6 col-md-8"> <!-- Adjust width for different screen sizes -->
            <#if token??>
                <form action="/update-password" method="post">
                    <input type="hidden" name="token" value="${token}"/>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="새 비밀번호 입력" name="newPassword" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="새 비밀번호 확인" name="confirmPassword" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">비밀번호 업데이트</button>
                </form>
            </#if>
        </div>
    </div>
</div>
<#include "/common/js.ftl">
<script>
    document.addEventListener('DOMContentLoaded', function ()
    {
        <#if message??>
        alert("${message}");
        </#if>
        <#if error??>
        alert("${error}");
        </#if>
        <#if pwerror??>
        alert("${pwerror}");
        </#if>
    });
</script>
</body>
</html>
