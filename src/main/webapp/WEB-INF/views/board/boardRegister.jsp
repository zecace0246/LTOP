<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

	<div class="pcoded-content">

        <!-- [ Main Content ] start -->
        <div class="row">
            <!-- [ Form Validation ] start -->
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>BOARD REGISTER</h5>
                    </div>
                    <div class="card-body">
                        <form id="register" role="form" action="/board/boardRegister" method="post" enctype="multipart/form-data">
                            <div class="row">
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">Title</label>
                                        <input type="text" class="form-control" name="title" placeholder="Title">
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">Content</label>
                                        <textarea class="form-control" name="content" rows="3" placeholder="Content"></textarea>
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">Writer</label>
                                        <input type="text" class="form-control" name="writer" placeholder="Writer">
                                    </div>
                                </div>
                                
 								<div class="col-md-12">
									<div class="form-group">
										<label class="form-label">Upload File</label>
										<div>
											<input type="file" class="validation-file" name="uploadFile" multiple>
										</div>								
									</div>
								</div>
								
                            </div>

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModal">Submit</button>	
                            <button type="reset" data-oper="reset" class="btn btn-secondary">Reset</button>
							<button type="button" data-oper="list" class="btn btn-info">List</button>
							
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </div>
                </div>
            </div>
            <!-- [ Form Validation ] end -->
        </div>
        <!-- [ Main Content ] end -->

	</div>

	<div id="confirmModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmModalLabel">LTOP Modal</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<p>Would you like to save?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" data-oper="register">Save changes</button>
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
		$("button[data-oper='register']").on("click", function(e) {
			e.preventDefault();
			
			$('#confirmModal').modal('toggle'); 
    		
 			if (gfn_isNull($('input[name=title]').val())) {
 				$('.toast-body').text(' Title check please!! ');
 				$('.toast-center').toast('show');
 				return false;
 			}
 			 			
 			if (gfn_isNull($('textarea[name=content]').val())) {
 				$('.toast-body').text(' Content check please!! ');
 				$('.toast-center').toast('show');
 				return false;
 			}
 			
 			if (gfn_isNull($('input[name=writer]').val())) {
 				$('.toast-body').text(' Writer check please!! ');
 				$('.toast-center').toast('show');
 				return false;
 			}
 			
 			var formData = new FormData();
 		    var inputFile = $("input[name='uploadFile']");
 		    
 		    if (!gfn_isNull(inputFile)) {
 	 		    var files = inputFile[0].files;
 	 		     
 				for (var i = 0; i < files.length; i++) {
 					if (!checkExtension(files[i].name, files[i].size)) {	
 						return false;
 					}
 					
 					formData.append("uploadFile", files[i]); 
 				}
 		    }
			 			
			formData.append("title", $('input[name=title]').val());
			formData.append("content", $('textarea[name=content]').val());
			formData.append("writer", $('input[name=writer]').val());
			
			gfn_callMultipartServer("POST", "/board/register", "true", formData, "text", callServerResult, 30000, csrfTokenValue);
		});		
		
		// 목록 버튼 선택
		$("button[data-oper='list']").on("click", function(e){
			e.preventDefault();
			
			gfn_callMenu("GET", "/board/boardList", true, "", "text", gfn_callMenuResult, 30000);
	    });  
		
	});
	
	// 저장 알림 후 목록 페이지 이동
	function callServerResult(data) {
		if (data == 'success') {
			swal({
			     title: "SUCCESS",
			     text: "Save Complete!!",
			     icon: "success", //info,success,warning,error
			     buttons: 'OK'
			}).then(function () {
				gfn_callMenu("GET", "/board/boardList", true, "", "text", gfn_callMenuResult, 30000);
			});
		}
	}
	
	// 파일 유효성 확인
	function checkExtension(fileName, fileSize) {
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 2097152; //2MB
		
		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
	  
		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
	  
		return true;
	}
	
</script>
