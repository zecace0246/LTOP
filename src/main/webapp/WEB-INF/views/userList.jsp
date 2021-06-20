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
	                    <!-- div class="col-sm-3">
	                        <input type="date" class="form-control" placeholder="검색 시작일" id="searchDateFrom" name="searchDateFrom" value='<c:out value="${searchDateFrom}"/>'>
	                    </div>
	                    <div class="col-sm-3">
	                        <input type="date" class="form-control" placeholder="검색 종료일" id="searchDateTo" name="searchDateTo" value='<c:out value="${searchDateTo}"/>'>
	                    </div-->

	                    <div class="col-sm-2">
                                    <select class="form-control js-example-placeholder-multiple " id="agencyNo" name="agencyNo" onChange="">
                                        <option value="">기관전체</option>
                                    <c:forEach items="${comboAgnyList}" var="agencyCombo">
                                        <option value="${agencyCombo.agencyNo}" 
                                        	<c:if test="${agencyNo==agencyCombo.agencyNo}">selected</c:if> >${agencyCombo.agencyName}</option>
                                    </c:forEach>
                                    </select>
	                    </div>
	                    <div class="col-sm-2">
                                    <select class="form-control js-example-placeholder-multiple " id="groupSeq" name="groupSeq" required>
                                        <option value="">그룹</option>
                                        <!-- <c:forEach items="${comboAgCyGrpList}" var="grpCombo">
                                            <option value="${grpCombo.groupSeq}" >${grpCombo.groupName}</option>
                                        </c:forEach>-->
                                    </select>
	                    </div>
                      <div class="col-sm-2">
                          <input type="text" class="form-control" placeholder="사용자 이름" id="searchUserName" name="searchUserName" value='<c:out value="${searchUserName}"/>'>
                      </div>
	                    <div class="col-sm-2" align="right">
	                        <button type="button" class="btn btn-primary"><i class="feather mr-2 icon-search"></i>검색</button>
	                    </div>
	                </div>
	                
	                <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.pageVO.pageNum}"/>' /> 
					<input type='hidden' name='amount' value='<c:out value="${pageMaker.pageVO.amount}"/>' />	
					<input type='hidden' name='userId' value='<c:out value="${userId}"/>' />                
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
					<h5>사용자 목록</h5>
				</div>
					
				<div class="card-body">                     
					<div class="dt-responsive table-responsive">
						<table id="simpletable" class="table table-striped table-bordered nowrap">
							<thead>
	                            <tr>
	                            	<!-- th><span>No.</span></th -->
	                                <th><span>기관 </span></th>
	                                <th><span>그룹 </span></th>
	                                <th><span>사용자명 </span></th>
	                                <th><span>심박 </span></th>
	                                <th><span>호흡</span></th>
	                                <!-- th><span>수면</span></th -->
	                                <th><span>낙상상태</span></th>
	                                <th><span>자세 </span></th>
	                                <th><span>사용시작일 </span></th>
	                            </tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${userList ne null && fn:length(userList) > 0}">
									<c:set var="listStartNum" value="${pageMaker.total - (pageMaker.pageVO.amount * (pageMaker.pageVO.pageNum - 1)) + 1}" />
										<c:forEach items="${userList}" var="user" varStatus="userStatus">
	                                           <tr>
	                                           	   <!-- td><c:out value="${listStartNum - userStatus.count}" /></td -->
	                                               <td><c:out value="${user.agencyName}" /></td>
	                                               <td><c:out value="${user.groupName}" /></td>
	                                               <td>
                          								<a class='move' href='<c:out value="${user.userId}"/>'>
	                                               			<c:out value="${user.userName}" />
	                                               		</a>
	                                               	</td>
	                                               <td><c:out value="${user.respirationRate}" />
	                                                   <!-- div class="progress mt-1" style="height:4px;">
	                                                       <div class="progress-bar bg-info rounded" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
	                                                   </div-->
	                                               </td>
	                                               <td><c:out value="${user.heartRate}" />
	                                                   <!-- div class="progress mt-1" style="height:4px;">
	                                                       <div class="progress-bar bg-info rounded" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
	                                                   </div-->
	                                               </td>
	                                               <!--td><c:out value="${user.sleepMode}" />
	                                                    <div class="progress mt-1" style="height:4px;">
	                                                       <div class="progress-bar bg-info rounded" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
	                                                   </div>
	                                               </td-->
	                                               <td><c:out value="${user.fallAlarm}" /></td>
	                                               <td><c:out value="${user.positionYn}" /></td>
	                                               <td><c:out value="${user.regDate}" /></td>
	                                           </tr>
										</c:forEach>	
	
									</c:when>
									<c:otherwise>
										<tr>
											<td class="text-center" colspan="10">사용자가 없습니다</td>
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
					  					
					<div class="dt-responsive table-responsive">
                        <div class="card-header-left">
                        	<h5><c:out value="${user.userName}"/> 
                        	<select class="form-control js-example-placeholder-multiple col-sm-12" id="searchType" name="searchType"  onChange="">
                                <option value="HOUR" <c:if test="${searchType=='HOUR'}">selected</c:if> >시간</option>
                                <option value="DAY" <c:if test="${searchType=='DAY'}">selected</c:if> >날짜</option>
                            </select>
							</h5>
                        </div>
       					<div class="row">
                                            <!-- Power card Start -->
                                            <!-- div class="col-md-6 col-xl-4">
                                                <div class="card">
                                                    <div class="card-header p-t-20">
                                                        <div class="card-header-left">
                                                            <h5>심박</h5>
                                                        </div>
                                                        <div class="card-header-right">
                                                            <i class="icofont icofont-spinner-alt-5 "></i>
                                                        </div>
                                                    </div>
                                                    <div class="card-block-big card-power">
                                                        <span class="text-muted">현재</span><h2><c:out value="${user.respirationRate}"/></h2>
                                                        <canvas id="power-card-chart1" height='75'></canvas>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.respirationRateMax}"/></h6>
                                                                    <p class="text-muted m-0">최고</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.respirationRateMin}"/></h6>
                                                                    <p class="text-muted m-0">최소</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card">
                                                    <div class="card-header p-t-20">
                                                        <div class="card-header-left">
                                                            <h5>호흡</h5>
                                                        </div>
                                                        <div class="card-header-right">
                                                            <i class="icofont icofont-spinner-alt-5 "></i>
                                                        </div>
                                                    </div>
                                                    <div class="card-block-big card-power">
                                                        <span class="text-muted">현재</span><h2><c:out value="${user.heartRate}"/></h2>
                                                        <canvas id="power-card-chart2" height='75'></canvas>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.heartRateMax}"/></h6>
                                                                    <p class="text-muted m-0">최대</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.heartRateMin}"/></h6>
                                                                    <p class="text-muted m-0">최소</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-xl-4">
                                                <div class="card">
                                                    <div class="card-header p-t-20">
                                                        <div class="card-header-left">
                                                            <h5>수면</h5>
                                                        </div>
                                                        <div class="card-header-right">
                                                            <i class="icofont icofont-spinner-alt-5 "></i>
                                                        </div>
                                                    </div>
                                                    <div class="card-block-big card-power">
                                                        <span class="text-muted">현재</span><h2><c:out value="${user.sleepMode}"/></h2>
                                                        <canvas id="power-card-chart3" height='75'></canvas>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.sleepModeMax}"/></h6>
                                                                    <p class="text-muted m-0">최대</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.sleepModeMax}"/></h6>
                                                                    <p class="text-muted m-0">최소</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div -->
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h5>심박</h5>
                    </div>
                    <div class="card-body">
                    	<span class="text-muted">현재</span><h2><c:out value="${user.respirationRate}"/></h2>
                        <div id="account-chart1"></div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.respirationRateMax}"/></h6>
                                                                    <p class="text-muted m-0">최고</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.respirationRateMin}"/></h6>
                                                                    <p class="text-muted m-0">최소</p>
                                                                </div>
                                                            </div>
                                                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h5>호흡</h5>
                    </div>
                    <div class="card-body">
                    <span class="text-muted">현재</span><h2><c:out value="${user.heartRate}"/></h2>
                        <div id="account-chart2"></div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.heartRateMax}"/></h6>
                                                                    <p class="text-muted m-0">최대</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.heartRateMin}"/></h6>
                                                                    <p class="text-muted m-0">최소</p>
                                                                </div>
                                                            </div>
                                                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <!-- div class="card">
                    <div class="card-header">
                        <h5>수면</h5>
                    </div>
                    <div class="card-body">
                    <span class="text-muted">현재</span><h2><c:out value="${user.sleepMode}"/></h2>
                        <div id="account-chart3"></div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.sleepModeMax}"/></h6>
                                                                    <p class="text-muted m-0">최대</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="map-area">
                                                                    <h6 class="m-0"><c:out value="${user.sleepModeMax}"/></h6>
                                                                    <p class="text-muted m-0">최소</p>
                                                                </div>
                                                            </div>
                                                        </div>
                    </div>
                </div-->
                                <div class="row">
                                    <div class="col-auto">
                                        <span>수면</span>
                                    </div>
                                    <div class="col text-right">
                                        <h2 class="mb-0"><c:out value="${userSleep.sleepGrade}" /></h2>
                                    </div>
                                </div>
                                <div id="customer-chart"></div>
                                <div class="row mt-3">
                                    <div class="col">
                                        <h3 class="m-0"><i class="fas fa-circle f-10 m-r-5 text-success"></i><c:out value="${userSleep.sleepCnt1}" /></h3>
                                        <span class="ml-3">REM</span>
                                    </div>
                                    <div class="col">
                                        <h3 class="m-0"><i class="fas fa-circle text-primary f-10 m-r-5"></i><c:out value="${userSleep.sleepCnt2}" /></h3>
                                        <span class="ml-3">NREM</span>
                                    </div>
                                    <div class="col">
                                        <h3 class="m-0"><i class="fas fa-circle f-10 m-r-5 text-success"></i><c:out value="${userSleep.sleepCnt3}" /></h3>
                                        <span class="ml-3">AWAKE</span>
                                    </div>
                                    <div class="col">
                                        <h3 class="m-0"><i class="fas fa-circle text-primary f-10 m-r-5"></i><c:out value="${userSleep.sleepCnt4}" /></h3>
                                        <span class="ml-3">MOVEMENT</span>
                                    </div>
                                </div>
            </div>
                                            <!-- Power card End -->
                                            <div class="col-md-12 col-xl-4">
                                                <div class="card widget-statstic-card borderless-card">
                                                    <div class="card-header">
                                                        <div class="card-header-left">
                                                            <h5>자세유지</h5>
                                                            <p class="p-t-10 m-b-0 text-muted">설정시간 : <c:out value="${user.positionTime}"/> 시간</p>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <i class="fa fa-calendar st-icon bg-primary"></i>
                                                        <div class="text-left">
                                                            <h3 class="d-inline-block"><c:out value="${user.positionCurrent}"/></h3>
                                                            <i class="fa fa-long-arrow-up f-24 text-success m-l-15"></i>
                                                            <button data-oper='position1' class="btn btn-primary btn-sm btn-round">자세변경(바로누운자세)</button>
                                                            <button data-oper='position2' class="btn btn-primary btn-sm btn-round">자세변경(업드린자세)</button>
                                                            <button data-oper='position3' class="btn btn-primary btn-sm btn-round">자세변경(오른쪽자세)</button>
                                                            <button data-oper='position4' class="btn btn-primary btn-sm btn-round">자세변경(왼쪽자세)</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

				</div>
					<div class="dt-responsive table-responsive">
						<table id="simpletable" class="table table-striped table-bordered nowrap">
							<thead>
	                            <tr>
	                            	<!-- th><span>No.</span></th -->
	                                <th><span>알람일시</span></th>
	                                <!-- th><span>그룹 </span></th>
	                                <th><span>그룹상세 </span></th>
	                                <th><span>사용자명 </span></th -->
	                                <th><span>알랍 </span></th>
	                                <th><span>측정값</span></th>
	                                <th><span>확인유무</span></th>
	                                <!-- th><span>확인시간 </span></th>
	                                <th><span>확인자</span></th -->
	                            </tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${userAlarm ne null && fn:length(userAlarm) > 0}">
										<c:forEach items="${userAlarm}" var="alarm" varStatus="alarmStatus">
	                                           <tr>
	                                           	   <!-- td><c:out value="${alarm.alarmNo}" /></td -->
	                                               <td><c:out value="${alarm.regDate}" /></td>
	                                               <!-- td><c:out value="${alarm.agencyName}" /></td>
	                                               <td><c:out value="${alarm.groupName}" /></td>
	                                               <td><c:out value="${alarm.userName}" /></td -->
	                                               <td><c:out value="${alarm.eventNm}" /></td>
	                                               <td><c:out value="${alarm.value}" />
	                                                   <!-- div class="progress mt-1" style="height:4px;">
	                                                       <div class="progress-bar bg-info rounded" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
	                                                   </div-->
	                                               </td>
	                                               <td>
	                                               	<c:if test="${alarm.confirmYn eq 'Y'}">
	                                               		<c:out value="${alarm.confirmYn}" />
	                                               	</c:if>
	                                               	<c:if test="${alarm.confirmYn ne 'Y'}">
	                                               		<c:if test="${alarm.eventNum eq '30001'}">
	                                               			<button data-oper='alarm0' id="<c:out value="${alarm.alarmNo}"  />"  class="btn btn-primary btn-sm btn-round">감지오류</button>
	                                               			<button data-oper='alarm1' id="<c:out value="${alarm.alarmNo}"  />"  class="btn btn-primary btn-sm btn-round">낙상확인</button>
	                                               		</c:if>
	                                               		<c:if test="${alarm.eventNum ne '30001'}">
	                                               			<button data-oper='alarm' id="<c:out value="${alarm.alarmNo}" />" class="btn btn-primary btn-sm btn-round">처리</button>
	                                               		</c:if>
	                                               	</c:if>
	                                               	</td>
	                                               <!-- td><c:out value="${alarm.confirmDate}" /></td>
	                                               <td><c:out value="${alarm.confirmId}" /></td -->
	                                           </tr>
										</c:forEach>	
	
									</c:when>
									<c:otherwise>
										<tr>
											<td class="text-center" colspan="10">알림이 없습니다</td>
										</tr>						
									</c:otherwise>
								</c:choose>
																
							</tbody>
						</table>
					</div>
					</div>
					
				</div>  
			</div>
		</div>
	</div>
	<!-- [ Main Content ] end -->
		
