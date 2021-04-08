<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

	<!-- [ Main Content ] start -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card select-card">
				<div class="card-header">
					<h5>알람속성 등록</h5>
				</div>
				<div class="card-body">
					<form id="register">
						<div class="row">
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">대분류</label>
	                                <select class="form-control js-example-placeholder-multiple col-sm-12" name="categoryCombo">
									    <option value="">선택</option>
							        	<option value="L01">심박</option>
							        	<option value="L02">호흡</option>
							        	<option value="L03">수면</option>
	                                </select>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">소분류</label>
	                                <select class="form-control js-example-placeholder-multiple col-sm-12" name="categorySubCombo">
									    <option value="">선택</option>
							        	<option value="M01">서맥</option>
							        	<option value="M02">과호흡</option>
							        	<option value="M03">수면등급(A)</option>
	                                </select>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">알람타입</label>
	                                <select class="form-control js-example-placeholder-multiple col-sm-12" name="alarmTypeCombo">
									    <option value="">선택</option>
							        	<option value="AT01">주의</option>
							        	<option value="AT02">관심</option>
							        	<option value="AT03">경고</option>
	                                </select>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">FROM</label>
							        <input type="number" class="form-control" name="alarmFrom" placeholder="FROM">
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">TO</label>
							        <input type="number" class="form-control" name="alarmTo" placeholder="TO">
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">기준(분)</label>
							        <input type="number" class="form-control" name="basisMin" placeholder="기준(분)">
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">설명</label>
							        <textarea class="form-control" name="description" rows="5" placeholder="설명"></textarea>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">사용유무</label>
							        <div class="form-check">
							            <label class="form-check-label">
							                <input class="form-check-input" type="radio" name="radio-alertYn" value="Y" checked> 사용
							            </label>
							        </div>
							        <div class="form-check">
							            <label class="form-check-label">
							                <input class="form-check-input" type="radio" name="radio-alertYn" value="N"> 미사용
							            </label>
							        </div>
							    </div>
							</div>
						</div>
						
						<div class="float-right">
							<button type="button" data-toggle="modal" class="btn btn-primary" data-target="#confirmModal">저장</button>	
							<button type="reset" data-oper="reset" class="btn btn-secondary">취소</button>
							<button type="button" data-oper="list" class="btn btn-info">목록</button>
						</div>
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
				<p>알람속성을 등록 하시겠습니까?</p>
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
	// 저장 버튼 선택
	$('button[data-oper=register]').on('click', function(e) {
		e.preventDefault();
		
		$('#confirmModal').modal('toggle'); 
   		
		if (gfn_isNull($('select[name=categoryCombo]').val())) {
			$('.toast-body').text(' 대분류를 선택해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}
		
		if (gfn_isNull($('select[name=categorySubCombo]').val())) {
			$('.toast-body').text(' 소분류를 선택해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}
		
		if (gfn_isNull($('select[name=alarmTypeCombo]').val())) {
			$('.toast-body').text(' 알람타입을 선택해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}
		
		if (gfn_isNull($('input[name=alarmFrom]').val())) {
			$('.toast-body').text(' FROM을 입력해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}
		
		if (gfn_isNull($('input[name=alarmTo]').val())) {
			$('.toast-body').text(' TO를 입력해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}
				
		if (gfn_isNull($('input[name=basisMin]').val())) {
			$('.toast-body').text(' 기준(분)을 입력해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}
			
		if (gfn_isNull($('textarea[name=description]').val())) {
			$('.toast-body').text(' 설명을 입력해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}
		
		if ($('input:radio[name=radio-alertYn]').is(':checked') == false) {
			$('.toast-body').text(' 사용유무를 선택해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}
		
		var formData = {
				category: $('select[name=categoryCombo]').val(),
				categorySub: $('select[name=categorySubCombo]').val(),
				alarmType: $('select[name=alarmTypeCombo]').val(),
				alarmFrom: $('input[name=alarmFrom]').val(),
				alarmTo: $('input[name=alarmTo]').val(),
				basisMin: $('input[name=basisMin]').val(),
				description: $('textarea[name=description]').val(),
				alertYn: $('input:radio[name=radio-alertYn]:checked').val()
			};
		
		gfn_callServer('POST', '/menu5/sub4/register', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerRegisterResult, 30000, csrfTokenValue);
	});		
	
	// 목록 버튼 선택
	$('button[data-oper=list]').on('click', function(e){
		e.preventDefault();
		
		gfn_callMenu('GET', '/menu5/sub4/alarmPropertyList', true, '', 'text', gfn_callMenuResult, 30000);
    });  
	
});

// 저장 알림 후 목록 페이지 이동
function callServerRegisterResult(data) {
	if (data == 'success') {
		swal({
		     title: 'SUCCESS',
		     text: '알람속성 등록 완료',
		     icon: 'success',
		     buttons: 'OK'
		}).then(function () {
			gfn_callMenu('GET', '/menu5/sub4/alarmPropertyList', true, '', 'text', gfn_callMenuResult, 30000);
		});
	}
}
		
</script>
