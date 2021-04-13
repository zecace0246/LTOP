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
	                        <input type="text" class="form-control" placeholder="매트 ID" id="searchMatId" name="searchMatId" value='<c:out value="${searchMatId}"/>'>
	                    </div>
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" placeholder="매트설명" id="searchMatDesc" name="searchMatDesc" value='<c:out value="${searchMatDesc}"/>'>
	                    </div>
	                    <div class="col-sm-3">
	                    </div>
	                    <div class="col-sm-3" align="right">

	                    </div>
	                </div>

	                <div class="form-group row">
	                    <div class="col-sm-3">
	                        <select class="form-control js-example-placeholder-multiple col-sm-12" id="searchAgency" name="searchAgency">
	                            <option value="">기관 전체</option>
	                            <c:forEach items="${comboAgnyList}" var="agencyCombo">
	                                <option value="${agencyCombo.agencyNo}"
	                                        <c:if test="${searchAgency==agencyCombo.agencyNo}">selected</c:if> >${agencyCombo.agencyName}</option>
	                            </c:forEach>
	                        </select>
                        </div>
                        <div class="col-sm-3">
                            <select class="form-control js-example-placeholder-multiple col-sm-12" id="searchUseYn" name="searchUseYn">
                                <option value="">사용유무</option>
                                <option value="Y" <c:if test="${searchUseYn=='Y'}">selected</c:if> >사용</option>
                                <option value="N" <c:if test="${searchUseYn=='N'}">selected</c:if> >미사용</option>
                            </select>

                        </div>
                        <div class="col-sm-3">
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
					<h5>매트 관리</h5>
				</div>

				<div class="card-body">
					<div class="row float-right">
						<div class="col-sm-12 input-group mb-3 w-25">
							<button type="button" id="regBtn" class="btn waves-effect waves-light btn-secondary btn-icon btn-msg-send">매트 등록</button>
						</div>
					</div>
					<div class="dt-responsive table-responsive">
						<table id="simpletable" class="table table-striped table-bordered nowrap">
							<thead>
								<tr>
									<th class="text-center">NO</th>
									<th class="text-center">매트 ID</th>
									<th class="text-center">설명</th>
									<th class="text-center">사용유무</th>
									<th class="text-center">기관</th>
									<th class="text-center">그룹</th>
									<th class="text-center">그룹관리자</th>
									<th class="text-center">등록일자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${matList ne null && fn:length(matList) > 0}">

										<c:set var="listStartNum" value="${pageMaker.total - (pageMaker.pageVO.amount * (pageMaker.pageVO.pageNum - 1)) + 1}" />

										<c:forEach items="${matList}" var="mat" varStatus="matStatus">
											<tr>
												<td class="text-center">
													<a class='move' href='<c:out value="${mat.matNo}"/>'>
														<c:out value="${listStartNum - matStatus.count}" />
													</a>
												</td>
												<td class="text-center"><c:out value="${mat.matId}" /></td>
												<td class="text-center"><c:out value="${mat.description}" /></td>
												<td class="text-center">
													<c:if test="${mat.useYn eq 'Y'}">
														사용
													</c:if>
													<c:if test="${mat.useYn ne 'Y'}">
														미사용
													</c:if>
												</td>
												<td class="text-center"><c:out value="${mat.agencyName}" /></td>
												<td class="text-center"><c:out value="${mat.groupName}" /></td>
												<td class="text-center"><c:out value="${mat.groupAdmName}" /></td>
												<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${mat.regDate}" /></td>
											</tr>
										</c:forEach>

									</c:when>
									<c:otherwise>
										<tr>
											<td class="text-center" colspan="8">게시물이 없습니다</td>
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
				searchMatId: $('input[name=searchMatId]').val(),
				searchMatDesc: $('input[name=searchMatDesc]').val(),
				searchAgency: $('select[name=searchAgency]').val(),
				searchUseYn: $('select[name=searchUseYn]').val()
			};

		console.log("검색 Parameter ::>>> " + JSON.stringify(formData) );

		gfn_callMenu('GET', '/menu5/sub2/matList', true, formData, 'text', gfn_callMenuResult, 30000);
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
