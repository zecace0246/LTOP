<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

	<div class="pcoded-content">

		<!-- [ Main Content ] start -->
		<div class="row">
			<!-- Zero config table start -->
			<div class="col-sm-12">
				<div class="card">
					<div class="card-header">
						<h5>MEMBER LIST</h5>
					</div>
					
                    <div class="card-body">
                        <div class="dt-responsive table-responsive">
                            <table id="simpletable" class="table table-striped table-bordered nowrap">
                                <thead>
                                    <tr>
										<th class="text-center">사용자 아이디</th>
										<th class="text-center">사용자 이름</th>
										<th class="text-center">승인유무</th>
										<th class="text-center">권한</th>
										<th class="text-center">등록일</th>
										<th class="text-center">수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
									<c:forEach items="${list}" var="member">
										<tr>
											<td class="text-center"><c:out value="${member.userId}" /></td>
											<td class="text-center"><c:out value="${member.userName}" /></td>
											<td class="text-center">
												<c:if test="${member.enabled eq '1'}">
													승인
												</c:if>
												<c:if test="${member.enabled ne '1'}">
													미승인
												</c:if>	
											</td>
											<td class="text-center">									
												<c:if test="${member.auth eq 'ROLE_ADMIN'}">
													최고관리자
												</c:if>
												<c:if test="${member.auth eq 'ROLE_MEMBER'}">
													관리자
												</c:if>
												<c:if test="${member.auth eq 'ROLE_USER'}">
													회원
												</c:if>	
											</td>
											<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}" /></td>
											<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${member.updateDate}" /></td>
										</tr>
									</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    
				</div>
			</div>
            <!-- Zero config table end -->
		</div>
		<!-- [ Main Content ] end -->
		
	</div>

<script type="text/javascript">

	$(document).ready(function() {				

	});
	
</script>
