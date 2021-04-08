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
                        <h5>BOARD MODIFY</h5>
                    </div>
                    <div class="card-body">
                        <form id="modify" role="form">
                            <div class="row">
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">NO</label>
                                        <input type="text" class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
                                    </div>
                                </div>                                
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">Title</label>
                                        <input type="text" class="form-control" name='title' value='<c:out value="${board.title }"/>'>
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">Content</label>
                                    	<textarea class="form-control" rows="3" name='content'><c:out value="${board.content}" /></textarea>
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">Writer</label>
                                        <input type="text" class="form-control" name='writer' value='<c:out value="${board.writer }"/>' readonly="readonly">
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">Register Date</label>
                                        <input type="text" class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />'  readonly="readonly">
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label">Update Date</label>
                                        <input type="text" class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />'  readonly="readonly">
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
                            		
							<c:if test="${not empty attatchList}">
								<div class="card">
								    <div class="card-header">
								        <h5>Attached Files</h5>
								    </div>
								    <div class="card-body task-attachment">
								        <ul class="media-list p-0">
		
											<c:forEach items="${attatchList}" var="attach">																		
												<c:url value="/display" var="imageUrl">
													<c:param name="fileName" value="${attach.uploadPath}/s_${attach.uuid}_${attach.fileName}" />
												</c:url>
																								
												<c:choose>
													<c:when test="${attach.fileType}">
																																							
											            <li class="media d-flex m-b-15" data-path="${attach.uploadPath}" data-uuid="${attach.uuid}" data-filename="${attach.fileName}" data-type="${attach.fileType}">
											                <div class="m-r-20 file-attach">
											                    <i class="far fa-file-image f-28 text-muted"></i>
											                </div>
											                <div class="media-body">
											                    <img src="${imageUrl}">
											                    <div class="text-muted">
											                        <small>${attach.fileName}</small>
											                    </div>
											                </div>
											                <div class="float-right text-muted">
											                    <i class="fas fa-window-close f-18" data-path="${attach.uploadPath}" data-uuid="${attach.uuid}" data-filename="${attach.fileName}" data-type="${attach.fileType}" style="cursor: pointer;"></i>
											                </div>
											            </li>
														
													</c:when>
													<c:otherwise>
													
											            <li class="media d-flex m-b-15" data-path="${attach.uploadPath}" data-uuid="${attach.uuid}" data-filename="${attach.fileName}" data-type="${attach.fileType}">
											                <div class="m-r-20 file-attach">
											                    <i class="far fa-file f-28 text-muted"></i>
											                </div>
											                <div class="media-body">
											                    <div class="text-muted">
											                        <small>${attach.fileName}</small>
											                    </div>
											                </div>
											                <div class="float-right text-muted">
											                    <i class="fas fa-window-close f-18" data-path="${attach.uploadPath}" data-uuid="${attach.uuid}" data-filename="${attach.fileName}" data-type="${attach.fileType}" style="cursor: pointer;"></i>
											                </div>
											            </li>					
													
													</c:otherwise>
												</c:choose>
											</c:forEach>						            
								            
								        </ul>
								    </div>
								</div>
							</c:if>
							                            							
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModifyModal">Modify</button>
							<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmRemoveModal">Remove</button>
							<button type="button" class="btn btn-info" data-oper="list">List</button>							
                            							
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
							<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
							<input type='hidden' name='searchTitle' value='<c:out value="${cri.searchTitle}"/>'> 
							<input type='hidden' name='searchContent' value='<c:out value="${cri.searchContent}"/>'>
							<input type='hidden' name='searchWriter' value='<c:out value="${cri.searchWriter}"/>'>								
                        </form>
                    </div>
                </div>
            </div>
            <!-- [ Form Validation ] end -->
        </div>
        <!-- [ Main Content ] end -->
	</div>
	
	<div id="confirmModifyModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmModifyModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmModifyModalLabel">LTOP Modal</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<p>Would you like to modify?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" data-oper="modify">Modify</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="confirmRemoveModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmRemoveModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmRemoveModalLabel">LTOP Modal</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<p>Would you like to delete?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger" data-oper="remove">Remove</button>
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
		$("button[data-oper='modify']").on("click", function(e) {			
			e.preventDefault();
			
			$('#confirmModifyModal').modal('toggle'); 
    		
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
 		    
 		    formData.append("bno", $('input[name=bno]').val());
			formData.append("title", $('input[name=title]').val());
			formData.append("content", $('textarea[name=content]').val());
			formData.append("writer", $('input[name=writer]').val());
			
			gfn_callMultipartServer("POST", "/board/modify", "true", formData, "text", callServerResult, 30000, csrfTokenValue);
	    });		
		
		// 삭제 버튼 선택
		$("button[data-oper='remove']").on("click", function(e) {			
			e.preventDefault();
			
			$('#confirmRemoveModal').modal('toggle'); 
			
			var formData = {bno: $('input[name=bno]').val()};
			
			gfn_callServer("POST", "/board/remove", true, JSON.stringify(formData), "application/json", "text", callServerRemoveResult, 30000, csrfTokenValue);
	    });
		
		// 목록 버튼 선택
		$("button[data-oper='list']").on("click", function(e) {			
			e.preventDefault();
			
			var formData = {
					pageNum: $('input[name=pageNum]').val(), 
					amount: $('input[name=amount]').val(), 
					searchTitle: $('input[name=searchTitle]').val(), 
					searchContent: $('input[name=searchContent]').val(), 
					searchWriter: $('input[name=searchWriter]').val()
				};
			
			gfn_callMenu("GET", "/board/boardList", true, formData, "text", gfn_callMenuResult, 30000);
	    });
		
		// 파일 삭제 버튼 선택
		$("i.fa-window-close").on("click", function(e) {
			var formData = {
					fileName: encodeURIComponent($(this).attr("data-path") + "/" + $(this).attr("data-uuid") + "_" + $(this).attr("data-filename")), 
					type: $(this).attr("data-type") == "true" ? "image" : "file",
					uuid: $(this).attr("data-uuid")
				};
						
			gfn_callServer("POST", "/deleteFile", true, formData, "application/x-www-form-urlencoded; charset=UTF-8", "text", callServerFileRemoveResult, 30000, csrfTokenValue);
	    });
	});
	
	// 수정 후 처리
	function callServerResult(data) {
		if (data == 'success') {
			swal({
			     title: "SUCCESS",
			     text: "Modify Complete!!",
			     icon: "success", //info,success,warning,error
			     buttons: 'OK'
			}).then(function () {
				gfn_callMenu("GET", "/board/boardList", true, "", "text", gfn_callMenuResult, 30000);
			});
		}
	}
	
	// 삭제 후 처리
	function callServerRemoveResult(data) {
		if (data == 'success') {
			swal({
			     title: "SUCCESS",
			     text: "Delete Complete!!",
			     icon: "success", //info,success,warning,error
			     buttons: 'OK'
			}).then(function () {
				gfn_callMenu("GET", "/board/boardList", true, "", "text", gfn_callMenuResult, 30000);
			});
		}
	}
	
	// 파일 삭제 후 처리
	function callServerFileRemoveResult(data) {
		if (!gfn_isNull(data)) {
			$("li[data-uuid=" + data + "]").remove();
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