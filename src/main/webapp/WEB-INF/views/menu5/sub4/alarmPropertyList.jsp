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
							<select class="form-control js-example-placeholder-multiple col-sm-12" name="searchCategory">
							    <option value="">전체</option>
					        	<option value="L01" <c:if test="${searchCategory eq 'L01'}">selected</c:if>>심박</option>
					        	<option value="L02" <c:if test="${searchCategory eq 'L02'}">selected</c:if>>호흡</option>
					        	<option value="L03" <c:if test="${searchCategory eq 'L03'}">selected</c:if>>수면</option>	
							</select>	                        
	                    </div>
	                    <div class="col-sm-3">
							<select class="form-control js-example-placeholder-multiple col-sm-12" name="searchCategorySub">
							    <option value="">전체</option>
					        	<option value="M01" <c:if test="${searchCategorySub eq 'M01'}">selected</c:if>>서맥</option>
					        	<option value="M02" <c:if test="${searchCategorySub eq 'M02'}">selected</c:if>>과호흡</option>
					        	<option value="M03" <c:if test="${searchCategorySub eq 'M03'}">selected</c:if>>수면등급(A)</option>
							</select>
	                    </div>
	                    <div class="col-sm-3">
							<select class="form-control js-example-placeholder-multiple col-sm-12" name="searchAlarmType">
							    <option value="">전체</option>
					        	<option value="AT01" <c:if test="${searchAlarmType eq 'AT01'}">selected</c:if>>주의</option>
					        	<option value="AT02" <c:if test="${searchAlarmType eq 'AT02'}">selected</c:if>>관심</option>
					        	<option value="AT03" <c:if test="${searchAlarmType eq 'AT03'}">selected</c:if>>경고</option>
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
					<h5>알람속성 관리</h5>
				</div>
					
				<div class="card-body">
					<div class="row float-right">
						<div class="col-sm-12 input-group mb-3 w-25">
							<button type="button" id="regBtn" class="btn waves-effect waves-light btn-secondary btn-icon btn-msg-send">알람속성 등록</button>
						</div>
					</div>                     
					<div class="dt-responsive table-responsive">
						<table id="simpletable" class="table table-striped table-bordered nowrap">
							<thead>
								<tr>
									<th class="text-center">대분류</th>
									<th class="text-center">소분류</th>
									<th class="text-center">알람타입</th>
									<th class="text-center">FROM</th>
									<th class="text-center">TO</th>
									<th class="text-center">기준(분)</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${alarmPropertyList ne null && fn:length(alarmPropertyList) > 0}">
	
										<c:forEach items="${alarmPropertyList}" var="alarmProperty" varStatus="alarmPropertyStatus">
											<tr>
												<td class="text-center">
													<a class='move' href='<c:out value="${alarmProperty.category}"/>' data-sub02='<c:out value="${alarmProperty.categorySub}"/>' data-sub03='<c:out value="${alarmProperty.alarmType}"/>'>
														<c:out value="${alarmProperty.category}" />
													</a>
												</td>
												<td class="text-center"><c:out value="${alarmProperty.categorySub}" /></td>
												<td class="text-center"><c:out value="${alarmProperty.alarmType}" /></td>
												<td class="text-center"><c:out value="${alarmProperty.alarmFrom}" /></td>
												<td class="text-center"><c:out value="${alarmProperty.alarmTo}" /></td>
												<td class="text-center"><c:out value="${alarmProperty.basisMin}" /></td>
											</tr>
										</c:forEach>	
	
									</c:when>
									<c:otherwise>
										<tr>
											<td class="text-center" colspan="6">게시물이 없습니다</td>
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
	// 조회 버튼 선택
	$('#searchForm button').on('click', function(e) {
		e.preventDefault();
		
		$("input[name='pageNum']").val("1");
		
		var formData = {
				pageNum: $('input[name=pageNum]').val(), 
				amount: $('input[name=amount]').val(), 				
				searchCategory: $('select[name=searchCategory]').val(), 
				searchCategorySub: $('select[name=searchCategorySub]').val(), 
				searchAlarmType: $('select[name=searchAlarmType]').val()
			};
		
		gfn_callMenu('GET', '/menu5/sub4/alarmPropertyList', true, formData, 'text', gfn_callMenuResult, 30000);
	});
	
	// 등록 버튼 선택
	$('#regBtn').on('click', function(e) {
		e.preventDefault();
		
		gfn_callMenu('GET', '/menu5/sub4/alarmPropertyRegister', true, '', 'text', gfn_callMenuResult, 30000);
	});
	
	// 상세 내용 선택
	$('.move').on('click', function(e) {
		e.preventDefault();
		
		var formData = {
				category: $(this).attr('href'),
				categorySub: $(this).attr('data-sub02'),
				alarmType: $(this).attr('data-sub03'),
				pageNum: $('input[name=pageNum]').val(), 
				searchCategory: $('select[name=searchCategory]').val(), 
				searchCategorySub: $('select[name=searchCategorySub]').val(), 
				searchAlarmType: $('select[name=searchAlarmType]').val()
			};
		
		gfn_callServer('POST', '/menu5/sub4/alarmPropertyView', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
	});
	
	// 페이징 버튼 선택
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		var formData = {
				pageNum: $(this).attr("href"), 
				amount: $('input[name=amount]').val(), 
				searchCategory: $('select[name=searchCategory]').val(), 
				searchCategorySub: $('select[name=searchCategorySub]').val(), 
				searchAlarmType: $('select[name=searchAlarmType]').val()
			};
		
		gfn_callMenu("GET", "/menu5/sub4/alarmPropertyList", true, formData, "text", gfn_callMenuResult, 30000);
	});	
});
	
</script>
