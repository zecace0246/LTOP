<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="pcoded-content">
        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>사용자 알람설정</h5>
                    </div>
                    <div class="card-body">
                        <form id="settingForm" role="form">
                            <div class="row">

                             <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">사용자 ID</label>
                                        <input type="text" class="form-control" id="userId" name="userId" value="<c:out value="${alarm.userId}"/>" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">사용자 이름</label>
                                        <input type="text" class="form-control" id="userName" name="userName" value="<c:out value="${alarm.userName}"/>" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">연락처</label>
                                        <input type="text" class="form-control" id="tel" name="tel" value="<c:out value="${alarm.tel}"/>" placeholder="ex) 010-1234-5678">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                      <label class="form-label">사용유무</label>
                                      <select class="form-control js-example-placeholder-multiple " id="useYn" name="useYn" >
                                          <option value="" >선택</option>
                                          <option value="Y" <c:if test="${alarm.useYn eq 'Y'}">selected</c:if>>사용</option>
                                          <option value="N" <c:if test="${alarm.useYn eq 'N'}">selected</c:if>>미사용</option>
                                      </select>
                                    </div>
                                </div>

                            </div>

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModifyModal">저장</button>
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmRemoveModal">삭제</button>

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <input type='hidden' name='seq' value='<c:out value="${alarm.seq}"/>'>
                            <input type='hidden' name='searchUserName' value='<c:out value="${searchUserName}"/>'>
				            <input type='hidden' name='searchMatId' value='<c:out value="${searchMatId}"/>'>
				            <input type='hidden' name='searchEnabled' value='<c:out value="${searchEnabled}"/>'>
				            <input type='hidden' name='searchGroup' value='<c:out value="${searchGroup}"/>'>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
        <!-- [ Detail Content ] start -->
		<div class="row" id="divAlarmList">
		    <div class="col-sm-12">
		        <div class="card">
		            <div class="card-header">
		                <h5>사용자 알람 목록</h5>
		            </div>
		            <div class="card-body table-border-style">
		                <div class="table-responsive">
		                    <table class="table">
		                        <thead>
		                            <tr>
		                                <th class="text-center">사용자ID</th>
		                                <th class="text-center">순번</th>
		                                <th class="text-center">사용자이름</th>
		                                <th class="text-center">연락처</th>
		                                <th class="text-center">사용유무</th>
		                                <th class="text-center">등록일자</th>
		                            </tr>
		                        </thead>
		                        <tbody id="userAlarmBody">
		                            <c:choose>
		                                <c:when test="${userAlarmList ne null && fn:length(userAlarmList) > 0}">
		                                    <c:forEach items="${userAlarmList}" var="userAlarmLst">
		                                        <tr>
		                                            <td class="text-center"><c:out value="${userAlarmLst.userId}" /></td>
		                                            <td class="text-center"><c:out value="${userAlarmLst.seq}" /></td>
		                                            <td class="text-center"><c:out value="${userAlarmLst.userName}" /></td>
		                                            <td class="text-center"><c:out value="${userAlarmLst.tel}" /></td>
		                                            <td class="text-center">
		                                                <c:if test="${userAlarmLst.useYn eq 'Y'}">
		                                                    사용
		                                                </c:if>
		                                                <c:if test="${userAlarmLst.useYn eq 'N'}">
		                                                    미사용
		                                                </c:if>
		                                            </td>
		                                            <td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${userAlarmLst.regDate}" /></td>
		                                        </tr>
		                                    </c:forEach>
		                                </c:when>
		                                <c:otherwise>
		                                    <tr>
		                                      <td class="text-center" colspan="6">게시물이 없습니다</td>
		                                    </tr>
		                                </c:otherwise>
		                            </c:choose>
		                        </tbody>
		                    </table>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
<!-- [ Detail Content ] end -->
</div>


<div id="confirmModifyModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmModifyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="confirmModifyModalLabel">LTOP</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <p>사용자 알람을 저장 하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" data-oper="modify">저장</button>
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
    $('button[data-oper=modify]').on('click', function(e) {
	    e.preventDefault();

	    $('#confirmModifyModal').modal('toggle');

	    if (gfn_isNull($('input[name=tel]').val())) {
	          $('.toast-body').text(' 연락처를 입력해 주세요 ');
	          $('.toast-center').toast('show');
	          return false;
	    }

	    if (gfn_isNull($('select[name=useYn]').val())) {
	        $('.toast-body').text(' 사용유무를 선택해 주세요 ');
	        $('.toast-center').toast('show');
	        return false;
	      }

	    var formData = {
	    		userId: $('input[name=userId]').val(),
	            userName: $('input[name=userName]').val(),
	    		tel: $('input[name=tel]').val(),
	    		useYn: $('select[name=useYn]').val(),
	            seq: $('input[name=useYn]').val()
	    };

	    $.ajax({
            type : "GET",
            url : "/menu5/sub1/userAlarmregister",
            async : false,
            data : formData,
            dataType : "json",
            success : function(result){
                        console.log(" result ::>>> "+ JSON.stringify(result));

                        callServerModifyResult('success');
                },
            error: function(xhr){
                return;
                }
            });

	    //debugger;
	    callServerModifyResult('success');

    });

});

//등록 후 처리
function callServerModifyResult(data) {
	var csrfTokenValue = '${_csrf.token}';

	if (data == 'success') {
	  swal({
	       title: 'SUCCESS',
	       text: '사용자 알람 등록 완료',
	       icon: 'success',
	       buttons: 'OK'
	  }).then(function () {

		  goView();

	      /*var formData = {
	          userId: $('input[name=userId]').val(),
	          seq: $('input[name=seq]').val()
	       };

	      gfn_callServer('GET', '/menu5/sub1/userAlarmSetting', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
	      */

	  });
	}
}

function goView(){
	var formData = {
		userId: $('input[name=userId]').val(),
        searchUserName: $('input[name=searchUserName]').val(),
        searchMatId: $('input[name=searchMatId]').val(),
        searchEnabled: $('input[name=searchEnabled]').val(),
        searchAgency: $('input[name=searchAgency]').val()
      };

    gfn_callServer('POST', '/menu5/sub1/userView', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
}
