<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

  <!-- [ Main Content ] start -->
  <div class="row">
    <div class="col-sm-12">
      <div class="card">
        <div class="card-header">
          <h5>그룹 상세 보기</h5>
        </div>
        <div class="card-body">
          <form id="view">
            <div class="row">
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">기관명</label>
                      <select class="form-control js-example-placeholder-multiple " id="agencyNo" name="agencyNo" onChange="" disabled="disabled" readonly="readonly">
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
                      <input type="text" class="form-control" id="groupName" name="groupName" value='<c:out value="${group.groupName}"/>' readonly="readonly">
                  </div>
              </div>
              <div class="col-md-12">
                  <div class="form-group">
                      <label class="form-label">설명</label>
                      <textarea class="form-control" name="description" rows="5" placeholder="설명" readonly="readonly"><c:out value="${group.description}"/></textarea>
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="form-label">관리자</label>
                        <select class="form-control js-example-placeholder-multiple col-sm-12" name="agencyAdminCombo" disabled="disabled">
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
                      <select class="form-control js-example-placeholder-multiple " id="useYn" name="useYn" onChange="" disabled="disabled" readonly="readonly">
                           <option value="Y" <c:if test="${group.useYn=='Y'}">selected</c:if>>사용</option>
                           <option value="N" <c:if test="${group.useYn=='N'}">selected</c:if>>미사용</option>
                       </select>
                  </div>
              </div>
            </div>

            <button type="button" data-oper='modify' class="btn btn-primary">수정</button>
            <button type="button" data-oper='list' class="btn btn-info">목록</button>

            <input type='hidden' name='groupSeq' value='<c:out value="${group.groupSeq}"/>'>
            <input type='hidden' name='pageNum' value='<c:out value="${pageVO.pageNum}"/>'>
            <input type='hidden' name='amount' value='<c:out value="${pageVO.amount}"/>'>
            <input type='hidden' name='searchAgencyName' value='<c:out value="${searchAgencyName}"/>'>
            <input type='hidden' name='searchGroupName' value='<c:out value="${searchGroupName}"/>'>
            <input type='hidden' name='searchAdmName' value='<c:out value="${searchAdmName}"/>'>
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
    	groupSeq: $('input[name=groupSeq]').val(),
        agencyNo: $('input[name=agencyNo]').val(),
        pageNum: $('input[name=pageNum]').val(),
        amount: $('input[name=amount]').val(),
        searchAgencyName: $('input[name=searchAgencyName]').val(),
        searchGroupName: $('input[name=searchGroupName]').val(),
        searchAdmName: $('input[name=searchAdmName]').val()
      };

    gfn_callServer('POST', '/menu5/sub5/groupModify', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
    });

  $('button[data-oper=list]').on('click', function(e){
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

</script>