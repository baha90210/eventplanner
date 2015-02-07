		</div>
		<div id="footer">
                <?php if (method_exists($this, 'getMessageTextByKey')) echo($this->model->getMessageTextByKey('ftr_STANDARD')); ?>
                </div>
	</div>
	<div class="col-md-1">&nbsp;</div>	
</body>
</html>
