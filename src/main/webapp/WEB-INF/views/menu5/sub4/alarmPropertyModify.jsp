<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

	<!-- [ Main Content ] start -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
 					<h5>알람속성 수정</h5>
				</div>
				<div class="card-body">
					<form id="modify" role="form">
						<div class="row">
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">대분류</label>
	                                <select class="form-control js-example-placeholder-multiple col-sm-12" name="categoryCombo" disabled>
							        	<option>선택</option>
									    <option value="">선택</option>
							        	<option value="L01" <c:if test="${alarmProperty.category eq 'L01'}">selected</c:if>>심박</option>
							        	<option value="L02" <c:if test="${alarmProperty.category eq 'L02'}">selected</c:if>>호흡</option>
							        	<option value="L03" <c:if test="${alarmProperty.category eq 'L03'}">selected</c:if>>수면</option>											                                    
	                                </select>
							    </div>
							</div>							
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">대분류</label>
	                                <select class="form-control js-example-placeholder-multiple col-sm-12" name="categorySubCombo" disabled>
							        	<option>선택</option>
									    <option value="">선택</option>
							        	<option value="M01" <c:if test="${alarmProperty.categorySub eq 'M01'}">selected</c:if>>서맥</option>
							        	<option value="M02" <c:if test="${alarmProperty.categorySub eq 'M02'}">selected</c:if>>과호흡</option>
							        	<option value="M03" <c:if test="${alarmProperty.categorySub eq 'M03'}">selected</c:if>>수면등급(A)</option>							        											                                    
	                                </select>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">대분류</label>
	                                <select class="form-control js-example-placeholder-multiple col-sm-12" name="alarmTypeCombo" disabled>
							        	<option>선택</option>
									    <option value="">선택</option>
							        	<option value="AT01" <c:if test="${alarmProperty.alarmType eq 'AT01'}">selected</c:if>>주의</option>
							        	<option value="AT02" <c:if test="${alarmProperty.alarmType eq 'AT02'}">selected</c:if>>관심</option>
							        	<option value="AT03" <c:if test="${alarmProperty.alarmType eq 'AT03'}">selected</c:if>>경고</option>							        											                                    
	                                </select>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">FROM</label>
							        <input type="number" class="form-control" name="alarmFrom" placeholder="FROM" value='<c:out value="${alarmProperty.alarmFrom}"/>'>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">TO</label>
							        <input type="number" class="form-control" name="alarmTo" placeholder="TO" value='<c:out value="${alarmProperty.alarmTo}"/>'>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">기준(분)</label>
							        <input type="number" class="form-control" name="basisMin" placeholder="기준(분)" value='<c:out value="${alarmProperty.basisMin}"/>'>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">설명</label>
							        <textarea class="form-control" name="description" rows="5" placeholder="설명"><c:out value="${alarmProperty.description}"/></textarea>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">사용유무</label>
							        <div class="form-check">
							            <label class="form-check-label">
							                <input class="form-check-input" type="radio" name="radio-alertYn" value="Y" <c:if test="${alarmProperty.alertYn eq 'Y'}">checked</c:if>> 사용
							            </label>
							        </div>
							        <div class="form-check">
							            <label class="form-check-label">
							                <input class="form-check-input" type="radio" name="radio-alertYn" value="N" <c:if test="${alarmProperty.alertYn eq 'N'}">checked</c:if>> 미사용
							            </label>
							        </div>
							    </div>
							</div>
						</div>
						
						<div class="float-right">                    							
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModifyModal">수정</button>
							<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmRemoveModal">삭제</button>
							<button type="button" class="btn btn-info" data-oper="list">목록</button>
						</div>
						                     							
						<input type='hidden' name='pageNum' value='<c:out value="${pageVO.pageNum}"/>'>
						<input type='hidden' name='amount' value='<c:out value="${pageVO.amount}"/>'>
						<input type='hidden' name='searchCategory' value='<c:out value="${searchCategory}"/>'> 
						<input type='hidden' name='searchCategorySub' value='<c:out value="${searchCategorySub}"/>'>
						<input type='hidden' name='searchAlarmType' value='<c:out value="${searchAlarmType}"/>'>					
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
				<p>알람속성을 수정 하시겠습니까?</p>
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
				<p>알람속성을 삭제 하시겠습니까?</p>
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
		// 수정 버튼 선택
		$('button[data-oper=modify]').on('click', function(e) {			
			e.preventDefault();
			
			$('#confirmModifyModal').modal('toggle'); 
    		
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
			
			gfn_callServer('POST', '/menu5/sub4/modify', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerModifyResult, 30000, csrfTokenValue);			
	    });		
		
		// 삭제 버튼 선택
		$('button[data-oper=remove]').on('click', function(e) {			
			e.preventDefault();
			
			$('#confirmRemoveModal').modal('toggle'); 
			
			var formData = {
					category: $('select[name=categoryCombo]').val(),
					categorySub: $('select[name=categorySubCombo]').val(),
					alarmType: $('select[name=alarmTypeCombo]').val()
				};
			
			gfn_callServer('POST', '/menu5/sub4/remove', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerRemoveResult, 30000, csrfTokenValue);
	    });
		
		// 목록 버튼 선택
		$('button[data-oper=list]').on('click', function(e) {			
			e.preventDefault();
			
			var formData = {
					pageNum: $('input[name=pageNum]').val(), 
					amount: $('input[name=amount]').val(), 				
					searchCategory: $('input[name=searchCategory]').val(), 
					searchCategorySub: $('input[name=searchCategorySub]').val(), 
					searchAlarmType: $('input[name=searchAlarmType]').val()
				};
			
			gfn_callMenu('GET', '/menu5/sub4/alarmPropertyList', true, formData, 'text', gfn_callMenuResult, 30000);
	    });
	});
	
// 수정 후 처리
function callServerModifyResult(data) {
	if (data == 'success') {
		swal({
		     title: 'SUCCESS',
		     text: '알람속성 수정 완료',
		     icon: 'success',
		     buttons: 'OK'
		}).then(function () {
			var formData = {
					pageNum: $('input[name=pageNum]').val(), 
					amount: $('input[name=amount]').val(), 				
					searchCategory: $('input[name=searchCategory]').val(), 
					searchCategorySub: $('input[name=searchCategorySub]').val(), 
					searchAlarmType: $('input[name=searchAlarmType]').val()
				};
			
			gfn_callMenu('GET', '/menu5/sub4/alarmPropertyList', true, formData, 'text', gfn_callMenuResult, 30000);
		});
	}
}
	
// 삭제 후 처리
function callServerRemoveResult(data) {
	if (data == 'success') {
		swal({
		     title: 'SUCCESS',
		     text: '알람속성 삭제 완료',
		     icon: 'success',
		     buttons: 'OK'
		}).then(function () {
			gfn_callMenu('GET', '/menu5/sub4/alarmPropertyList', true, '', 'text', gfn_callMenuResult, 30000);
		});
	}
}	
</script>