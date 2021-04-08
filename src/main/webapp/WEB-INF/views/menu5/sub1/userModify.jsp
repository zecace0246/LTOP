<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">
        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>사용자 수정</h5>
                    </div>
                    <div class="card-body">
                        <form id="modify" role="form">
                            <div class="row">
                                
								<div class="col-md-12">
								    <div class="form-group">
								        <label class="form-label">사용자 ID</label>
								        <input type="text" class="form-control" name="userId" value='<c:out value="${user.userId}"/>' readonly="readonly">
								    </div>
								</div>
								<div class="col-md-12">
								    <div class="form-group">
								        <label class="form-label">사용자 이름</label>
								        <input type="text" class="form-control" name="userName" value='<c:out value="${user.userName}"/>'>
								    </div>
								</div>
								<div class="col-md-12">
								    <div class="form-group">
								        <label class="form-label">전화번호</label>
								    	<input type="text" class="form-control" name="tel" value='<c:out value="${user.tel}"/>'>
								    </div>
								</div>
								<div class="col-md-12">
		                            <div class="form-group">
		                                <label class="form-label">사용유무</label>
		                                <div class="form-check">
		                                    <label class="form-check-label">
		                                        <input class="form-check-input" type="radio" name="radio-enabled" <c:if test="${user.enabled eq '1'}">checked</c:if>> 사용
		                                    </label>
		                                </div>
		                                <div class="form-check">
		                                    <label class="form-check-label">
		                                        <input class="form-check-input" type="radio" name="radio-enabled" <c:if test="${user.enabled ne '1'}">checked</c:if>> 미사용
		                                    </label>
		                                </div>
		                            </div>
								</div>
								<div class="col-md-12">
								    <div class="form-group">
                                        <label class="form-label">매트 ID</label>
		                                <select class="form-control js-example-placeholder-multiple col-sm-12" name="matId">
		                                    <option <c:if test="${user.matId eq ''}">selected</c:if>>선택</option>
		                                    <option value="mat01" <c:if test="${user.matId eq 'mat01'}">selected</c:if>>매트01</option>
		                                    <option value="mat02" <c:if test="${user.matId eq 'mat02'}">selected</c:if>>매트02</option>
		                                    <option value="mat03" <c:if test="${user.matId eq 'mat03'}">selected</c:if>>매트03</option>
		                                </select>
								    </div>
								</div>
								<div class="col-md-12">
								    <div class="form-group">
								        <label class="form-label">그룹</label>
		                                <select class="form-control js-example-placeholder-multiple col-sm-12" name="group">
		                                    <option>선택</option>
		                                    <option value="group01">동탄요양병원</option>
		                                    <option value="group02">분당요양병원</option>
		                                    <option value="group03">성남요양병원</option>
		                                </select>								    	
								    </div>
								</div>
                                
                            </div>
							                            							
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModifyModal">수정</button>
							<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmRemoveModal">삭제</button>
							<button type="button" class="btn btn-info" data-oper="list">목록</button>
                            							
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
</div>
	
	<div id="confirmModifyModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmModifyModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmModifyModalLabel">LTOP</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<p>사용자를 수정 하시겠습니까?</p>
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
					<p>사용자를 삭제 하시겠습니까?</p>
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
	
<script type="text/javascript">
	$(document).ready(function() {
		var csrfTokenValue = '${_csrf.token}';
		
		// 수정 버튼 선택
		$('button[data-oper=modify]').on('click', function(e) {			
			e.preventDefault();
			
			$('#confirmModifyModal').modal('toggle'); 
    		

			if (gfn_isNull($('input[name=userId]').val())) {
				$('.toast-body').text(' 사용자 ID를 입력해 주세요 ');
				$('.toast-center').toast('show');
				return false;
			}
			
			if (gfn_isNull($('input[name=userName]').val())) {
				$('.toast-body').text(' 사용자 이름을 입력해 주세요 ');
				$('.toast-center').toast('show');
				return false;
			}
			
			if (gfn_isNull($('input[name=tel]').val())) {
				$('.toast-body').text(' 전화번호를 입력해 주세요 ');
				$('.toast-center').toast('show');
				return false;
			}
			
			if ($('input:radio[name=radio-enabled]').is(':checked') == false) {
				$('.toast-body').text(' 사용유무를 선택해 주세요 ');
				$('.toast-center').toast('show');
				return false;
			}		
			
			if ($('select[name=matId]').val() == '선택') {
				$('.toast-body').text(' 매트ID를 선택해 주세요 ');
				$('.toast-center').toast('show');
				return false;
			}
			
			if ($('select[name=group]').val() == '선택') {
				$('.toast-body').text(' 그룹을 선택해 주세요 ');
				$('.toast-center').toast('show');
				return false;
			}		
			
			var formData = {
					userId: $('input[name=userId]').val(),
					userName: $('input[name=userName]').val(),
					tel: $('input[name=tel]').val(),
					enabled: $('input:radio[name=radio-enabled]').is(':checked') == true ? '1' : '0',
					matId: $('select[name=matId]').val(),
					group: $('select[name=group]').val()
				};		
		
			
			gfn_callServer('POST', '/menu5/sub1/modify', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerModifyResult, 30000, csrfTokenValue);			
	    });		
		
		// 삭제 버튼 선택
		$('button[data-oper=remove]').on('click', function(e) {			
			e.preventDefault();
			
			$('#confirmRemoveModal').modal('toggle'); 
			
			var formData = {userId: $('input[name=userId]').val()};
			
			gfn_callServer('POST', '/menu5/sub1/remove', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerRemoveResult, 30000, csrfTokenValue);
	    });
		
		// 목록 버튼 선택
		$('button[data-oper=list]').on('click', function(e) {			
			e.preventDefault();
			
			var formData = {
					searchUserName: $('input[name=searchUserName]').val(), 
					searchMatId: $('input[name=searchMatId]').val(), 
					searchEnabled: $('input[name=searchEnabled]').val(),
					searchGroup: $('input[name=searchGroup]').val()
				};
			
			gfn_callMenu('GET', '/menu5/sub1/userList', true, formData, 'text', gfn_callMenuResult, 30000);
	    });
	});
	
// 수정 후 처리
function callServerModifyResult(data) {
	if (data == 'success') {
		swal({
		     title: 'SUCCESS',
		     text: '사용자 수정 완료',
		     icon: 'success',
		     buttons: 'OK'
		}).then(function () {
			gfn_callMenu('GET', '/menu5/sub1/userList', true, '', 'text', gfn_callMenuResult, 30000);
		});
	}
}
	
// 삭제 후 처리
function callServerRemoveResult(data) {
	if (data == 'success') {
		swal({
		     title: 'SUCCESS',
		     text: '사용자 삭제 완료',
		     icon: 'success',
		     buttons: 'OK'
		}).then(function () {
			gfn_callMenu('GET', '/menu5/sub1/userList', true, '', 'text', gfn_callMenuResult, 30000);
		});
	}
}	
</script>