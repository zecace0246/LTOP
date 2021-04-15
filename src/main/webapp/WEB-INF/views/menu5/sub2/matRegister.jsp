<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">

	<!-- [ Main Content ] start -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card select-card">
				<div class="card-header">
					<h5>매트 등록</h5>
				</div>
				<div class="card-body">
					<form id="register">
						<div class="row">

							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">매트 ID</label>
							        <input type="text" class="form-control" name="matId" placeholder="매트 ID">
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
						            <select class="form-control js-example-placeholder-multiple " id="useYn" name="useYn" onChange="">
		                                <option value="" >선택</option>
		                                <option value="Y" >사용</option>
		                                <option value="N" >미사용</option>
		                            </select>
							    </div>
							</div>

							<div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">기관</label>
                                    <select class="form-control js-example-placeholder-multiple " id="agencyNo" name="agencyNo" onChange="">
                                        <option value="">선택</option>
		                                <c:forEach items="${comboAgnyList}" var="agencyCombo">
		                                    <option value="${agencyCombo.agencyNo}" >${agencyCombo.agencyName}</option>
		                                </c:forEach>
                                    </select>

                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">그룹</label>
                                    <select class="form-control js-example-placeholder-multiple " id="groupSeq" name="groupSeq" required>
                                        <option value="">선택</option>
                                        <!-- <c:forEach items="${comboAgCyGrpList}" var="grpCombo">
                                            <option value="${grpCombo.groupSeq}" >${grpCombo.groupName}</option>
                                        </c:forEach>-->
                                    </select>
                                </div>
                            </div>

						</div>

						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModal">저장</button>
						<!-- <button type="reset" data-oper="reset" class="btn btn-secondary">취소</button>  -->
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
				<p>매트를 등록 하시겠습니까?</p>
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

		if (gfn_isNull($('input[name=matId]').val())) {
			$('.toast-body').text(' 매트 ID를 입력해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}

		if (gfn_isNull($('textarea[name=description]').val())) {
			$('.toast-body').text(' 설명을 입력해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}

		if (gfn_isNull($('select[name=useYn]').val())) {
			$('.toast-body').text(' 사용유무를 선택해 주세요 ');
			$('.toast-center').toast('show');
			return false;
		}

		if (gfn_isNull($('select[name=agencyNo]').val())) {
            $('.toast-body').text(' 기관을 선택해 주세요 ');
            $('.toast-center').toast('show');
            return false;
        }

		if (gfn_isNull($('select[name=groupSeq]').val())) {
            $('.toast-body').text(' 그룹을 선택해 주세요 ');
            $('.toast-center').toast('show');
            return false;
        }

		var formData = {
				matId: $('input[name=matId]').val(),
				description: $('textarea[name=description]').val(),
				useYn: $('select[name=useYn]').val(),
				agencyNo : $('select[name=agencyNo]').val(),
				groupSeq : $('select[name=groupSeq]').val()
			};

		console.log("저장 할 Data :: "+ JSON.stringify(formData) );

		gfn_callServer('POST', '/menu5/sub2/register', true, formData, 'application/x-www-form-urlencoded; charset=UTF-8', 'text', callServerRegisterResult, 30000, csrfTokenValue);
	});

	// 목록 버튼 선택
	$('button[data-oper=list]').on('click', function(e){
		e.preventDefault();

		gfn_callMenu('GET', '/menu5/sub2/matList', true, '', 'text', gfn_callMenuResult, 30000);
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
                        console.log(JSON.stringify(result));

                        $target.html("");

                        if( result.length > 0 ){
                            $(result).each(function(i){
	            	        	$target.append("<option value="+result[i].groupSeq+">"+result[i].groupName+"</option>");
                            });
                        }

                        $target.focus();
                },
            error: function(xhr){
                return;
                }
            });
    });

});

// 저장 알림 후 목록 페이지 이동
function callServerRegisterResult(data) {
	if (data == 'success') {
		swal({
		     title: 'SUCCESS',
		     text: '매트 등록 완료',
		     icon: 'success',
		     buttons: 'OK'
		}).then(function () {
			gfn_callMenu('GET', '/menu5/sub2/matList', true, '', 'text', gfn_callMenuResult, 30000);
		});
	}
}

</script>
