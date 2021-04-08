<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">
	<!-- [ Search Bar ] start -->
    <div class="card">
        <div class="card-block">
            <div class="seacrh-header">
	            <form id="searchForm" action="/board/boardList" method="GET">
	                <div class="form-group row">
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" placeholder="Title" name="searchTitle" value='<c:out value="${pageMaker.cri.searchTitle}"/>'>
	                    </div>
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" placeholder="Content" name="searchContent" value='<c:out value="${pageMaker.cri.searchContent}"/>'>
	                    </div>
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" placeholder="Writer" name="searchWriter" value='<c:out value="${pageMaker.cri.searchWriter}"/>'>
	                    </div>
	                    <div class="col-sm-3" align="right">
	                        <button type="button" class="btn btn-primary"><i class="feather mr-2 icon-search"></i>Search</button>
	                    </div>
	                </div>
	                
	                <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
					<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
	            </form>
            </div>
        </div>
    </div>
	<!-- [ Search Bar ] end -->

	<!-- [ Main Content ] start -->
	<div class="row">
		<!-- [Table] start -->
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<h5>BOARD LIST</h5>
				</div>
				<div class="card-body">
					<div class="row float-right">
						<div class="col-sm-12 input-group mb-3 w-25">
							<button type="button" id="regBtn" class="btn waves-effect waves-light btn-secondary btn-icon btn-msg-send">Register</button>
						</div>
					</div> 
					<div class="dt-responsive table-responsive">                            
						<table id="simpletable" class="table table-striped table-bordered nowrap">
							<thead>
								<tr>
									<th style="text-align:center;">NO</th>
									<th style="text-align:center;">TITLE</th>
									<th style="text-align:center;">WRITER</th>
									<th style="text-align:center;">REGISTER DATE</th>
									<th style="text-align:center;">MODIFY DATE</th>
								</tr>
							</thead>
								<tbody>
								<c:forEach items="${list}" var="board">
									<tr>
										<td style="text-align:center;"><c:out value="${board.bno}" /></td>
										<td style="text-align:center;">
											<a class='move' href='<c:out value="${board.bno}"/>'>
												<c:out value="${board.title}" />
											</a>
										</td>
										<td style="text-align:center;"><c:out value="${board.writer}" /></td>
										<td style="text-align:center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
										<td style="text-align:center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row float-right">
						<div class="col-sm-12">
							<div class="dataTables_paginate paging_simple_numbers" id="dom-jqry_paginate">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="paginate_button page-item previous disabled" id="dom-jqry_previous">
											<a href="${pageMaker.startPage -1}" aria-controls="dom-jqry" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
										</li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active" : ""} ">
											<a href="${num}" aria-controls="dom-jqry" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next}">
										<li class="paginate_button page-item next" id="dom-jqry_next">
											<a href="#" aria-controls="dom-jqry" data-dt-idx="3" tabindex="0" class="page-link">Next</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- [Table] end -->
	</div>
	<!-- [ Main Content ] end -->
</div>	

<script type="text/javascript">

$(document).ready(function() {
	// 스프링 시큐리티 CSRF 토큰
	var csrfTokenValue = '${_csrf.token}';

	// 조회 버튼 선택
	$("#searchForm button").on("click", function(e) {
		e.preventDefault();
		
		$("input[name='pageNum']").val("1");
		
		var formData = {
				pageNum: $('input[name=pageNum]').val(), 
				amount: $('input[name=amount]').val(), 
				searchTitle: $('input[name=searchTitle]').val(), 
				searchContent: $('input[name=searchContent]').val(), 
				searchWriter: $('input[name=searchWriter]').val()
			};
		
		gfn_callMenu("GET", "/board/boardList", true, formData, "text", gfn_callMenuResult, 30000);
	});			
	
	// 등록 버튼 선택
	$("#regBtn").on("click", function(e) {
		e.preventDefault();
		
		gfn_callMenu("GET", "/board/boardRegister", true, "", "text", gfn_callMenuResult, 30000);
	});
	
	// 상세 내용 선택
	$(".move").on("click", function(e) {
		e.preventDefault();
		
		var formData = {
				bno: $(this).attr("href"), 
				pageNum: $('input[name=pageNum]').val(), 
				amount: $('input[name=amount]').val(), 
				searchTitle: $('input[name=searchTitle]').val(), 
				searchContent: $('input[name=searchContent]').val(), 
				searchWriter: $('input[name=searchWriter]').val()
			};
		
		gfn_callServer("POST", "/board/boardView", true, formData, "application/x-www-form-urlencoded", "text", gfn_callMenuResult, 30000, csrfTokenValue);
	});		
	
	// 페이징 버튼 선택
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		var formData = {
				pageNum: $(this).attr("href"), 
				amount: $('input[name=amount]').val(), 
				searchTitle: $('input[name=searchTitle]').val(), 
				searchContent: $('input[name=searchContent]').val(), 
				searchWriter: $('input[name=searchWriter]').val()
			};
		
		gfn_callMenu("GET", "/board/boardList", true, formData, "text", gfn_callMenuResult, 30000);
	});
});
		
</script>
