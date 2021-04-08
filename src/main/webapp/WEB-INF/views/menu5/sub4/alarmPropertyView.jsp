<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

	<!-- [ Main Content ] start -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<h5>알람속성 상세 보기</h5>
				</div>
				<div class="card-body">
					<form id="view">
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
							        <input type="number" class="form-control" name="alarmFrom" placeholder="FROM" value='<c:out value="${alarmProperty.alarmFrom}"/>' readonly="readonly">
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">TO</label>
							        <input type="number" class="form-control" name="alarmTo" placeholder="TO" value='<c:out value="${alarmProperty.alarmTo}"/>' readonly="readonly">
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">기준(분)</label>
							        <input type="number" class="form-control" name="basisMin" placeholder="기준(분)" value='<c:out value="${alarmProperty.basisMin}"/>' readonly="readonly">
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">설명</label>
							        <textarea class="form-control" name="description" rows="5" placeholder="설명" readonly="readonly"><c:out value="${alarmProperty.description}"/></textarea>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">사용유무</label>
							        <div class="form-check">
							            <label class="form-check-label">
							                <input class="form-check-input" type="radio" name="radio-alertYn" disabled <c:if test="${alarmProperty.alertYn eq 'Y'}">checked</c:if>> 사용
							            </label>
							        </div>
							        <div class="form-check">
							            <label class="form-check-label">
							                <input class="form-check-input" type="radio" name="radio-alertYn" disabled <c:if test="${alarmProperty.alertYn eq 'N'}">checked</c:if>> 미사용
							            </label>
							        </div>
							    </div>
							</div>																				
						</div>
						
						<div class="float-right">
							<button type="button" data-oper='modify' class="btn btn-primary">수정</button>
							<button type="button" data-oper='list' class="btn btn-info">목록</button>
						</div>
						
						<input type='hidden' name='category' value='<c:out value="${alarmProperty.category}"/>'>
						<input type='hidden' name='categorySub' value='<c:out value="${alarmProperty.categorySub}"/>'>
						<input type='hidden' name='alarmType' value='<c:out value="${alarmProperty.alarmType}"/>'>
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

<script>

$(document).ready(function() {
	$('button[data-oper=modify]').on('click', function(e){
		e.preventDefault();
		
		var formData = {
				category: $('select[name=categoryCombo]').val(),
				categorySub: $('select[name=categorySubCombo]').val(),
				alarmType: $('select[name=alarmTypeCombo]').val(),
				pageNum: $('input[name=pageNum]').val(), 
				amount: $('input[name=amount]').val(), 				
				searchCategory: $('input[name=searchCategory]').val(), 
				searchCategorySub: $('input[name=searchCategorySub]').val(), 
				searchAlarmType: $('input[name=searchAlarmType]').val()
			};
		
		gfn_callServer('POST', '/menu5/sub4/alarmPropertyModify', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
    });
      
	$('button[data-oper=list]').on('click', function(e){
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

</script>