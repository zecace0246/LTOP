<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="pcoded-content">
		
	<!-- [ Search Bar ] start -->
    <div class="card">
        <div class="card-block">
            <div class="seacrh-header">
	            <form id="searchForm">
	                <div class="form-group row">
	                    <div class="col-sm-1">
	                    </div>
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" placeholder="이름" name="searchUserName" value='<c:out value="${searchUserName}"/>'>
	                    </div>
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" placeholder="매트 ID" name="searchMatId" value='<c:out value="${searchMatId}"/>'>
	                    </div>
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" placeholder="사용유무" name="searchUseYn" value='<c:out value="${searchUseYn}"/>'>
	                    </div>
	                    <div class="col-sm-2" align="right">
	                        <button type="button" class="btn btn-primary"><i class="feather mr-2 icon-search"></i>검색</button>
	                    </div>
	                </div>
	                <div class="form-group row">                
	                    <div class="col-sm-1">
	                    </div>	                   
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" placeholder="그룹" name="searchGroup" value='<c:out value="${searchGroup}"/>'>
	                    </div>
	                    <div class="col-sm-3">                           
	                    </div>
	                    <div class="col-sm-2" align="right">
	                    </div>
	                </div>	                
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
					<h5>사용자 관리</h5>
				</div>
					
				<div class="card-body">
					<div class="row float-right">
						<div class="col-sm-12 input-group mb-3 w-25">
							<button type="button" id="regBtn" class="btn waves-effect waves-light btn-secondary btn-icon btn-msg-send">사용자 등록</button>
						</div>
					</div>                     
					<div class="dt-responsive table-responsive">
						<table id="simpletable" class="table table-striped table-bordered nowrap">
							<thead>
								<tr>
									<th class="text-center">사용자 ID</th>
									<th class="text-center">사용자 이름</th>
									<th class="text-center">전화번호</th>
									<th class="text-center">사용유무</th>
									<th class="text-center">매트 ID</th>
									<th class="text-center">그룹</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="user">
									<tr>
										<td class="text-center">
											<a class='move' href='<c:out value="${user.userId}"/>'>
												<c:out value="${user.userId}" />
											</a>
										</td>
										<td class="text-center"><c:out value="${user.userName}" /></td>
										<td class="text-center"><c:out value="${user.tel}" /></td>
										<td class="text-center">
											<c:if test="${user.useYn eq 'Y'}">
												사용
											</c:if>
											<c:if test="${user.useYn eq 'N'}">
												미사용
											</c:if>	
										</td>
										<td class="text-center"><c:out value="${user.matId}" /></td>
										<td class="text-center"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
		
		var formData = {
				searchUserName: $('input[name=searchUserName]').val(), 
				searchMatId: $('input[name=searchMatId]').val(), 
				searchUseYn: $('input[name=searchUseYn]').val(),
				searchGroup: $('input[name=searchGroup]').val()
			};
		
		gfn_callMenu('GET', '/menu3/sub1/userList', true, formData, 'text', gfn_callMenuResult, 30000);
	});
});
	
</script>
