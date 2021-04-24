<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="pcoded-content">
		
	<!-- [ Search Bar ] start -->
    <div class="card">
        <div class="card-block">
            <div class="seacrh-header">
	            <form id="searchForm">
	                <div class="form-group row">
	                    <div class="col-sm-3">
	                        <input type="date" class="form-control" placeholder="검색 시작일" id="searchDateFrom" name="searchDateFrom" value='<c:out value="${searchDateFrom}"/>'>
	                    </div>
	                    <div class="col-sm-3">
	                        <input type="date" class="form-control" placeholder="검색 종료일" id="searchDateTo" name="searchDateTo" value='<c:out value="${searchDateTo}"/>'>
	                    </div>
	                    <div class="col-sm-3">

                            <select class="form-control js-example-placeholder-multiple col-sm-12" id="searchType" name="searchType">
                                <option>선택</option>
                                <option value="10001">심박이상</option>
                                <option value="20001">호흡이상</option>
                                <option value="30001">낙상감지</option>
                            </select>
	                    </div>
	                    <div class="col-sm-3" align="right">
	                        <button type="button" class="btn btn-primary"><i class="feather mr-2 icon-search"></i>검색</button>
	                    </div>
	                </div>
	                
	                <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.pageVO.pageNum}"/>' /> 
					<input type='hidden' name='amount' value='<c:out value="${pageMaker.pageVO.amount}"/>' />	                
	            </form>
            </div>
        </div>
    </div>
	<!-- [ Search Bar ] end -->		
		
	<!-- [ Main Content ] start -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<h5>통계 목록</h5>
				</div>
					
				<div class="card-body">                     
					<div class="dt-responsive table-responsive">
						<table id="simpletable" class="table table-striped table-bordered nowrap">
							<thead>
	                            <tr>
	                            	<th><span>No.</span></th>
	                                <th><span>그룹 </span></th>
	                                <th><span>그룹상세 </span></th>
	                                <th><span>사용자명 </span></th>
	                                <th><span>심박 </span></th>
	                                <th><span>호흡</span></th>
	                                <th><span>수면</span></th>
	                                <th><span>낙상상태</span></th>
	                                <th><span>자세 </span></th>
	                            </tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${userList ne null && fn:length(userList) > 0}">
									<c:set var="listStartNum" value="${pageMaker.total - (pageMaker.pageVO.amount * (pageMaker.pageVO.pageNum - 1)) + 1}" />
										<c:forEach items="${userList}" var="user" varStatus="userStatus">
	                                           <tr>
	                                           	   <td><c:out value="${listStartNum - userStatus.count}" /></td>
	                                               <td><c:out value="${user.agencyName}" /></td>
	                                               <td><c:out value="${user.groupName}" /></td>
	                                               <td><c:out value="${user.userName}" /></td>
	                                               <td><c:out value="${user.respirationRate}" />
	                                                   <div class="progress mt-1" style="height:4px;">
	                                                       <div class="progress-bar bg-info rounded" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
	                                                   </div>
	                                               </td>
	                                               <td><c:out value="${user.heartRate}" />
	                                                   <div class="progress mt-1" style="height:4px;">
	                                                       <div class="progress-bar bg-info rounded" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
	                                                   </div>
	                                               </td>
	                                               <td><c:out value="${user.sleepMode}" />
	                                                   <div class="progress mt-1" style="height:4px;">
	                                                       <div class="progress-bar bg-info rounded" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
	                                                   </div>
	                                               </td>
	                                               <td><c:out value="${user.fallAlarm}" /></td>
	                                               <td></td>
	                                           </tr>
										</c:forEach>	
	
									</c:when>
									<c:otherwise>
										<tr>
											<td class="text-center" colspan="9">사용자가 없습니다</td>
										</tr>						
									</c:otherwise>
								</c:choose>
																
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
										<li class="paginate_button page-item ${pageMaker.pageVO.pageNum == num ? 'active' : ''} ">
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
	</div>
	<!-- [ Main Content ] end -->
		
</div>

<script type="text/javascript">

$(document).ready(function() {
	// 스프링 시큐리티 CSRF 토큰
	var csrfTokenValue = '${_csrf.token}';

	// 조회 버튼 선택
	$('#searchForm button').on('click', function(e) {
		e.preventDefault();
		
		$("input[name='pageNum']").val("1");
		
		var formData = {
				pageNum: $('input[name=pageNum]').val(), 
				amount: $('input[name=amount]').val(), 				
				searchDateFrom: $('input[name=searchDateFrom]').val(),
				searchDateTo: $('input[name=searchDateTo]').val(),
				searchType: $('input[name=searchType]').val()
			};

		gfn_callMenu('GET', '/user', true, formData, 'text', gfn_callMenuResult, 30000);
	});
	
	// 등록 버튼 선택
	$('#regBtn').on('click', function(e) {
		e.preventDefault();
		
		gfn_callMenu('GET', '/menu5/sub2/matRegister', true, '', 'text', gfn_callMenuResult, 30000);
	});
	
	// 상세 내용 선택
	$('.move').on('click', function(e) {
		e.preventDefault();
		
		var formData = {
				matNo: $(this).attr('href'),
				pageNum: $('input[name=pageNum]').val(), 
				amount: $('input[name=amount]').val(), 
				searchMatId: $('input[name=searchMatId]').val(), 
				searchUseYn: $('input[name=searchUseYn]').val()
			};
		
		gfn_callServer('POST', '/menu5/sub2/matView', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
	});
	
	// 페이징 버튼 선택
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		var formData = {
				pageNum: $(this).attr("href"), 
				amount: $('input[name=amount]').val(), 
				searchMatId: $('input[name=searchMatId]').val(), 
				searchUseYn: $('input[name=searchUseYn]').val()
			};
		
		gfn_callMenu("GET", "/menu5/sub2/matList", true, formData, "text", gfn_callMenuResult, 30000);
	});	
});
	
</script>
