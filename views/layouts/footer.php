<footer id="footer"><!--Footer-->
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<p class="pull-left my-works" id="works">Другие мои работы</p>
				<div class="pull-right">
					<p>Владимир Македонов</p>
					<p >Copyright © 2017</p>
				</div>
			</div>
		</div>
	</div>
</footer><!--/Footer-->
</div>

<script src="../../template/js/jquery.js"></script>

<!-- slider -->
<script src="../../template/js/jquery.cycle2.js"></script>
<script src="../../template/js/jquery.cycle2.carousel.js"></script>
<!-- slider -->

<script src="../../template/js/bootstrap.min.js"></script>
<script src="../../template/js/jquery.scrollUp.min.js"></script>
<script src="../../template/js/popUpWindow.js"></script>
<script src="../../template/js/price-range.js"></script>
<script src="../../template/js/jquery.prettyPhoto.js"></script>
<script src="../../template/js/main.js"></script>
<script>
	$(document).ready(function(){
		$(".add-to-cart").click(function () {
			var id = $(this).attr("data-id");
			var count = $('#count').val();
			$.post("/cart/addAjax/"+id, {count: count}, function (data) {
				$("#cart-count").html('(' + data + ')');
			});
			return false;
		});
	});
</script>
</body>
</html>