<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- Body -->
<div style="background-color: #F5F5F5">
	<div class="container">
		<div class="row pt-3 pb-3">
			<div class="col-12 fw-bold fs-5 bg-white">Trang Chủ/ Giỏ Hàng</div>
			<div class="col-12 p-0 pe-3 mt-3">
				<table class="table align-middle mb-0 bg-white">
					<thead class="text-center"
						style="background-color: #000000; color: #FAFAFA">
						<tr>
							<th class="fw-bold fs-6">Product</th>
							<th class="fw-bold fs-6">Price</th>
							<th class="fw-bold fs-6">Quantity</th>
							<th class="fw-bold fs-6">Total Price</th>
							<th class="fw-bold fs-6">Delete</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach items="${ ordetail.content }" var="ordetail">
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<img src="/SOF3021/images/${ ordetail.products.image }" alt=""
											style="width: 120px; height: 120px" class="rounded-circle" />
										<div class="ms-3">
											<p class="fw-bold mb-1">${ ordetail.products.name }</p>
										</div>
									</div>
								</td>
								<td>${ ordetail.products.price }VNĐ</td>
								<td>
									<div class="d-flex justify-content-center align-items-center">
										<a
											href="/SOF3021/user/dec/${ ordetail.id }?sl=${ ordetail.quantity }"
											class="p-1" style="background-color: #F5E000; color: white;"><i
											class="bi bi-dash-lg fw-bold fs-6"></i></a> <input type="text"
											class="form-control rounded-0 border border border-0 text-center pb-1"
											style="width: 40px" value="${ ordetail.quantity }" /> <a
											href="/SOF3021/user/inc/${ ordetail.id }?sl=${ ordetail.quantity }"
											class="p-1" style="background-color: #F5E000; color: white;"><i
											class="bi bi-plus-lg fw-bold fs-6"></i></a>
									</div>
								</td>
								<td>${ ordetail.quantity * ordetail.products.price }VNĐ</td>
								<td><a class="btn btn-danger" href="/SOF3021/user/delete"><i
										class="bi bi-trash-fill"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="container">
			<div class="row pt-3 pb-3">
				<div class="col-8 p-0 pe-3 mt-3">
					<div class="fw-bold fs-5 text-center"
						style="background-color: #2A2B01; color: #FCFCFC">THÔNG TIN
						THANH TOÁN</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="Họ tên"> <label for="floatingInput">Họ
							tên</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingPassword"
							placeholder="Địa chỉ nhận hàng"> <label
							for="floatingPassword">Địa chỉ nhận hàng</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="SĐT"> <label for="floatingInput">SĐT
						</label>
					</div>
					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="floatingInput"
							placeholder="name@example.com"> <label
							for="floatingInput">Email</label>
					</div>
					
				</div>
				<div class="col-4 mt-3 bg-white p-0">
					<div class="fw-bold fs-5 text-center"
						style="background-color: #EDDF40; color: #FCFCFC">TÍNH TIỀN</div>
					<div class="p-3">
						<p class="fw-bold fs-5">Sản Phẩm</p>
						<c:forEach items="${ all }" var="all">
							<p class="fs-6">${ all.products.name }(${ all.quantity })</p>
						</c:forEach>
						<hr>
						<p class="fw-bold fs-5">Tiền hàng : ${ allMoney } VNĐ</p>
						<p class="fw-bold fs-5">Giảm giá:</p>
						<hr>
						<p class="fw-bold fs-5">Tổng tiền: ${ allMoney } VNĐ</p>
						<hr>
						<form:form method="POST" action="/SOF3021/user/pay"
							modelAttribute="o">
							<div class="fw-bold fs-5">Địa chỉ nhận hàng:</div>
							<form:input placeholder="Address!!" path="address" name="address"
								type="text" class="form-control border border-0 rounded-0" />
							<div class="fw-bold fs-5 mt-3">Hình thức thanh toán:</div>
							<!-- Default radio -->
							<div class="form-check mt-2">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault1" /> <label
									class="form-check-label" for="flexRadioDefault1"> Tiền
									mặt </label>
							</div>

							<!-- Default checked radio -->
							<div class="form-check mt-1">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault2" checked /> <label
									class="form-check-label" for="flexRadioDefault2">
									Chuyển khoản </label>
							</div>
							<div
								class="text-center d-flex justify-content-center align-items-end mt-5"
								style="background-color: #F2AF5C">
								<a href="/SOF3021/user/history">
									<button class="btn fw-bold fs-4 shadow-0"
										style="color: #161459">
										<i class="bi bi-box-arrow-in-right"></i> Đặt Hàng <i
											class="bi bi-box-arrow-in-left"></i>
									</button>
								</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>

	</div>

</div>
<!-- Body -->