</div>
<script src="/resources/assets/js/plugins/sweetalert.min.js"></script>
<script src="/resources/assets/js/pages/ac-alert.js"></script>
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
				agencyNo: $('select[name=agencyNo]').val(),
				groupSeq: $('select[name=groupSeq]').val(),
				searchUserName: $('input[name=searchUserName]').val(),
				searchType: $('select[name=searchType]').val(),
				searchUserId: $('input[name=userId]').val()
			};

		gfn_callMenu('GET', '/user', true, formData, 'text', gfn_callMenuResult, 30000);
	});
	
	
	// 상세 내용 선택
	$('.move').on('click', function(e) {
	    e.preventDefault();

	    var formData = {
	        searchUserId: $(this).attr('href'),
	        searchUserName: $('input[name=searchUserName]').val(),
	        searchMatId: $('input[name=searchMatId]').val(),
	        searchEnabled: $('select[name=searchEnabled]').val(),
	        searchAgency: $('select[name=searchAgency]').val(),
	        searchType: $('select[name=searchType]').val()
	      };

	    //gfn_callServer('POST', '/user/userDetail', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
	    gfn_callServer('GET', '/user', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
	});
	
	  $('#searchType').change(function(e){
			e.preventDefault();
			
			$("input[name='pageNum']").val("1");
			
			var formData = {
					pageNum: $('input[name=pageNum]').val(), 
					amount: $('input[name=amount]').val(), 				
					searchDateFrom: $('input[name=searchDateFrom]').val(),
					agencyNo: $('select[name=agencyNo]').val(),
					groupSeq: $('select[name=groupSeq]').val(),
					searchUserName: $('input[name=searchUserName]').val(),
					searchType: $('select[name=searchType]').val(),
					searchUserId: $('input[name=userId]').val()
				};

			gfn_callMenu('GET', '/user', true, formData, 'text', gfn_callMenuResult, 30000);
	    });
	  
	// 페이징 버튼 선택
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		var formData = {
				pageNum: $(this).attr("href"), 
				amount: $('input[name=amount]').val(), 
				searchDateFrom: $('input[name=searchDateFrom]').val(),
				agencyNo: $('select[name=agencyNo]').val(),
				groupSeq: $('select[name=groupSeq]').val(),
				searchUserName: $('input[name=searchUserName]').val(),
				searchUserId: $('input[name=userId]').val()
			};
		
		gfn_callMenu("GET", "/user", true, formData, "text", gfn_callMenuResult, 30000);
	});	
	
  $('#agencyNo').change(function(e){
        var $target = $('select[name=groupSeq]');
        var selectType=$(this).val();

        $.ajax({
            type : "GET",
            url : "/selectAgencyGroupCombo",
            async : false,
            data : { agencyNo : selectType },
            dataType : "json",
            success : function(result){
                        console.log(JSON.stringify(result));

                        $target.html("");

                        if( result.length > 0 ){
                            $(result).each(function(i){
                          $target.append("<option value="+result[i].groupSeq+">"+result[i].groupName+"</option>");
                            });
                        }

                        $target.focus();
                },
            error: function(xhr){
                return;
                }
            });
    });
  
  setTimeout(function() {
      floatchart1()
  }, 700);
  
  function floatchart1() {
	    // [ account-chart ] start
	    $(function() {
	        $(function() {
	            var options = {
	                chart: {
	                    height: 250,
	                    type: 'line',
	                    stacked: false,
	                },
	                stroke: {
	                    width: [0, 5],
	                    curve: 'smooth'
	                },
	                plotOptions: {
	                    bar: {
	                        columnWidth: '50%'
	                    }
	                },
	                colors: ['#4099ff', '#2ed8b6'],
	                series: [{
	                    name: '',
	                    type: 'column',
	                    data: [
	                        <c:choose>
	        				<c:when test="${userBcg ne null && fn:length(userBcg) > 0}">
	        					<c:set var="listStartNum" value="0"></c:set>
	        					
	        					<c:forEach items="${userBcg}" var="bcg" varStatus="bcgStatus">
	        						<c:if test="${listStartNum eq 0}">
	        							<c:out value="${bcg.respirationRate}" />
	        						</c:if>
	        						<c:if test="${listStartNum ne 0}">
	        						,	<c:out value="${bcg.respirationRate}" />
	        						</c:if>
	        						
	        						<c:set var="listStartNum" value="${listStartNum+1}" />
	        					</c:forEach>
	        				</c:when>
	        			</c:choose>
	                    	//23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30
	                    	] 
	                }, {
	                    name: '',
	                    type: 'line',
	                    data: [
	                        <c:choose>
	        				<c:when test="${userBcg ne null && fn:length(userBcg) > 0}">
	        					<c:set var="listStartNum" value="0"></c:set>
	        					
	        					<c:forEach items="${userBcg}" var="bcg" varStatus="bcgStatus">
	        						<c:if test="${listStartNum eq 0}">
	        							<c:out value="${bcg.respirationRate}" />
	        						</c:if>
	        						<c:if test="${listStartNum ne 0}">
	        						,	<c:out value="${bcg.respirationRate}" />
	        						</c:if>
	        						
	        						<c:set var="listStartNum" value="${listStartNum+1}" />
	        					</c:forEach>
	        				</c:when>
	        			</c:choose>
	                    	//23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30
	                    	]
	                }],
	                fill: {
	                    opacity: [0.85, 1],
	                },
	                labels: [
	                    <c:choose>
	      				<c:when test="${userBcg ne null && fn:length(userBcg) > 0}">
	      					<c:set var="listStartNum" value="0"></c:set>
	      					
	      					<c:forEach items="${userBcg}" var="bcg" varStatus="bcgStatus">
	      						<c:if test="${listStartNum eq 0}">
	      							'<c:out value="${bcg.regDate}" />'
	      						</c:if>
	      						<c:if test="${listStartNum ne 0}">
	      						,	'<c:out value="${bcg.regDate}" />'
	      						</c:if>
	      						
	      						<c:set var="listStartNum" value="${listStartNum+1}" />
	      					</c:forEach>
	      				</c:when>
	      			</c:choose>
	                	],
	                markers: {
	                    size: 0
	                },
	                xaxis: {
	                    type: 'time'
	                },
	                yaxis: {
	                    min: 0
	                },
	                tooltip: {
	                    shared: true,
	                    intersect: false,
	                    y: {
	                        formatter: function(y) {
	                            if (typeof y !== "undefined") {
	                                return y.toFixed(0) + " views";
	                            }
	                            return y;

	                        }
	                    }
	                },
	                legend: {
	                    labels: {
	                        useSeriesColors: true
	                    },
	                    markers: {
	                        customHTML: [
	                            function() {
	                                return ''
	                            },
	                            function() {
	                                return ''
	                            }
	                        ]
	                    }
	                }
	            }
	            var chart = new ApexCharts(
	                document.querySelector("#account-chart1"),
	                options
	            );
	            chart.render();
	        });
	    });
	    $(function() {
	        $(function() {
	            var options = {
	                chart: {
	                    height: 250,
	                    type: 'line',
	                    stacked: false,
	                },
	                stroke: {
	                    width: [0, 5],
	                    curve: 'smooth'
	                },
	                plotOptions: {
	                    bar: {
	                        columnWidth: '50%'
	                    }
	                },
	                colors: ['#4099ff', '#2ed8b6'],
	                series: [{
	                    name: '',
	                    type: 'column',
	                    data: [
	                        <c:choose>
	        				<c:when test="${userBcg ne null && fn:length(userBcg) > 0}">
	        					<c:set var="listStartNum" value="0"></c:set>
	        					
	        					<c:forEach items="${userBcg}" var="bcg" varStatus="bcgStatus">
	        						<c:if test="${listStartNum eq 0}">
	        							<c:out value="${bcg.heartRate}" />
	        						</c:if>
	        						<c:if test="${listStartNum ne 0}">
	        						,	<c:out value="${bcg.heartRate}" />
	        						</c:if>
	        						
	        						<c:set var="listStartNum" value="${listStartNum+1}" />
	        					</c:forEach>
	        				</c:when>
	        			</c:choose>
	                    	//23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30
	                    	]
	                }, {
	                    name: '',
	                    type: 'line',
	                    data: [
	                        <c:choose>
	        				<c:when test="${userBcg ne null && fn:length(userBcg) > 0}">
	        					<c:set var="listStartNum" value="0"></c:set>
	        					
	        					<c:forEach items="${userBcg}" var="bcg" varStatus="bcgStatus">
	        						<c:if test="${listStartNum eq 0}">
	        							<c:out value="${bcg.heartRate}" />
	        						</c:if>
	        						<c:if test="${listStartNum ne 0}">
	        						,	<c:out value="${bcg.heartRate}" />
	        						</c:if>
	        						
	        						<c:set var="listStartNum" value="${listStartNum+1}" />
	        					</c:forEach>
	        				</c:when>
	        			</c:choose>
	                    	//23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30
	                    	]
	                }],
	                fill: {
	                    opacity: [0.85, 1],
	                },
	                labels: [
	                    <c:choose>
	      				<c:when test="${userBcg ne null && fn:length(userBcg) > 0}">
	      					<c:set var="listStartNum" value="0"></c:set>
	      					
	      					<c:forEach items="${userBcg}" var="bcg" varStatus="bcgStatus">
	      						<c:if test="${listStartNum eq 0}">
	      							'<c:out value="${bcg.regDate}" />'
	      						</c:if>
	      						<c:if test="${listStartNum ne 0}">
	      						,	'<c:out value="${bcg.regDate}" />'
	      						</c:if>
	      						
	      						<c:set var="listStartNum" value="${listStartNum+1}" />
	      					</c:forEach>
	      				</c:when> 
	      			</c:choose>
	                	],
	                markers: {
	                    size: 0
	                },
	                xaxis: {
	                    type: 'time'
	                },
	                yaxis: {
	                    min: 0
	                },
	                tooltip: {
	                    shared: true,
	                    intersect: false,
	                    y: {
	                        formatter: function(y) {
	                            if (typeof y !== "undefined") {
	                                return y.toFixed(0) + " views";
	                            }
	                            return y;

	                        }
	                    }
	                },
	                legend: {
	                    labels: {
	                        useSeriesColors: true
	                    },
	                    markers: {
	                        customHTML: [
	                            function() {
	                                return ''
	                            },
	                            function() {
	                                return ''
	                            }
	                        ]
	                    }
	                }
	            }
	            var chart = new ApexCharts(
	                document.querySelector("#account-chart2"),
	                options
	            );
	            chart.render();
	        });
	    });
	    $(function() {
	        $(function() {
	            var options = {
	                chart: {
	                    height: 250,
	                    type: 'line',
	                    stacked: false,
	                },
	                stroke: {
	                    width: [0, 5],
	                    curve: 'smooth'
	                },
	                plotOptions: {
	                    bar: {
	                        columnWidth: '50%'
	                    }
	                },
	                colors: ['#4099ff', '#2ed8b6'],
	                series: [{
	                    name: '',
	                    type: 'column', 
	                    data: [
	                        <c:choose>
	        				<c:when test="${userBcg ne null && fn:length(userBcg) > 0}">
	        					<c:set var="listStartNum" value="0"></c:set>
	        					
	        					<c:forEach items="${userBcg}" var="bcg" varStatus="bcgStatus">
	        						<c:if test="${listStartNum eq 0}">
	        							<c:out value="${bcg.sleepMode}" />
	        						</c:if>
	        						<c:if test="${listStartNum ne 0}">
	        						,	<c:out value="${bcg.sleepMode}" />
	        						</c:if>
	        						
	        						<c:set var="listStartNum" value="${listStartNum+1}" />
	        					</c:forEach>
	        				</c:when>
	        			</c:choose>
	                    	//23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30
	                    	]
	                }, { 
	                    name: '',
	                    type: 'line',
	                    data: [
	                        <c:choose>
	        				<c:when test="${userBcg ne null && fn:length(userBcg) > 0}">
	        					<c:set var="listStartNum" value="0"></c:set>
	        					
	        					<c:forEach items="${userBcg}" var="bcg" varStatus="bcgStatus">
	        						<c:if test="${listStartNum eq 0}">
	        							<c:out value="${bcg.sleepMode}" />
	        						</c:if>
	        						<c:if test="${listStartNum ne 0}">
	        						,	<c:out value="${bcg.sleepMode}" />
	        						</c:if>
	        						
	        						<c:set var="listStartNum" value="${listStartNum+1}" />
	        					</c:forEach>
	        				</c:when> 
	        			</c:choose>
	                    	//23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30
	                    	]
	                }],
	                fill: {
	                    opacity: [0.85, 1],
	                },
	                labels: [
	                    <c:choose>
	      				<c:when test="${userBcg ne null && fn:length(userBcg) > 0}">
	      					<c:set var="listStartNum" value="0"></c:set>
	      					
	      					<c:forEach items="${userBcg}" var="bcg" varStatus="bcgStatus">
	      						<c:if test="${listStartNum eq 0}">
	      							'<c:out value="${bcg.regDate}" />'
	      						</c:if>
	      						<c:if test="${listStartNum ne 0}">
	      						,	'<c:out value="${bcg.regDate}" />'
	      						</c:if>
	      						
	      						<c:set var="listStartNum" value="${listStartNum+1}" />
	      					</c:forEach>
	      				</c:when> 
	      			</c:choose>
	                	],
	                markers: {
	                    size: 0
	                },
	                xaxis: {
	                    type: 'time'
	                },
	                yaxis: {
	                    min: 0
	                },
	                tooltip: {
	                    shared: true,
	                    intersect: false,
	                    y: {
	                        formatter: function(y) {
	                            if (typeof y !== "undefined") {
	                                return y.toFixed(0) + " views";
	                            }
	                            return y;

	                        }
	                    }
	                },
	                legend: {
	                    labels: {
	                        useSeriesColors: true
	                    },
	                    markers: {
	                        customHTML: [
	                            function() {
	                                return ''
	                            },
	                            function() {
	                                return ''
	                            }
	                        ]
	                    }
	                }
	            }
	            var chart = new ApexCharts(
	                document.querySelector("#account-chart3"),
	                options
	            );
	            chart.render();
	        });
	    });
	    // [ customer-chart ] start
	    $(function() {
	        var options = {
	            chart: {
	                height: 150,
	                type: 'donut',
	            },
	            dataLabels: {
	                enabled: false
	            },
	            plotOptions: {
	                pie: {
	                    donut: {
	                        size: '75%'
	                    }
	                }
	            },
	            labels: ['REM', 'NREM','AWAKE', 'MOVEMENT'],
	            series: [<c:out value="${userSleep.sleepCnt1}" />, <c:out value="${userSleep.sleepCnt2}" />, <c:out value="${userSleep.sleepCnt3}" />, <c:out value="${userSleep.sleepCnt4}" />],
	            legend: {
	                show: false
	            },
	            tooltip: {
	                theme: 'datk'
	            },
	            grid: {
	                padding: {
	                    top: 20,
	                    right: 0,
	                    bottom: 0,
	                    left: 0
	                },
	            },
	            colors: ["#4680ff", "#2ed8b6"],
	            fill: {
	                opacity: [1, 1]
	            },
	            stroke: {
	                width: 0,
	            }
	        }
	        var chart = new ApexCharts(document.querySelector("#customer-chart"), options);
	        chart.render();
	    });
  }
  
  //User Detail
  $('button[data-oper=position1]').on('click', function(e){
	    e.preventDefault();

	    var formData = {
	        userId: $('input[name=userId]').val(),
	        positionType:1
	      };

	    gfn_callServer('POST', '/user/positionUpdate', true, formData, 'application/x-www-form-urlencoded', 'text', callServerModifyResult, 30000, csrfTokenValue);
  });

  $('button[data-oper=position2]').on('click', function(e){
	    e.preventDefault();

	    var formData = {
	        userId: $('input[name=userId]').val(),
	        positionType:2
	      };

	    gfn_callServer('POST', '/user/positionUpdate', true, formData, 'application/x-www-form-urlencoded', 'text', callServerModifyResult, 30000, csrfTokenValue);
});
  $('button[data-oper=position3]').on('click', function(e){
	    e.preventDefault();

	    var formData = {
	        userId: $('input[name=userId]').val(),
	        positionType:3
	      };

	    gfn_callServer('POST', '/user/positionUpdate', true, formData, 'application/x-www-form-urlencoded', 'text', callServerModifyResult, 30000, csrfTokenValue);
});
  $('button[data-oper=position4]').on('click', function(e){
	    e.preventDefault();

	    var formData = {
	        userId: $('input[name=userId]').val(),
	        positionType:4
	      };

	    gfn_callServer('POST', '/user/positionUpdate', true, formData, 'application/x-www-form-urlencoded', 'text', callServerModifyResult, 30000, csrfTokenValue);
});
  
	$('button[data-oper=alarm]').on('click', function(e){
	    e.preventDefault();
	    //console.log(this.id);
	    console.log(this.confirmType);
	    //console.log($('input[name=userId]').val());
	    var formData = {
	        userId: $('input[name=userId]').val(),
	        alarmNo: this.id
	      };

	    gfn_callServer('POST', '/user/alarmUpdate', true, formData, 'application/x-www-form-urlencoded', 'text', callServerModifyResult, 30000, csrfTokenValue);
});
	$('button[data-oper=alarm0]').on('click', function(e){
	    e.preventDefault();
	    //console.log(this.id);
	    console.log(this.confirmType);
	    //console.log($('input[name=userId]').val());
	    var formData = {
	        userId: $('input[name=userId]').val(),
	        alarmNo: this.id,
	        confirmType: 0
	      };

	    gfn_callServer('POST', '/user/alarmUpdate', true, formData, 'application/x-www-form-urlencoded', 'text', callServerModifyResult, 30000, csrfTokenValue);
});
	$('button[data-oper=alarm1]').on('click', function(e){
	    e.preventDefault();
	    //console.log(this.id);
	    console.log(this.confirmType);
	    //console.log($('input[name=userId]').val());
	    var formData = {
	        userId: $('input[name=userId]').val(),
	        alarmNo: this.id,
	        confirmType: 1
	      };

	    gfn_callServer('POST', '/user/alarmUpdate', true, formData, 'application/x-www-form-urlencoded', 'text', callServerModifyResult, 30000, csrfTokenValue);
});
	//수정 후 처리
	function callServerModifyResult(data) {
		if (data == 'success') {
		  swal({
		       title: 'SUCCESS',
		       text: '수정 완료',
		       icon: 'success',
		       buttons: 'OK'
		  }).then(function () {
		      var formData = {
		              searchUserId: $('input[name=userId]').val()
		            };
		
		          gfn_callServer('GET', '/user', true, formData, 'application/x-www-form-urlencoded', 'text', gfn_callMenuResult, 30000, csrfTokenValue);
		  });
		}
	}
});
</script>
