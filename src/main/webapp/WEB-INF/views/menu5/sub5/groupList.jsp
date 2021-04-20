<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="pcoded-content">

  <!-- [ Search Bar ] start -->
    <div class="card">
        <div class="card-block">
            <div class="seacrh-header">
              <form id="searchForm">
                  <div class="form-group row">
                      <div class="col-sm-3">
                          <input type="text" class="form-control" placeholder="기관명" name="searchAgencyName" value='<c:out value="${searchAgencyName}"/>'>
                      </div>
                      <div class="col-sm-3">
                          <input type="text" class="form-control" placeholder="그룹명" name="searchGroupName" value='<c:out value="${searchGroupName}"/>'>
                      </div>
                      <div class="col-sm-3">
                          <input type="text" class="form-control" placeholder="그룹관리자명" name="searchAdmName" value='<c:out value="${searchAdmName}"/>'>
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
          <h5>그룹 관리</h5>
        </div>

        <div class="card-body">
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          <div class="row float-right">
            <div class="col-sm-12 input-group mb-3 w-25">
              <button type="button" id="regBtn" class="btn waves-effect waves-light btn-secondary btn-icon btn-msg-send">그룹 등록</button>
            </div>
          </div>
          </sec:authorize>
          <div class="dt-responsive table-responsive">
            <table id="simpletable" class="table table-striped table-bordered nowrap">
              <thead>
                <tr>
                  <th class="text-center">No.</th>
                  <th class="text-center">기관명</th>
                  <th class="text-center">그룹명</th>
                  <th class="text-center">그룹관리자</th>
                  <th class="text-center">등록된 매트수</th>
                  <th class="text-center">등록된 사용자수</th>
                  <th class="text-center">사용유무</th>
                  <th class="text-center">등록일자</th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                  <c:when test="${groupList ne null && fn:length(groupList) > 0}">

                    <c:set var="listStartNum" value="${pageMaker.total - (pageMaker.pageVO.amount * (pageMaker.pageVO.pageNum - 1)) +1}" />

                    <c:forEach items="${groupList}" var="group" varStatus="groupStatus">
                      <tr>
                        <td class="text-center"><c:out value="${listStartNum - groupStatus.count}" /></td>
                        <td class="text-center"><c:out value="${group.agencyName}" /></a>
                        </td>
                        <td class="text-center">
                          <a class='move' href='<c:out value="${group.groupSeq}"/>'>
                            <c:out value="${group.groupName}" />
                          </a>
                        </td>
                        <td class="text-center"><c:out value="${group.groupAdmName}" /></td>
                        <td class="text-center"><c:out value="${group.agencyMatCnt}" /></td>
                        <td class="text-center"><c:out value="${group.agencyUserCnt}" /></td>
                        <td class="text-center">
                          <c:if test="${group.useYn eq 'Y'}">
                            사용
                          </c:if>
                          <c:if test="${group.useYn eq 'N'}">
                            미사용
                          </c:if>
                        </td>
                        <td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${group.regDate}" /></td>
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
        searchAgencyName: $('input[name=searchAgencyName]').val(),
        searchGroupName: $('input[name=searchGroupName]').val(),
        searchAdmName: $('input[name=searchAdmName]').val()
      };

    gfn_callMenu('GET', '/menu5/sub5/groupList', true, formData, 'text', gfn_callMenuResult, 30000);
  });

  // 등록 버튼 선택
  $('#regBtn').on('click', function(e) {
    e.preventDefault();

    gfn_callMenu('GET', '/menu5/sub5/groupRegister', true, '', 'text', gfn_callMenuResult, 30000);
  });

  // 상세 내용 선택
  $('.move').on('click', function(e) {
    e.preventDefault();

    var formData = {
    	groupSeq: $(this).attr('href'),
        pageNum: $('input[name=pageNum]').val(),
        amount: $('input[name=amount]').val(),
        searchAgencyName: $('input[name=searchAgencyName]').val(),
        searchGroupName: $('input[name=searchGroupName]').val(),
        searchAdmName: $('input[name=searchAdmName]').val()
      };

    gfn_callServer('POST', '/menu5/sub5/groupView', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
  });

  // 페이징 버튼 선택
  $(".paginate_button a").on("click", function(e) {
    e.preventDefault();

    var formData = {
        pageNum: $(this).attr("href"),
        amount: $('input[name=amount]').val(),
        searchAgencyName: $('input[name=searchAgencyName]').val(),
        searchGroupName: $('input[name=searchGroupName]').val(),
        searchAdmName: $('input[name=searchAdmName]').val()
      };

    gfn_callMenu("GET", "/menu5/sub5/groupList", true, formData, "text", gfn_callMenuResult, 30000);
  });
});

</script>
