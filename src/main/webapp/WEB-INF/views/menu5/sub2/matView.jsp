<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

	<!-- [ Main Content ] start -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<h5>매트 상세 보기</h5>
				</div>
				<div class="card-body">
					<form id="view">
						<div class="row">
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">매트 ID</label>
							        <input type="text" class="form-control" name="matId" value='<c:out value="${mat.matId}"/>' readonly="readonly">
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">설명</label>
							    	<textarea class="form-control" rows="3" name='description' readonly="readonly"><c:out value="${mat.description}" /></textarea>
							    </div>
							</div>
							<div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">사용유무</label>
                                    <select class="form-control js-example-placeholder-multiple " id="useYn" name="useYn" onChange="" readonly="readonly">
                                        <option value="Y" <c:if test="${mat.useYn=='Y'}">selected</c:if>>사용</option>
                                        <option value="N" <c:if test="${mat.useYn=='N'}">selected</c:if>>미사용</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">기관</label>
                                    <select class="form-control js-example-placeholder-multiple " id="agencyNo" name="agencyNo" onChange="" readonly="readonly">
                                        <c:forEach items="${comboAgnyList}" var="agencyCombo">
                                            <option value="${agencyCombo.agencyNo}" <c:if test="${agencyCombo.agencyNo == mat.agencyNo}">selected</c:if>>${agencyCombo.agencyName}</option>
                                        </c:forEach>
                                    </select>

                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">그룹</label>
                                    <select class="form-control js-example-placeholder-multiple " id="groupSeq" name="groupSeq" onChange="" readonly="readonly">
                                        <c:forEach items="${comboAgCyGrpList}" var="grpCombo">
                                            <option value="${grpCombo.groupSeq}" <c:if test="${grpCombo.groupSeq == mat.groupSeq}">selected</c:if> >${grpCombo.groupName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
						</div>

						<button type="button" data-oper='modify' class="btn btn-primary">수정</button>
						<button type="button" data-oper='list' class="btn btn-info">목록</button>

						<input type='hidden' name='matNo' value='<c:out value="${mat.matNo}"/>'>
						<input type='hidden' name='pageNum' value='<c:out value="${pageVO.pageNum}"/>'>
						<input type='hidden' name='amount' value='<c:out value="${pageVO.amount}"/>'>
						<input type='hidden' name='searchMatId' value='<c:out value="${searchMatId}"/>'>
						<input type='hidden' name='searchMatDesc' value='<c:out value="${searchMatDesc}"/>'>
						<input type='hidden' name='searchUseYn' value='<c:out value="${searchUseYn}"/>'>
						<input type='hidden' name='searchAgency' value='<c:out value="${searchAgency}"/>'>
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
				matNo: $('input[name=matNo]').val(),
				pageNum: $('input[name=pageNum]').val(),
				amount: $('input[name=amount]').val(),
				searchMatId: $('input[name=searchMatId]').val(),
				searchMatDesc: $('input[name=searchMatDesc]').val(),
				searchAgency: $('input[name=searchAgency]').val()
			};

		gfn_callServer('POST', '/menu5/sub2/matModify', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
    });

	$('button[data-oper=list]').on('click', function(e){
		e.preventDefault();

		var formData = {
				pageNum: $('input[name=pageNum]').val(),
				amount: $('input[name=amount]').val(),
				searchMatId: $('input[name=searchMatId]').val(),
				searchUseYn: $('input[name=searchUseYn]').val()
			};

		gfn_callMenu('GET', '/menu5/sub2/matList', true, formData, 'text', gfn_callMenuResult, 30000);
    });
});

</script>