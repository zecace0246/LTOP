<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <!-- <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Dashboard Analytics</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!">Dashboard Analytics</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            <!-- order-card start -->
            <div class="col-md-6 col-xl-3">
                <div class="card bg-c-blue order-card">
                    <div class="card-body">
                        <h6 class="text-white">심박이상</h6>
                        <h2 class="text-right text-white"><i class="feather icon-shopping-cart float-left"></i><span><c:out value="${dashboard.tdayr}" /></span></h2>
                        <p class="m-b-0">이번 달<span class="float-right"><c:out value="${dashboardm.tmonthr}" /></span></span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-3">
                <div class="card bg-c-green order-card">
                    <div class="card-body">
                        <h6 class="text-white">호흡이상</h6>
                        <h2 class="text-right text-white"><i class="feather icon-tag float-left"></i><span><c:out value="${dashboard.tdayh}" /></span></h2>
                        <p class="m-b-0">이번 달<span class="float-right"><c:out value="${dashboardm.tmonthh}" /></span></p>
                    </div>
                </div>
            </div>
            <!-- div class="col-md-6 col-xl-3">
                <div class="card bg-c-yellow order-card">
                    <div class="card-body">
                        <h6 class="text-white">수면</h6>
                        <h2 class="text-right text-white"><i class="feather icon-repeat float-left"></i><span><c:out value="${dashboard.tdays}" /></span></h2>
                        <p class="m-b-0">이번 달<span class="float-right"><c:out value="${dashboardm.tmonths}" /></span></p>
                    </div>
                </div>
            </div -->
            <div class="col-md-6 col-xl-3">
                <div class="card bg-c-red order-card">
                    <div class="card-body">
                        <h6 class="text-white">낙상감지</h6>
                        <h2 class="text-right text-white"><i class="feather icon-award float-left"></i><span><c:out value="${dashboard.tdayx}" /></span></h2>
                        <p class="m-b-0">이번 달<span class="float-right"><c:out value="${dashboardm.tmonthx}" /></span></p>
                    </div>
                </div>
            </div>
            <!-- order-card end -->
            <!-- users visite start -->
            <!-- div class="col-md-12 col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h5>Unique Visitor</h5>
                    </div>
                    <div class="card-body pl-0 pb-0">
                        <div id="unique-visitor-chart"></div>
                    </div>
                </div>
            </div-->
            <div class="col-md-12 col-xl-6">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body bg-patern">
                                <div class="row">
                                    <div class="col-auto">
                                        <span>이상 처리 결과</span>
                                    </div>
                                    <div class="col text-right">
                                        <h2 class="mb-0"><c:out value="${dashboard.toteventcnt}" /></h2>
                                    </div>
                                </div>
                                <div id="customer-chart"></div>
                                <div class="row mt-3">
                                    <div class="col">
                                        <h3 class="m-0"><i class="fas fa-circle f-10 m-r-5 text-success"></i><c:out value="${dashboard.confirmcnt}" /></h3>
                                        <span class="ml-3">처리</span>
                                    </div>
                                    <div class="col">
                                        <h3 class="m-0"><i class="fas fa-circle text-primary f-10 m-r-5"></i><c:out value="${dashboard.toteventcnt-dashboard.confirmcnt}" /></h3>
                                        <span class="ml-3">미처리</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card bg-primary text-white">
                            <div class="card-body bg-patern-white">
                                <div class="row">
                                    <div class="col-auto">
                                        <span>사용자 현황</span>
                                    </div>
                                    <div class="col text-right">
                                        <h2 class="mb-0 text-white"><c:out value="${dashboard.totmatcnt}" /></h2>
                                    </div>
                                </div>
                                <div id="customer-chart1"></div>
                                <div class="row mt-3">
                                    <div class="col">
                                        <h3 class="m-0 text-white"><i class="fas fa-circle f-10 m-r-5 text-success"></i><c:out value="${dashboard.usecnt}" /></h3>
                                        <span class="ml-3">사용중</span>
                                    </div>
                                    <div class="col">
                                        <h3 class="m-0 text-white"><i class="fas fa-circle f-10 m-r-5 text-white"></i><c:out value="${dashboard.totmatcnt-dashboard.usecnt}" /></h3>
                                        <span class="ml-3">미사용중</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- users visite end -->

            <!-- social statustic start -->
            <!-- div class="col-md-6 col-xl-6">
                <div class="card seo-card overflow-hidden">
                    <div class="card-body seo-statustic">
                        <i class="feather icon-save f-20 text-c-red"></i>
                        <h5 class="mb-1">65%</h5>
                    </div>
                    <div class="seo-chart">
                        <div id="seo-card1"></div>
                    </div>
                </div>
            </div-->
            <div class="col-md-12 col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h5>최근 1주일</h5>
                    </div>
                    <div class="card-body pl-0 pb-0">
                        <div id="unique-visitor-chart"></div>
                    </div>
                </div>
            </div>
            <!-- social statustic end -->

            <!-- Customer overview start -->
            <div class="col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5>알림 현황</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                <div class="table-responsive">
                                    <div class="customer-scroll" style="height:362px;position:relative;">
                                        <table class="table table-hover m-b-0">
                                            <thead>
                                                <tr>
                                                    <th><span>알림 일시</span></th>
                                                    <th><span>그룹 </span></th>
                                                    <th><span>그룹상세 </span></th>
                                                    <th><span>사용자명 </span></th>
                                                    <th><span>알림내용 </span></th>
                                                    <th><span>상태값</span></th>
                                                    <th><span>확인유무</span></th>
                                                    <th><span>확인시간 </span></th>
                                                    <th><span>확인자</span></th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:choose>
													<c:when test="${alarmList ne null && fn:length(alarmList) > 0}">
														<c:forEach items="${alarmList}" var="alarm" varStatus="alarmStatus">
                                                <tr>
                                                    <td><c:out value="${alarm.regDate}" /></td>
                                                    <td><c:out value="${alarm.agencyName}" /></td>
                                                    <td><c:out value="${alarm.groupName}" /></td>
                                                    <td><c:out value="${alarm.userName}" /></td>
                                                    <td><c:out value="${alarm.eventNm}" /></td>
                                                    <td><c:out value="${alarm.value}" /> 회
                                                        <!-- div class="progress mt-1" style="height:4px;">
                                                            <div class="progress-bar bg-info rounded" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div-->
                                                    </td>
                                                    <td><c:out value="${alarm.confirmYn}" /></td>
                                                    <td><c:out value="${alarm.confirmDate}" /></td>
                                                    <td><c:out value="${alarm.confirmId}" /></td>
                                                </tr>
														</c:forEach>	
					
													</c:when>
													<c:otherwise>
														<tr>
															<td class="text-center" colspan="9">알림이 없습니다</td>
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
            </div>
            <!-- Customer overview end -->
        </div>
        <!-- [ Main Content ] end -->
    </div>

    
