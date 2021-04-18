<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

  <!-- [ Main Content ] start -->
  <div class="row">
    <div class="col-sm-12">
      <div class="card">
        <div class="card-header">
           <h5>기관 수정</h5>
        </div>
        <div class="card-body">
          <form id="modify" role="form">
            <div class="row">
              <div class="col-md-12">
                  <div class="form-group">
                      <label class="form-label">기관명</label>
                      <input type="text" class="form-control" id="agencyName" name="agencyName" placeholder="기관명" value='<c:out value="${agency.agencyName}"/>'>
                  </div>
              </div>
              <div class="col-md-12">
                  <div class="form-group">
                      <label class="form-label">설명</label>
                      <textarea class="form-control" id="description" name="description" rows="5" placeholder="설명"><c:out value="${agency.description}"/></textarea>
                  </div>
              </div>
              <div class="col-md-12">
                  <div class="form-group">
                      <label class="form-label">관리자</label>
                        <select class="form-control js-example-placeholder-multiple col-sm-12" id="agencyAdminCombo" name="agencyAdminCombo">
                            <option>선택</option>
                            <c:forEach items="${agencyAdminCombo}" var="agencyAdminCombo">
                                <option value="${agencyAdminCombo.userId}" <c:if test="${agency.admId eq agencyAdminCombo.userId}">selected</c:if>>${agencyAdminCombo.userName}</option>
                            </c:forEach>
                        </select>
                  </div>
              </div>
              <div class="col-md-12">
                  <div class="form-group">
                      <label class="form-label">사용유무</label>
                      <select class="form-control js-example-placeholder-multiple " id="useYn" name="useYn" onChange="">
                          <option value="Y" <c:if test="${agency.useYn=='Y'}">selected</c:if>>사용</option>
                          <option value="N" <c:if test="${agency.useYn=='N'}">selected</c:if>>미사용</option>
                      </select>
                  </div>
              </div>
            </div>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModifyModal">수정</button>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmRemoveModal">삭제</button>
            <button type="button" class="btn btn-info" data-oper="list">목록</button>

            <input type='hidden' name='agencyNo' value='<c:out value="${agency.agencyNo}"/>'>
            <input type='hidden' name='pageNum' value='<c:out value="${pageVO.pageNum}"/>'>
            <input type='hidden' name='amount' value='<c:out value="${pageVO.amount}"/>'>
            <input type='hidden' name='searchAgencyName' value='<c:out value="${searchAgencyName}"/>'>
            <input type='hidden' name='searchAdmName' value='<c:out value="${searchAdmName}"/>'>
            <input type='hidden' name='detailCUDFlag' value=''>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- [ Main Content ] end -->

</div>

<div id="confirmModifyModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmModifyModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmModifyModalLabel">LTOP</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <p>기관을 수정 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" data-oper="modify">수정</button>
      </div>
    </div>
  </div>
</div>
<!--
<div id="confirmRemoveModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmRemoveModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmRemoveModalLabel">LTOP</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <p>기관을 삭제 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-danger" data-oper="remove">삭제</button>
      </div>
    </div>
  </div>
</div>

<div id="detailCUDModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="detailCUDModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detailCUDModalLabel">그룹 상세 등록,수정 및 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">

        <form id="detailModify">
          <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="form-label">매트ID</label>
                        <select class="form-control js-example-placeholder-multiple col-sm-12" name="matCombo">
                           <option>선택</option>
                               <c:forEach items="${matCombo}" var="matCombo">
                                   <option value="${matCombo.matNo}">${matCombo.matId}</option>
                               </c:forEach>
                        </select>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label class="form-label">설명</label>
                    <textarea class="form-control" name="detailDescription" rows="5" placeholder="설명"></textarea>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label class="form-label">사용자</label>
                        <select class="form-control js-example-placeholder-multiple col-sm-12" name="agencyUserCombo">
                            <option>선택</option>
                            <c:forEach items="${agencyUserCombo}" var="agencyUserCombo">
                                <option value="${agencyUserCombo.userId}">${agencyUserCombo.userName}</option>
                            </c:forEach>
                        </select>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label class="form-label">사용유무</label>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="radio-detailUseYn" value="Y" checked> 사용
                        </label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="radio-detailUseYn" value="N"> 미사용
                        </label>
                    </div>
                </div>
            </div>
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" data-oper="detailSave">저장</button>
        <button type="button" class="btn btn-danger" data-oper="detailRemove" style="display:none;">삭제</button>
      </div>
    </div>
  </div>
