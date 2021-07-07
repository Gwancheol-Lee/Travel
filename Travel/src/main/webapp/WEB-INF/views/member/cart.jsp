<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="resources/js/cart.js"
   charset="UTF-8"></script>
<link rel="stylesheet" type="text/css"
   href="resources/css/cart.css?after">
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
table {
   border-spacing: 15px;
}
</style>
</head>
<%@ include file="../include/menu.jsp"%>
<body>
   <section class="probootstrap-cover2 overflow-hidden relative"
      data-stellar-background-ratio="0.5" id="section-home">
   <div class="overlay"></div>
   </section>
   <div class="clean" style="height: 10em"></div>
   <hr>
   <h1 class="cartList">
      <i class="fas fa-shopping-cart" style="margin-right: 1em;"></i> 장바구니
      목록
   </h1>
   <hr>
   <div class="clean" style="height: 5em"></div>
   <table class="cart" align="center" style="width: 60%">
      <tr>
         <th><input id="checkAll" type="checkbox" checked /></th>
         <th>이미지</th>
         <th>상품명</th>
         <th>가격</th>
         <th>개 수</th>
         <th>합계</th>
         <th>삭제</th>

      </tr>
      <c:set var="priceSum" value="0" />
      <c:set var="deliverySum" value="0" />

      <c:forEach items="${cartPrd}" var="cartprd">
         <tr align="center">
            <!--체크박스-->
            <td><input type="checkbox" name="chk" onclick="calCart()"
               value="${cartprd.prd_id}" checked /> <input type="hidden"
               name="prd_delivery" value="${cartprd.prd_delivery}" /> <input
               type="hidden" name="prd_sum" value="${cartprd.prd_sum}" /> <input
               type="hidden" id="member_id" value="${member.member_id}" /></td>
            <td>
               <!-- 이미지 --> <img src="${cartprd.prd_img}"
               style="width: 15em; height: 15em; margin:10px;">
            </td>
            <!-- 상품명 -->
            <td>${cartprd.prd_name}</td>
            <%--<td>${cartprd.prd_opt}</td> --%>
            <!-- 판매가 -->
            <td><fmt:formatNumber value="${cartprd.prd_price}"
                  pattern="#,###" /></td>
            <!-- 수량 -->
            <td><fmt:formatNumber value="${cartprd.buy_quantity}"
                  pattern="#,###" /></td>
            <!-- 배송비 -->
            <%--    <td><fmt:formatNumber value="${cartprd.prd_delivery}"
                  pattern="#,###" /></td> --%>
            <!-- 합계 -->
            <td><fmt:formatNumber value="${cartprd.prd_sum}"
                  pattern="#,###" /></td>
            <!-- 삭제 버튼-->
            <td><input type="button" id="delCart"
               onClick="delCart('${cartprd.prd_id}', '${member.member_id}')"
               value="삭제" class="del_cart_btn" /> <input type="hidden"
               id="prd_id" value="${cartprd.prd_id}" /></td>
         </tr>

         <c:set var="priceSum" value="${priceSum + cartprd.prd_sum}" />
         <c:set var="deliverySum"
            value="${deliverySum + cartprd.prd_delivery}" />
      </c:forEach>
      <tr align="right">
         <td colspan="9"><input type="button" name="cartClear"
            id="cartClear" onclick="cartClear()" value="상품 비우기" class="cart_btn" /></td>
      </tr>
   </table>

   <hr>
   <h1>결제</h1>
   <hr>

   <%--    <div class="row pay" style="font-size: 3em;">
      <div class="col" style="float: right; text-align: right;">총 결제
         금액 :</div>
      <div class="col" style="float: left;">
         <fmt:formatNumber value="${priceSum}" pattern="#,###" />

         <span> <input type="button" id="payCart" onclick="payCart()"
            value="결제하기" class="cart_btn" /> <input type="hidden"
            name="hiddenbtn" id="hiddenbtn" value="cartpage" />
         </span>
   </div>
      </div> --%>



   <div class="container cart3" align="center">
      <span class="pay">총 상품 금액 : </span> <span id="prd_sum" class="pay">
         <fmt:formatNumber value="${priceSum}" pattern="#,###" />원
      </span> <input type="button" id="payCart" onclick="payCart()" value="결제하기"
         class="select" /> <input type="hidden" name="hiddenbtn"
         id="hiddenbtn" value="cartpage" />
   </div>
   <!-- hidden -->
   <div>
      <h2 id="prd_delivery" style="visibility: hidden;">
         <fmt:formatNumber value="${deliverySum}" pattern="#,###" />
      </h2>
      <h2 id="total" style="visibility: hidden;">
         <fmt:formatNumber value="${priceSum + deliverySum}" pattern="#,###" />
      </h2>
   </div>

   <!--    <table class="cart3" align="center"> -->
   <!--       <tr align="center"> -->
   <!--          <th colspan="2">총 상품 금액</th> -->

   <!--          <th></th> -->

   <!--          <th colspan="2">총 배송비</th> -->

   <!--          <th></th> -->

   <!--          <th>총 합계</th> -->
   <!--       </tr> -->
   <!--       <tr align="center"> -->
   <!--          <td colspan="2"><h2 id="prd_sum"> -->
   <%--                <fmt:formatNumber value="${priceSum}" pattern="#,###" /> --%>
   <!--             </h2></td> -->
   <!--          <td><h2>+</h2></td> -->
   <!--          <td colspan="2"><h2 id="prd_delivery"> -->
   <%--                <fmt:formatNumber value="${deliverySum}" pattern="#,###" /> --%>
   <!--             </h2></td> -->
   <!--          <td><h2>=</h2></td> -->
   <!--          <td><h2 id="total"> -->
   <%--                <fmt:formatNumber value="${priceSum + deliverySum}" pattern="#,###" /> --%>
   <!--             </h2></td> -->
   <!--       </tr> -->

   <!--       <tr align="center"> -->
   <!--          <td colspan="7"><input type="button" id="payCart" -->
   <!--             onclick="payCart()" value="결제하기" class="cart_btn" /> <input -->
   <!--             type="hidden" name="hiddenbtn" id="hiddenbtn" value="cartpage" /></td> -->
   <!--       </tr> -->

   <!--    </table> -->

   <script>
      $(document)
            .ready(
                  function() { // 최상단 체크박스 클릭
                     $("#checkAll").click(
                           function() { // 클릭
                              if ($("#checkAll").prop("checked")) { // input tag name="chk" checked=true
                                 $("input[name=chk]").prop(
                                       "checked", true);
                              } else {
                                 $("input[name=chk]").prop(
                                       "checked", false);
                              }
                           })

                     $("input[name=chk]")
                           .click(
                                 function() {
                                    if ($("input[name=chk]").length == $("input[name=chk]:checkbox:checked").length) {
                                       $("#checkAll").prop(
                                             "checked", true);
                                    } else {
                                       $("#checkAll").prop(
                                             "checked", false);
                                    }
                                 })
                  })

      function payCart() {
         var member_id = $("#member_id").val();
         var hiddenbtn = $("#hiddenbtn").val();
         if ($("input[name=chk]:checkbox:checked").length == 0) {
            swal("", "결제할 상품을 선택해주세요.", "warning");
         } else {
            $.ajax({
               type : "POST",
               url : "payment",
               data : {
                  "member_id" : member_id,
                  "hiddenbtn" : hiddenbtn
               },
               success : function(data) {
                  console.log(data);
                  window.location.href = "payment";
               }
            });
         }
      }
   </script>


   <%@ include file="../include/csinfo.jsp"%>
</body>
</html>