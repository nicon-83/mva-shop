<?php include ROOT . '/views/layouts/header.php'; ?>

<section>
	<div class="container">
		<div class="row">
			
			<h2>Мои заказы</h2>
			
			<table class="table-bordered table-striped table">
				<tr>
					<th>ID заказа</th>
					<th>Дата оформления</th>
					<th>Статус</th>
				</tr>
				<?php foreach ($orders as $order): ?>
					<tr>
						<td><a href="/cabinet/detail/<?php echo $order['id']; ?>"><?php echo $order['id']; ?></a></td>
						<td><?php echo $order['date']; ?></td>
						<td><?php echo Order::getStatusText($order['status']); ?></td>
					</tr>
				<?php endforeach; ?>
			</table>

			<a class="btn btn-default back" href="/cabinet"><i class="fa fa-arrow-left"></i> Назад</a>

		</div>
	</div>
</section>

<?php include ROOT . '/views/layouts/footer.php'; ?>