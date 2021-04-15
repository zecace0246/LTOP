<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

	<!-- [ Main Content ] start -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
 					<h5>매트 수정</h5>
				</div>
				<div class="card-body">
					<form id="modify" role="form">
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
                                    <textarea class="form-control" name="description" rows="5"><c:out value="${mat.description}" /></textarea>
                                </div>
                            </div>

							<div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">사용유무</label>
                                    <select class="form-control js-example-placeholder-multiple " id="useYn" name="useYn" onChange="">
                                        <option value="Y" <c:if test="${mat.useYn=='Y'}">selected</c:if>>사용</option>
                                        <option value="N" <c:if test="${mat.useYn=='N'}">selected</c:if>>미사용</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">기관</label>
                                    <select class="form-control js-example-placeholder-multiple " id="agencyNo" name="agencyNo" onChange="">
                                        <c:forEach items="${comboAgnyList}" var="agencyCombo">
                                            <option value="${agencyCombo.agencyNo}" <c:if test="${agencyCombo.agencyNo == mat.agencyNo}">selected</c:if>>${agencyCombo.agencyName}</option>
                                        </c:forEach>
                                    </select>

                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">그룹</label>
                                    <select class="form-control js-example-placeholder-multiple " id="groupSeq" name="groupSeq">
                                        <c:forEach items="${comboAgCyGrpList}" var="grpCombo">
                                            <option value="${grpCombo.groupSeq}" <c:if test="${grpCombo.groupSeq == mat.groupSeq}">selected</c:if> >${grpCombo.groupName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

						</div>

						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModifyModal">수정</button>
						<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmRemoveModal">삭제</button>
						<button type="button" class="btn btn-info" data-oper="list">목록</button>

						<input type='hidden' name='matNo'       value='<c:out value="${mat.matNo}"/>'>
						<input type='hidden' name='pageNum'     value='<c:out value="${pageVO.pageNum}"/>'>
						<input type='hidden' name='amount'      value='<c:out value="${pageVO.amount}"/>'>
						<input type='hidden' name='searchMatId' value='<c:out value="${searchMatId}"/>'>
						<input type='hidden' name='searchUseYn' value='<c:out value="${searchUseYn}"/>'>
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
				<p>매트를 수정 하시겠습니까?</p>
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
				<p>매트를 삭제 하시겠습니까?</p>
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

			if (gfn_isNull($('textarea[name=description]').val())) {
				$('.toast-body').text(' 설명을 입력해 주세요 ');
				$('.toast-center').toast('show');
				return false;
			}

			if ($('input:radio[name=radio-useYn]').is(':checked') == false) {
				$('.toast-body').text(' 사용유무를 선택해 주세요 ');
				$('.toast-center').toast('show');
				return false;
			}

			var formData = {
					matNo: $('input[name=matNo]').val(),
					matId: $('input[name=matId]').val(),
					description: $('textarea[name=description]').val(),
					useYn: $('input:radio[name=radio-useYn]:checked').val()
				};

			gfn_callServer('POST', '/menu5/sub2/modify', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerModifyResult, 30000, csrfTokenValue);
	    });

		// 삭제 버튼 선택
		$('button[data-oper=remove]').on('click', function(e) {
			e.preventDefault();

			$('#confirmRemoveModal').modal('toggle');

			var formData = {
					    matId: $('input[name=matId]').val(),
					    matNo: $('input[name=matNo]').val()
					   };

			gfn_callServer('POST', '/menu5/sub2/remove', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerRemoveResult, 30000, csrfTokenValue);
	    });

		// 목록 버튼 선택
		$('button[data-oper=list]').on('click', function(e) {
			e.preventDefault();

			var formData = {
					pageNum: $('input[name=pageNum]').val(),
					amount: $('input[name=amount]').val(),
					searchMatId: $('input[name=searchMatId]').val(),
					searchUseYn: $('input[name=searchUseYn]').val()
				};

			gfn_callMenu('GET', '/menu5/sub2/matList', true, formData, 'text', gfn_callMenuResult, 30000);
	    });

		$('#agencyNo').change(function(e){
	        var $target = $('select[name=groupSeq]');
	        var selectType=$(this).val();

	        $.ajax({
	            type : "GET",
	            url : "/selectAgencyGroupCombo",
	            async : false,
	            data : { agencyNo : selectType },
	            dataType : "json",
	            success : function(result){
	                        console.log(JSON.stringify(result) + " :: result.length ::>> "+ result.length);

	                        $target.html("");

	                        if( result.length > 0 ){
	                            $(result).each(function(i){
	                                $target.append("<option value="+result[i].groupSeq+">"+result[i].groupName+"</option>");
	                            });
	                        }else{

	                        	$target.append("<option value=''>선택</option>");
		                    }

	                        $target.focus();
	                },
	            error: function(xhr){
	                return;
	                }
	            });
	    });


	});

// 수정 후 처리
function callServerModifyResult(data) {
	if (data == 'success') {
		swal({
		     title: 'SUCCESS',
		     text: '매트 수정 완료',
		     icon: 'success',
		     buttons: 'OK'
		}).then(function () {
			var formData = {
					pageNum: $('input[name=pageNum]').val(),
					amount: $('input[name=amount]').val(),
					searchMatId: $('input[name=searchMatId]').val(),
					searchUseYn: $('input[name=searchUseYn]').val()
				};

			gfn_callMenu('GET', '/menu5/sub2/matList', true, formData, 'text', gfn_callMenuResult, 30000);
		});
	}
}

// 삭제 후 처리
function callServerRemoveResult(data) {
	if (data == 'success') {
		swal({
		     title: 'SUCCESS',
		     text: '매트 삭제 완료',
		     icon: 'success',
		     buttons: 'OK'
		}).then(function () {
			gfn_callMenu('GET', '/menu5/sub2/matList', true, '', 'text', gfn_callMenuResult, 30000);
		});
	}
}
</script>