</div>
-->
<!-- sweet alert Js -->
<script src="/resources/assets/js/plugins/sweetalert.min.js"></script>
<script src="/resources/assets/js/pages/ac-alert.js"></script>

<!-- moment js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">
  $(document).ready(function() {
    var csrfTokenValue = '${_csrf.token}';

    // 수정 버튼 선택
    $('button[data-oper=modify]').on('click', function(e) {
      e.preventDefault();

      $('#confirmModifyModal').modal('toggle');

      if (gfn_isNull($('input[name=agencyName]').val())) {
          $('.toast-body').text(' 기관명을 입력해 주세요 ');
          $('.toast-center').toast('show');
          return false;
        }

      if (gfn_isNull($('textarea[name=description]').val())) {
        $('.toast-body').text(' 설명을 입력해 주세요 ');
        $('.toast-center').toast('show');
        return false;
      }

      if ($('select[name=agencyAdminCombo]').val() == '선택') {
        $('.toast-body').text(' 관리자를 선택해 주세요 ');
        $('.toast-center').toast('show');
        return false;
      }

      if ($('select[name=useYn]').val() == '선택') {
        $('.toast-body').text(' 사용유무를 선택해 주세요 ');
        $('.toast-center').toast('show');
        return false;
      }

      var formData = {
          agencyNo: $('input[name=agencyNo]').val(),
          agencyName: $('input[name=agencyName]').val(),
          description: $('textarea[name=description]').val(),
          admId: $('select[name=agencyUserCombo]').val(),
          useYn: $('input:radio[name=radio-useYn]:checked').val()
        };

      gfn_callServer('POST', '/menu5/sub3/modify', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerModifyResult, 30000, csrfTokenValue);
      });

    // 삭제 버튼 선택
    $('button[data-oper=remove]').on('click', function(e) {
      e.preventDefault();

      $('#confirmRemoveModal').modal('toggle');

      var formData = {agencyNo: $('input[name=agencyNo]').val()};

      gfn_callServer('POST', '/menu5/sub3/remove', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerRemoveResult, 30000, csrfTokenValue);
      });

    // 목록 버튼 선택
    $('button[data-oper=list]').on('click', function(e) {
      e.preventDefault();

      var formData = {
          pageNum: $('input[name=pageNum]').val(),
          amount: $('input[name=amount]').val(),
          searchAgencyName: $('input[name=searchAgencyName]').val(),
          searchAdmName: $('input[name=searchAdmName]').val(),
          searchMatId: $('input[name=searchMatId]').val()
        };

      gfn_callMenu('GET', '/menu5/sub3/agencyList', true, formData, 'text', gfn_callMenuResult, 30000);
      });

    // 그룹 상세 등록
    $('#regDtl').on('click', function(e) {
      e.preventDefault();

      $('#detailModify')[0].reset();

      $('input[name=detailCUDFlag]').val('');

      $('button[data-oper=detailRemove]').css({display: 'none'});

      $('#detailCUDModal').modal('toggle');
    });

    // 그룹 상세 보기
    $('.detailModal').on('click', function(e) {
      e.preventDefault();

      var formData = {
          agencyNo: $('input[name=agencyNo]').val(),
          matId: $(this).attr('href')
        };

      gfn_callServer('POST', '/menu5/sub3/agencyDetailModify', true, formData, 'application/x-www-form-urlencoded', 'json', callServerDetailModalResult, 30000, csrfTokenValue);
    });

    // 그룹 상세 저장
    $('button[data-oper=detailSave]').on('click', function(e) {
      e.preventDefault();

      if ($('select[name=matCombo]').val() == '선택') {
        $('.toast-body').text(' 매트ID를 선택해 주세요 ');
        $('.toast-center').toast('show');
        return false;
      }

      if (gfn_isNull($('textarea[name=detailDescription]').val())) {
        $('.toast-body').text(' 설명을 입력해 주세요 ');
        $('.toast-center').toast('show');
        return false;
      }

      if ($('select[name=agencyUserCombo]').val() == '선택') {
        $('.toast-body').text(' 사용자를 선택해 주세요 ');
        $('.toast-center').toast('show');
        return false;
      }

      if ($('input:radio[name=radio-detailUseYn]').is(':checked') == false) {
        $('.toast-body').text(' 사용유무를 선택해 주세요 ');
        $('.toast-center').toast('show');
        return false;
      }

      var formData = {
          agencyNo: $('input[name=agencyNo]').val(),
          matId: $('select[name=matCombo]').val(),
          description: $('textarea[name=detailDescription]').val(),
          userId: $('select[name=agencyUserCombo]').val(),
          useYn: $('input:radio[name=radio-detailUseYn]:checked').val()
        };

      var actionUrl = '/menu5/sub3/detailRegister';

      if (!gfn_isNull($('input[name=detailCUDFlag]').val())) {
        actionUrl = '/menu5/sub3/detailModify';
      }

      gfn_callServer('POST', actionUrl, true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'json', callServerDetailCudResult, 30000, csrfTokenValue);
      });

    // 그룹 상세 삭제 버튼 선택
    $('button[data-oper=detailRemove]').on('click', function(e) {
      e.preventDefault();

      var formData = {
          agencyNo: $('input[name=agencyNo]').val(),
          matId: $('select[name=matCombo]').val()
        };

      gfn_callServer('POST', '/menu5/sub3/detailRemove', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'json', callServerDetailCudResult, 30000, csrfTokenValue);
      });

  });

