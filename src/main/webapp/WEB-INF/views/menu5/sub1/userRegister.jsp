<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-sm-12">
                <div class="card select-card">
                    <div class="card-header">
                        <h5>사용자 등록</h5>
                    </div>
                    <div class="card-body">
                        <form id="register">
                            <!-- <div class="row">  -->
                            <div class="form-group row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">사용자 ID</label>
                                        <input type="text" class="form-control" id="userId" name="userId" placeholder="사용자 ID">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">사용자 비밀번호</label>
                                        <input type="password" class="form-control" id="userPw" name="userPw" placeholder="사용자 비밀번호">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">사용자 이름</label>
                                        <input type="text" class="form-control" id="userName" name="userName" placeholder="사용자 이름">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">성별</label>
                                        <select class="form-control js-example-placeholder-multiple " id="sexCd" name="sexCd" onChange="">
                                          <option value="" >선택</option>
                                          <option value="M" >남</option>
                                          <option value="F" >여</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">생년월일</label>
                                        <input type="text" class="form-control" id="birthday" name="birthday" placeholder="ex) 1974-01-01">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">연락처</label>
                                        <input type="text" class="form-control" id="tel" name="tel" placeholder="ex) 010-1234-5678">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">키</label>
                                        <input type="text" class="form-control" id="height" name="height" placeholder="키">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">몸무게</label>
                                        <input type="text" class="form-control" id="weight" name="weight" placeholder="몸무게">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">수면시작시간</label>
                                        <select class="form-control js-example-placeholder-multiple " id="sleepTime" name="sleepTime" onChange="">
                                          <option value="" >선택</option>
                                          <c:forEach var="i" begin="12" end="24">
                                              <option value="${i}" >${i}</option>
                                          </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">수면종료시간</label>
                                        <select class="form-control js-example-placeholder-multiple " id="sleepEndtime" name="sleepEndtime" onChange="">
                                          <option value="" >선택</option>
                                          <c:forEach var="i" begin="1" end="24">
                                              <option value="${i}" >${i}</option>
                                          </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">낙상감지 사용여부</label>
                                        <select class="form-control js-example-placeholder-multiple " id="fallYn" name="fallYn" onChange="">
                                          <option value="" >선택</option>
                                          <option value="Y" >사용</option>
                                          <option value="N" >미사용</option>
                                      </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                         <!-- 화면 구조 맞추기 위해 -->
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">자세유지 사용여부</label>
                                        <select class="form-control js-example-placeholder-multiple " id="positionYn" name="positionYn" onChange="">
                                          <option value="" >선택</option>
                                          <option value="Y" >사용</option>
                                          <option value="N" >미사용</option>
                                      </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">자세유지시간</label>
                                        <select class="form-control js-example-placeholder-multiple " id="positionTime" name="positionTime" onChange="">
                                          <option value="" >선택</option>
                                          <c:forEach var="k" begin="1" end="8">
                                              <option value="${k}" >${k}</option>
                                          </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">매트 ID</label>
                                        <select class="form-control js-example-placeholder-multiple " id="matId" name="matId" onChange="">
                                            <option value="">선택</option>
                                            <c:forEach items="${comboMatList}" var="matCombo">
                                              <option value="${matCombo.matNo}" >${matCombo.matId}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">기관</label>
                                        <select class="form-control js-example-placeholder-multiple " id="agencyNo" name="agencyNo" onChange="">
                                            <option value="">선택</option>
                                            <c:forEach items="${comboAgnyList}" var="agencyCombo">
                                              <option value="${agencyCombo.agencyNo}" >${agencyCombo.agencyName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                      <label class="form-label">사용유무</label>
                                      <select class="form-control js-example-placeholder-multiple " id="enabled" name="enabled" onChange="">
                                          <option value="" >선택</option>
                                          <option value="Y" >사용</option>
                                          <option value="N" >미사용</option>
                                      </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                      <label class="form-label">사용자 권한</label>
                                      <select class="form-control js-example-placeholder-multiple " id="auth" name="auth" onChange="">
                                          <option value="" >선택</option>
                                          <option value="ROLE_ADMIN" >관리자</option>
                                          <option value="ROLE_USER" >기관관리자</option>
                                          <option value="ROLE_MEMBER" >일반사용자</option>
                                      </select>
                                    </div>
                                </div>

                            </div>

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModal">저장</button>
                            <button type="reset" data-oper="reset" class="btn btn-secondary">취소</button>
                            <button type="button" data-oper="list" class="btn btn-info">목록</button>

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->

</div>

<div id="confirmModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmModalLabel">LTOP</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <p>사용자를 등록 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary" data-oper="register">저장</button>
      </div>
    </div>
  </div>
</div>

<!-- sweet alert Js -->
<script src="/resources/assets/js/plugins/sweetalert.min.js"></script>
<script src="/resources/assets/js/pages/ac-alert.js"></script>

<script type="text/javascript">

$(document).ready(function() {
  var csrfTokenValue = '${_csrf.token}';

  // 저장 버튼 선택
  $('button[data-oper=register]').on('click', function(e) {
    e.preventDefault();

    $('#confirmModal').modal('toggle');

    if (gfn_isNull($('input[name=userId]').val())) {
      $('.toast-body').text(' 사용자 ID를 입력해 주세요 ');
      $('.toast-center').toast('show');
      $('input[name=userId]').focus();
      return false;
    }

    if (gfn_isNull($('input[name=userPw]').val())) {
        $('.toast-body').text(' 사용자 비밀번호를 입력해 주세요 ');
        $('.toast-center').toast('show');
        $('input[name=userPw]').focus();
        return false;
      }

    if (gfn_isNull($('input[name=userName]').val())) {
      $('.toast-body').text(' 사용자 이름을 입력해 주세요 ');
      $('.toast-center').toast('show');
      $('input[name=userName]').focus();
      return false;
    }

    if (gfn_isNull($('select[name=sexCd]').val())) {
        $('.toast-body').text(' 성별을 선택해 주세요 ');
        $('.toast-center').toast('show');
        return false;
      }

    if (gfn_isNull($('input[name=birthday]').val())) {
        $('.toast-body').text(' 생년월일를 입력해 주세요 ');
        $('.toast-center').toast('show');
        $('input[name=birthday]').focus();
        return false;
      }

    if (gfn_isNull($('input[name=tel]').val())) {
      $('.toast-body').text(' 연락처를 입력해 주세요 ');
      $('.toast-center').toast('show');
      return false;
    }

    if (gfn_isNull($('select[name=enabled]').val())) {
      $('.toast-body').text(' 사용유무를 선택해 주세요 ');
      $('.toast-center').toast('show');
      return false;
    }

    if (gfn_isNull($('select[name=auth]').val())) {
        $('.toast-body').text(' 사용자 권한을 선택해 주세요 ');
        $('.toast-center').toast('show');
        return false;
      }

    /*if ($('select[name=matId]').val() == '선택') {
      $('.toast-body').text(' 매트ID를 선택해 주세요 ');
      $('.toast-center').toast('show');
      return false;
    }

    if ($('select[name=group]').val() == '선택') {
      $('.toast-body').text(' 그룹을 선택해 주세요 ');
      $('.toast-center').toast('show');
      return false;
    }*/

    var formData = {
        userId: $('input[name=userId]').val(),
        userPw: $('input[name=userPw]').val(),
        userName: $('input[name=userName]').val(),
        sexCd: $('select[name=sexCd]').val(),
        birthday: $('input[name=birthday]').val(),
        tel: $('input[name=tel]').val(),
        height: $('input[name=height]').val(),
        weight: $('input[name=weight]').val(),
        sleepTime: $('select[name=sleepTime]').val(),
        sleepEndtime : $('select[name=sleepEndtime]').val(),
        fallYn: $('select[name=fallYn]').val(),
        positionYn: $('select[name=positionYn]').val(),
        positionTime: $('select[name=positionTime]').val(),
        /*enabled: $('input:radio[name=radio-enabled]').is(':checked') == true ? '1' : '0',*/
        enabled: $('select[name=enabled]').val(),
        matId: $('select[name=matId]').val(),
        agencyNo: $('select[name=agencyNo]').val(),
        auth : $('select[name=auth]').val()
      };

    gfn_callServer('POST', '/menu5/sub1/register', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerRegisterResult, 30000, csrfTokenValue);
  });

  // 목록 버튼 선택
  $('button[data-oper=list]').on('click', function(e){
    e.preventDefault();

    gfn_callMenu('GET', '/menu5/sub1/userList', true, '', 'text', gfn_callMenuResult, 30000);
    });

});

// 저장 알림 후 목록 페이지 이동
function callServerRegisterResult(data) {
  if (data == 'success') {
    swal({
         title: 'SUCCESS',
         text: '사용자 등록 완료',
         icon: 'success',
         buttons: 'OK'
    }).then(function () {
      gfn_callMenu('GET', '/menu5/sub1/userList', true, '', 'text', gfn_callMenuResult, 30000);
    });
  }
}

</script>
