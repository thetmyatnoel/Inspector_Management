<!DOCTYPE html>
<html lang="kr">
<#include "/common/head.ftl">
<body>
<div class="container mt-5">
    <h1 class="mb-4">비밀번호 재설정</h1>
    <div class="row">
        <div class="col-md-6 offset-md-3"> <!-- Adjusts the column size to 6 and centers it -->
            <form action="/reset-passwords" method="post">
                <div class="form-group">
                    <input type="email" placeholder="등록된 이메일 주소" class="form-control" id="email" name="email" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">재설정 링크 보내기</button>
            </form>
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
    });
</script>
</body>
</html>