// 수정 후 처리
function callServerModifyResult(data) {
  if (data == 'success') {
    swal({
         title: 'SUCCESS',
         text: '그룹 수정 완료',
         icon: 'success',
         buttons: 'OK'
    }).then(function () {
      var formData = {
          pageNum: $('input[name=pageNum]').val(),
          amount: $('input[name=amount]').val(),
          searchAgencyName: $('input[name=searchAgencyName]').val(),
          searchAdmName: $('input[name=searchAdmName]').val(),
          searchMatId: $('input[name=searchMatId]').val()
        };

      gfn_callMenu('GET', '/menu5/sub3/agencyList', true, formData, 'text', gfn_callMenuResult, 30000);
    });
  }
}

// 삭제 후 처리
function callServerRemoveResult(data) {
  if (data == 'success') {
    swal({
         title: 'SUCCESS',
         text: '그룹 삭제 완료',
         icon: 'success',
         buttons: 'OK'
    }).then(function () {
      gfn_callMenu('GET', '/menu5/sub3/agencyList', true, '', 'text', gfn_callMenuResult, 30000);
    });
  }
}

//그룹 상세 수정 정보 조회
function callServerDetailModalResult(data) {
  if (!gfn_isNull(data)) {
    $('input[name=detailCUDFlag]').val(data.agencyNo);
    $('select[name=matCombo]').val(data.matId);
    $('textarea[name=detailDescription]').val(data.description);
    $('select[name=agencyUserCombo]').val(data.userId);

    if (data.useYn == 'Y') {
      $('input:radio[name=radio-detailUseYn]:radio[value=Y]').prop('checked', true);
    } else {
      $('input:radio[name=radio-detailUseYn]:radio[value=N]').prop('checked', true);
    }

    $('button[data-oper=detailRemove]').css({display: 'block'});

    $('#detailCUDModal').modal('toggle');
  }
}

// 그룹 상세 등록,수정 및 삭제 후
function callServerDetailCudResult(data) {
  if (!gfn_isNull(data)) {
    $('#detailCUDModal').modal('toggle');

    $('#agencyMathTbody').empty();

    var contents = '';

    data.forEach(function (value, index) {
      var useYn = value.useYn == 'Y' ? '사용' : '미사용';

      contents += '<tr>';
      contents += '	<td class="text-center">';
      contents += '		<a class="detailModal" href="' + value.matId + '">'+ value.matId + '</a>'
      contents += '	</td>';
      contents += '	<td class="text-center">' + value.description + '</td>';
      contents += '	<td class="text-center">' + useYn + '</td>';
      contents += '	<td class="text-center">' + value.userId + '</td>';
      contents += '	<td class="text-center">' + moment(value.regDate).format("YYYY-MM-DD"); + '</td>';
      contents += '</tr>';
        });

    $('#agencyMathTbody').append(contents);
  }
}
</script>