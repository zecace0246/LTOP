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
					<h5>BOARD VIEW</h5>
				</div>
				<div class="card-body">
					<form id="view" role="form">
						<div class="row">
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">NO</label>
							        <input type="text" class="form-control" name='bno' value='<c:out value="${board.bno}"/>' readonly="readonly">
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">Title</label>
							        <input type="text" class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly="readonly">
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">Content</label>
							    	<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.content}" /></textarea>
							    </div>
							</div>
							<div class="col-md-12">
							    <div class="form-group">
							        <label class="form-label">Writer</label>
							        <input type="text" class="form-control" name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly">
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
											<c:url value="/download" var="downloadUrl">
												<c:param name="fileName" value="${attach.uploadPath}/${attach.uuid}_${attach.fileName}" />
											</c:url>
										
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
																<a href="${downloadUrl}"><small>${attach.fileName}</small></a>
										                    </div>
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
										                        <a href="${downloadUrl}"><small>${attach.fileName}</small></a>
										                    </div>
										                </div>
										            </li>					
												
												</c:otherwise>
											</c:choose>
										</c:forEach>						            
							            
							        </ul>
							    </div>
							</div>
						</c:if>
						
						<button type="button" data-oper='modify' class="btn btn-primary">Modify</button>
						<button type="button" data-oper='list' class="btn btn-info">List</button>
						                     							
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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

<script>

$(document).ready(function() {	
	var csrfTokenValue = '${_csrf.token}';
    
	$("button[data-oper='modify']").on("click", function(e){
		e.preventDefault();
		
		var formData = {
				bno: $('input[name=bno]').val(), 
				pageNum: $('input[name=pageNum]').val(), 
				amount: $('input[name=amount]').val(), 
				searchTitle: $('input[name=searchTitle]').val(), 
				searchContent: $('input[name=searchContent]').val(), 
				searchWriter: $('input[name=searchWriter]').val()
			};
		
		gfn_callServer("POST", "/board/boardModify", true, formData, "application/x-www-form-urlencoded", "text", gfn_callMenuResult, 30000, csrfTokenValue);
    });
      
	$("button[data-oper='list']").on("click", function(e){
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
});

</script>