<script>
'use strict';
$(document).ready(function() {
    setTimeout(function() {
        floatchart()
    }, 100);
    // [ campaign-scroll ] start
    var px = new PerfectScrollbar('.customer-scroll', {
        wheelSpeed: .5,
        swipeEasing: 0,
        wheelPropagation: 1,
        minScrollbarLength: 40,
    });
    var px = new PerfectScrollbar('.customer-scroll1', {
        wheelSpeed: .5,
        swipeEasing: 0,
        wheelPropagation: 1,
        minScrollbarLength: 40,
    });
    var px = new PerfectScrollbar('.customer-scroll2', {
        wheelSpeed: .5,
        swipeEasing: 0,
        wheelPropagation: 1,
        minScrollbarLength: 40,
    });
    var px = new PerfectScrollbar('.customer-scroll3', {
        wheelSpeed: .5,
        swipeEasing: 0,
        wheelPropagation: 1,
        minScrollbarLength: 40,
    });
    // [ campaign-scroll ] end
});

function floatchart() {

    // [ coversions-chart ] start
    $(function() {

    });
    // [ coversions-chart ] end
    // [ seo-card1 ] start
    $(function() {
        var options1 = {
            chart: {
                type: 'area',
                height: 230,
                sparkline: {
                    enabled: true
                }
            },
            dataLabels: {
                enabled: false
            },
            colors: ["#ff5370"],
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    gradientToColors: ['#ff869a'],
                    shadeIntensity: 1,
                    type: 'horizontal',
                    opacityFrom: 1,
                    opacityTo: 0.8,
                    stops: [0, 100, 100, 100]
                },
            },
            stroke: {
                curve: 'smooth',
                width: 2,
            },
            series: [{
                data: [45, 35, 60, 50, 85, 90]
            }],
            yaxis: {
               min: 5,
               max: 90,
           },
            tooltip: {
                fixed: {
                    enabled: false
                },
                x: {
                    show: false
                },
                y: {
                    title: {
                        formatter: function(seriesName) {
                            return 'Ticket '
                        }
                    }
                },
                marker: {
                    show: false
                }
            }
        }
        new ApexCharts(document.querySelector("#seo-card1"), options1).render();
    });
    // [ seo-card1 ] end
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
            labels: ['미처리', '처리'],
            series: [<c:out value="${dashboard.toteventcnt-dashboard.confirmcnt}" />, <c:out value="${dashboard.confirmcnt}" />],
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
        
        var options1 = {
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
            labels: ['미이용중', '이용중'],
            series: [<c:out value="${dashboard.totmatcnt-dashboard.usecnt}" />, <c:out value="${dashboard.usecnt}" />],
            legend: {
                show: false
            },
            tooltip: {
                theme: 'dark'
            },
            grid: {
                padding: {
                    top: 20,
                    right: 0,
                    bottom: 0,
                    left: 0
                },
            },
            colors: ["#fff", "#2ed8b6"],
            fill: {
                opacity: [1, 1]
            },
            stroke: {
                width: 0,
            }
        }
        var chart = new ApexCharts(document.querySelector("#customer-chart1"), options1);
        chart.render();
    });
    // [ customer-chart ] end
    // [ unique-visitor-chart ] start
    $(function() {
        var options = {
            chart: {
                height: 230,
                type: 'line',
                toolbar: {
                    show: false,
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                width: 2,
                curve: 'smooth'
            },
            series: [{
                name: '심박이상',
                data: [
                    <c:choose>
    				<c:when test="${alarmCnt ne null && fn:length(alarmCnt) > 0}">
    					<c:set var="listStartNum" value="0"></c:set>
    					
    					<c:forEach items="${alarmCnt}" var="bcg" varStatus="bcgStatus">
    						<c:if test="${listStartNum eq 0}">
    							<c:out value="${bcg.wdayr}" />
    						</c:if>
    						<c:if test="${listStartNum ne 0}">
    						,	<c:out value="${bcg.wdayr}" />
    						</c:if>
    						
    						<c:set var="listStartNum" value="${listStartNum+1}" />
    					</c:forEach>
    				</c:when>
    			</c:choose>
                	]
            }, {
                name: '호흡이상',
                data: [
                    <c:choose>
    				<c:when test="${alarmCnt ne null && fn:length(alarmCnt) > 0}">
    					<c:set var="listStartNum" value="0"></c:set>
    					
    					<c:forEach items="${alarmCnt}" var="bcg" varStatus="bcgStatus">
    						<c:if test="${listStartNum eq 0}">
    							<c:out value="${bcg.wdayh}" />
    						</c:if>
    						<c:if test="${listStartNum ne 0}">
    						,	<c:out value="${bcg.wdayh}" />
    						</c:if>
    						
    						<c:set var="listStartNum" value="${listStartNum+1}" />
    					</c:forEach>
    				</c:when>
    			</c:choose>
                	]
            }, {
                name: '낙상감지', 
                data: [
                    <c:choose>
    				<c:when test="${alarmCnt ne null && fn:length(alarmCnt) > 0}">
    					<c:set var="listStartNum" value="0"></c:set>
    					
    					<c:forEach items="${alarmCnt}" var="bcg" varStatus="bcgStatus">
    						<c:if test="${listStartNum eq 0}">
    							<c:out value="${bcg.wdayx}" />
    						</c:if>
    						<c:if test="${listStartNum ne 0}">
    						,	<c:out value="${bcg.wdayx}" />
    						</c:if>
    						
    						<c:set var="listStartNum" value="${listStartNum+1}" />
    					</c:forEach>
    				</c:when>
    			</c:choose>
                	]
            }],
            legend: {
                position: 'top',
            },
            xaxis: {
                type: 'date',
                categories: [
                    <c:choose>
    				<c:when test="${alarmCnt ne null && fn:length(alarmCnt) > 0}">
    					<c:set var="listStartNum" value="0"></c:set>
    					
    					<c:forEach items="${alarmCnt}" var="bcg" varStatus="bcgStatus">
    						<c:if test="${listStartNum eq 0}">
    							' <c:out value="${bcg.wday}" /> '
    						</c:if>
    						<c:if test="${listStartNum ne 0}">
    						,	' <c:out value="${bcg.wday}" /> '
    						</c:if>
    						
    						<c:set var="listStartNum" value="${listStartNum+1}" />
    					</c:forEach>
    				</c:when>
    			</c:choose>
                	],
                axisBorder: {
                    show: false,
                },
                label: {
                    style: {
                        color: '#ccc'
                    }
                },
            },
            yaxis: {
                show: true,
                min: 0,
                labels: {
                    style: {
                        color: '#ccc'
                    }
                }
            },
            colors: ['#73b4ff', '#59e0c5'],
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'light',
                    gradientToColors: ['#4099ff', '#2ed8b6'],
                    shadeIntensity: 0.5,
                    type: 'horizontal',
                    opacityFrom: 1,
                    opacityTo: 1,
                    stops: [0, 100]
                },
            },
            markers: {
                size: 5,
                colors: ['#4099ff', '#2ed8b6'],
                opacity: 0.9,
                strokeWidth: 2,
                hover: {
                    size: 7,
                }
            },
            grid: {
                borderColor: '#cccccc3b',
            	//show: false
            }
        }
        var chart = new ApexCharts(document.querySelector("#unique-visitor-chart"), options);
        chart.render();
    });
    // [ unique-visitor-chart ] end
}

</script>