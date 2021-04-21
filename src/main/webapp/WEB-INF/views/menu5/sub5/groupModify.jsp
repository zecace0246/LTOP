<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

  <!-- [ Main Content ] start -->
  <div class="row">
    <div class="col-sm-12">
      <div class="card">
        <div class="card-header">
           <h5>그룹 수정</h5>
        </div>
        <div class="card-body">
          <form id="modify" role="form">
            <div class="row">
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">기관명</label>
                      <select class="form-control js-example-placeholder-multiple " id="agencyNo" name="agencyNo" onChange="">
                          <option value="">선택</option>
                          <c:forEach items="${comboAgnyList}" var="agencyCombo">
                              <option value="${agencyCombo.agencyNo}" <c:if test="${group.agencyNo eq agencyCombo.agencyNo}">selected</c:if>>${agencyCombo.agencyName}</option>
                           </c:forEach>
                      </select>
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">그룹명</label>
                      <input type="text" class="form-control" id="groupName" name="groupName" value='<c:out value="${group.groupName}"/>' >
                  </div>
              </div>
              <div class="col-md-12">
                  <div class="form-group">
                      <label class="form-label">설명</label>
                      <textarea class="form-control" id="description" name="description" rows="5" placeholder="설명"><c:out value="${group.description}"/></textarea>
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">관리자</label>
                        <select class="form-control js-example-placeholder-multiple col-sm-12" id="agencyAdminCombo" name="agencyAdminCombo">
                          <option>선택</option>
                          <c:forEach items="${agencyAdminCombo}" var="agencyAdminCombo">
                              <option value="${agencyAdminCombo.userId}" <c:if test="${group.groupAdmId eq agencyAdminCombo.userId}">selected</c:if>>${agencyAdminCombo.userName}</option>
                          </c:forEach>
                        </select>
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">사용유무</label>
                      <select class="form-control js-example-placeholder-multiple " id="useYn" name="useYn" onChange="">
                           <option value="Y" <c:if test="${group.useYn=='Y'}">selected</c:if>>사용</option>
                           <option value="N" <c:if test="${group.useYn=='N'}">selected</c:if>>미사용</option>
                       </select>
                  </div>
              </div>
            </div>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModifyModal">수정</button>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmRemoveModal">삭제</button>
            <button type="button" class="btn btn-info" data-oper="list">목록</button>

            <input type='hidden' name='groupSeq' value='<c:out value="${group.groupSeq}"/>'>
            <input type='hidden' name='pageNum' value='<c:out value="${pageVO.pageNum}"/>'>
            <input type='hidden' name='amount' value='<c:out value="${pageVO.amount}"/>'>
            <input type='hidden' name='searchAgencyName' value='<c:out value="${searchAgencyName}"/>'>
            <input type='hidden' name='searchGroupName' value='<c:out value="${searchGroupName}"/>'>
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
        <p>그룹을 수정 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" data-oper="modify">수정</button>
      </div>
    </div>
  </div>
</div>

<div id="confirmRemoveModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmRemoveModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmRemoveModalLabel">LTOP</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <p>그룹을 삭제 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-danger" data-oper="remove">삭제</button>
      </div>
    </div>
  </div>
</div>

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

      if ($('select[name=agencyNo]').val() == '선택') {
          $('.toast-body').text(' 기관명을 선택해 주세요 ');
          $('.toast-center').toast('show');
          return false;
       }

      if (gfn_isNull($('input[name=groupName]').val())) {
          $('.toast-body').text(' 그룹명을 입력해 주세요 ');
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
    	  groupSeq: $('input[name=groupSeq]').val(),
    	  agencyNo: $('select[name=agencyNo]').val(),
    	  groupName: $('input[name=groupName]').val(),
    	  description: $('textarea[name=description]').val(),
    	  groupAdmId: $('select[name=agencyAdminCombo]').val(),
          useYn: $('select[name=useYn]').val()
        };

      gfn_callServer('POST', '/menu5/sub5/modify', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerModifyResult, 30000, csrfTokenValue);
      });

    // 삭제 버튼 선택
    $('button[data-oper=remove]').on('click', function(e) {
      e.preventDefault();

      $('#confirmRemoveModal').modal('toggle');

      var formData = {groupSeq: $('input[name=groupSeq]').val()};

      gfn_callServer('POST', '/menu5/sub5/remove', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerRemoveResult, 30000, csrfTokenValue);
     });

    // 목록 버튼 선택
    $('button[data-oper=list]').on('click', function(e) {
      e.preventDefault();

      var formData = {
    	      pageNum: $('input[name=pageNum]').val(),
    	      amount: $('input[name=amount]').val(),
    	      searchAgencyName: $('input[name=searchAgencyName]').val(),
    	      searchGroupName: $('input[name=searchGroupName]').val(),
    	      searchAdmName: $('input[name=searchAdmName]').val()
        };

      gfn_callMenu('GET', '/menu5/sub5/groupList', true, formData, 'text', gfn_callMenuResult, 30000);
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
              searchGroupName: $('input[name=searchGroupName]').val(),
              searchAdmName: $('input[name=searchAdmName]').val()
        };

      gfn_callMenu('GET', '/menu5/sub5/groupList', true, formData, 'text', gfn_callMenuResult, 30000);
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
      gfn_callMenu('GET', '/menu5/sub5/groupList', true, '', 'text', gfn_callMenuResult, 30000);
    });
  }
}

</script>