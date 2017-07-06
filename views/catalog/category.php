<?php include ROOT . '/views/layouts/header.php'; ?>

<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="left-sidebar">
					<h2>Каталог</h2>
					<div class="panel-group category-products">

						<?php foreach ($categories as $categoryItem): ?>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="/category/<?php echo $categoryItem['id'];?>" class="<?php if ($categoryId == $categoryItem['id']) echo 'active'; ?>">
											<?php echo $categoryItem['name'];?>
										</a>
									</h4>
								</div>
							</div>
						<?php endforeach; ?>

					</div>
				</div>
			</div>

			<div class="col-sm-9 padding-right">
				<h2 class="title text-center">Последние товары</h2>
				<div class="features_items"><!--features_items-->

					<?php foreach ($categoryProducts as $product): ?>
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<div class="product-photo">
										<img src="<?php echo Product::getImage($product['id']); ?>" alt="" />
									</div>
									<h2><?php echo $product['price'];?>$</h2>
									<p>
										<a href="/product/<?php echo $product['id'];?>">
											<?php echo $product['name'];?>
										</a>
									</p>
									<a href="/cart/addAjax/<?php echo $product['id'];?>" data-id="<?php echo $product['id']; ?>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>В корзину</a>
								</div>
								<?php if ($product['is_new']): ?>
									<img src="/template/images/home/new.png" class="new" alt="" />
								<?php endif; ?>
							</div>
						</div>
					<?php endforeach;?>

				</div><!--features_items-->

				<!-- Постраничная навигация -->
				<div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
					<?php echo $pagination -> get(); ?>
				</div>
				<!-- Постраничная навигация -->
			</div>
		</div>
	</div>
</section>

<?php include ROOT . '/views/layouts/footer.php'; ?>