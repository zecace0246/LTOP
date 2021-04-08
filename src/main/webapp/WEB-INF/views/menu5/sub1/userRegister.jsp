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
                            <div class="row">
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">사용자 ID</label>
                                        <input type="text" class="form-control" name="userId" placeholder="사용자 ID">
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">사용자 이름</label>
                                        <input type="text" class="form-control" name="userName" placeholder="사용자 이름">
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">전화번호</label>
                                        <input type="text" class="form-control" name="tel" placeholder="전화번호">
                                    </div>
                                </div>
                                                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">사용유무</label>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="radio" name="radio-enabled" value="1" checked> 사용
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="radio" name="radio-enabled" value="0"> 미사용
                                            </label>
                                        </div>
                                    </div>
                                </div>                                
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">매트 ID</label>
		                                <select class="form-control js-example-placeholder-multiple col-sm-12" name="matId">
		                                    <option>선택</option>
		                                    <option value="mat01">매트01</option>
		                                    <option value="mat02">매트02</option>
		                                    <option value="mat03">매트03</option>
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
