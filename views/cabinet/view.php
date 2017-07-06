<?php include ROOT . '/views/layouts/header.php'; ?>

<section>
	<div class="container">
		<div class="row">

			<br>
			<h4>Просмотр заказа №<?php echo $order['id']; ?></h4>
			<br>

			<h5>Информация о заказе</h5>
			<table class="table-admin-small table-bordered table-striped table">
				<tr>
					<td>Имя клиента</td>
					<td><?php echo $order['user_name']; ?></td>
				</tr>
				<tr>
					<td>Телефон клиента</td>
					<td><?php echo $order['user_phone']; ?></td>
				</tr>
				<tr>
					<td>Комментарий клиента</td>
					<td><?php echo $order['user_comment']; ?></td>
				</tr>
				<tr>
					<td>Статус заказа</td>
					<td><?php echo Order::getStatusText($order['status']); ?></td>
				</tr>
				<tr>
					<td>Дата заказа</td>
					<td><?php echo $order['date']; ?></td>
				</tr>
			</table>
			<br>
			<h5>Товары в заказе</h5>

			<table class="table-admin-medium table-bordered table-striped table ">
				<tr>
					<th>ID товара</th>
					<th>Артикул товара</th>
					<th>Название</th>
					<th>Цена</th>
					<th>Количество</th>
				</tr>

				<?php foreach ($products as $product): ?>
					<tr>
						<td><?php echo $product['id']; ?></td>
						<td><?php echo $product['code']; ?></td>
						<td><a href="/product/<?php echo $product['id']; ?>"><?php echo $product['name']; ?></a></td>
						<td>$<?php echo $product['price']; ?></td>
						<td><?php echo $productsQuantity[$product['id']]; ?></td>
					</tr>
				<?php endforeach; ?>

			</table>
			<br>
			<a href="/cabinet/orders" class="btn btn-default back"><i class="fa fa-arrow-left"></i> Назад</a>
		</div>
	</div>
</section>

<?php include ROOT . '/views/layouts/footer.php'; ?>

