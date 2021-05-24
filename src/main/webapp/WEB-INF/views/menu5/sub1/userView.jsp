<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

  <!-- [ Main Content ] start -->
  <div class="row">
    <div class="col-sm-12">
      <div class="card">
        <div class="card-header">
          <h5>사용자 상세 보기</h5>
        </div>
        <div class="card-body">
          <form id="view">
            <div class="row">
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">사용자 ID</label>
                      <input type="text" class="form-control" id="userId" name="userId" value="<c:out value="${user.userId}"/>" readonly="readonly">
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">사용자 이름</label>
                      <input type="text" class="form-control" id="userName" name="userName" value="<c:out value="${user.userName}"/>" readonly="readonly">
                  </div>
              </div>

              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">생년월일</label>
                      <input type="text" class="form-control" id="birthday" name="birthday" value="<c:out value="${user.birthday}"/>" readonly="readonly">
                  </div>
              </div>

              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">성별</label>
                      <input type="text" class="form-control" id="sexCd" name="sexCd" value="<c:out value="${user.sexName}"/>" readonly="readonly">
                  </div>
              </div>

              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">연락처</label>
                      <input type="text" class="form-control" id="tel" name="tel" value="<c:out value="${user.tel}"/>" readonly="readonly">
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                    <label class="form-label">사용유무</label>
                    <input type="text" class="form-control" id="enabled" name="enabled" value="<c:out value="${user.enabledName}"/>" readonly="readonly">
                  </div>
              </div>

              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">키</label>
                      <input type="text" class="form-control" id="height" name="height" value="<c:out value="${user.height}"/>" readonly="readonly">
                  </div>
              </div>

              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">몸무게</label>
                      <input type="text" class="form-control" id="weight" name="weight" value="<c:out value="${user.weight}"/>" readonly="readonly">
                  </div>
              </div>

              <div class="col-md-6">
                   <div class="form-group">
                       <label class="form-label">수면시작시간</label>
                       <input type="text" class="form-control" id="weight" name="weight" value="<c:out value="${user.sleepTime}"/>" readonly="readonly">
                   </div>
               </div>

               <div class="col-md-6">
                  <div class="form-group">
                    <label class="form-label">낙상감지 사용여부</label>
                    <input type="text" class="form-control" id="fallYn" name="fallYn" value="<c:out value="${user.fallYnName}"/>" readonly="readonly">
                  </div>
              </div>

              <div class="col-md-6">
                  <div class="form-group">
                    <label class="form-label">자세유지 사용여부</label>
                    <input type="text" class="form-control" id="positionYn" name="positionYn" value="<c:out value="${user.positionYnName}"/>" readonly="readonly">
                  </div>
              </div>

               <div class="col-md-6">
                   <div class="form-group">
                       <label class="form-label">자세유지시간</label>
                       <input type="text" class="form-control" id="weight" name="weight" value="<c:out value="${user.positionTime}"/>" readonly="readonly">
                   </div>
               </div>

              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">매트 ID</label>
                      <input type="text" class="form-control" id="matId" name="matId" value="<c:out value="${user.matId}"/>" readonly="readonly">
                  </div>
              </div>

              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">기관</label>
                      <input type="text" class="form-control" id="agencyName" name="agencyName" value="<c:out value="${user.agencyName}"/>" readonly="readonly">
                  </div>
              </div>
            </div>

            <button type="button" data-oper='modify' class="btn btn-primary">수정</button>
            <button type="button" data-oper='list' class="btn btn-info">목록</button>
            <button type="button" data-oper='setting' class="btn btn-secondary"><i class="feather mr-2 icon-check-circle"></i>알람설정</button>

            <input type='hidden' name='searchUserName' value='<c:out value="${searchUserName}"/>'>
            <input type='hidden' name='searchMatId' value='<c:out value="${searchMatId}"/>'>
            <input type='hidden' name='searchEnabled' value='<c:out value="${searchEnabled}"/>'>
            <input type='hidden' name='searchGroup' value='<c:out value="${searchGroup}"/>'>
            <input type='hidden' name='seq' value='<c:out value="${user.seq}"/>'>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          </form>
        </div>

      </div>
    </div>
  </div>
  <!-- [ Main Content ] end -->

</div>

<script>

$(document).ready(function() {
  var csrfTokenValue = '${_csrf.token}';

  $('button[data-oper=modify]').on('click', function(e){
    e.preventDefault();

    var formData = {
        userId: $('input[name=userId]').val(),
        searchUserName: $('input[name=searchUserName]').val(),
        searchMatId: $('input[name=searchMatId]').val(),
        searchEnabled: $('select[name=searchEnabled]').val(),
        searchAgency: $('select[name=searchAgency]').val()
      };

    gfn_callServer('POST', '/menu5/sub1/userModify', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
    });

  $('button[data-oper=list]').on('click', function(e){
    e.preventDefault();

    var formData = {
        searchUserName: $('input[name=searchUserName]').val(),
            searchMatId: $('input[name=searchMatId]').val(),
            searchEnabled: $('select[name=searchEnabled]').val(),
            searchAgency: $('select[name=searchAgency]').val()
      };

    gfn_callMenu('GET', '/menu5/sub1/userList', true, formData, 'text', gfn_callMenuResult, 30000);
    });

    $('button[data-oper=setting]').on('click', function(e){
        e.preventDefault();

        if( $('input[name=seq]').val() == '' ) $('input[name=seq]').val(0) ;

        var formData = {
            userId: $('input[name=userId]').val(),
            seq: $('input[name=seq]').val()
         };

        gfn_callServer('POST', '/menu5/sub1/userAlarmSetting', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
    });

});

</script>