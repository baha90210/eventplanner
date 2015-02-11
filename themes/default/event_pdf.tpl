<style>
	*{margin: 0; padding: 0; font-size: 11px; line-height: 15px;}
	h1{font-size:14px;font-weight:bold;line-heigth:20px;margin:40px 0 10px 0;}
	span{display:block;float:none;clear:both;}
	th{padding: 5px;}
	th.heading{vertical-align: top; text-align: left; background: #ccc; margin: 0px;}
	td.detail{vertical-align: top; padding: 5px;}
</style>

<page backtop="84mm" backbottom="42mm" backleft="10mm" backright="10mm">

	<page_header>
		<span id="doc_title"><h1><?php echo $this->event["event_name"];?></h1></span>
		<span id="doc_date"><?php echo $this->event["start_date"]; ?> - <?php echo $this->event["end_date"]; ?></span>
		
		<?php /* print_r($this->event); */ ?>
		
	</page_header>
	
	<page_footer>
		<span id="doc_footer"> Powered by The A-Team, <?php echo date('d-m-Y'); ?> </span>
	</page_footer>
	
	<table style="width:760px; margin-top: 40px; border: 0px solid #000;">
	
		<thead>
			<tr>
             <th class="heading" style="width: 20%;">
             	Type</th>
             <th class="heading" style="width: 20%;">
             	Item</th>
             <th class="heading" style="width: 20%;">
             	Description</th>
             <th class="heading" style="width: 20%;">
             	Rate</th>
			</tr>
		</thead>
				
		<tbody>
		

		<?php if(isset($this->event['locations']) and $this->event['locations'] !='') : ?>	
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<?php foreach($this->event['locations'] as $location) : ?>
				<tr>
		             <td>
		             	Location</td>
		             <td>
		             	<?php echo $location['name']; ?></td>
		             <td>
		             	<?php echo $location['desc']; ?></td>
		             <td style="text-align:right;">
		             	<?php echo $location['rate']; ?></td>
				</tr>
			<?php endforeach; ?>
		<?php endif; ?>	

		<?php if(isset($this->event['artists']) and $this->event['artists'] !='') : ?>	
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<?php foreach($this->event['artists'] as $artist) : ?>
				<tr>
		             <td>
		             	Artist</td>
		             <td>
		             	<?php echo $artist['name']; ?></td>
		             <td>
		             	<?php echo $artist['desc']; ?></td>
		             <td style="text-align:right;">
		             	<?php echo $artist['rate']; ?></td>
				</tr>
			<?php endforeach; ?>
		<?php endif; ?>				

		<?php if(isset($this->event['resources']) and $this->event['resources'] !='') : ?>	
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>

			<?php foreach($this->event['resources'] as $resource) : ?>
				<tr>
		             <td>
		             	Resource</td>
		             <td>
		             	<?php echo $resource['name']; ?></td>
		             <td>
		             	<?php echo $resource['desc']; ?></td>
		             <td style="text-align:right;">
		             	<?php echo $resource['rate']; ?></td>
				</tr>
			<?php endforeach; ?>
		<?php endif; ?>	
                
		<?php if(isset($event['performances']) and $event['performances'] !='') : ?>	
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>

			<?php foreach($event['performances'] as $performance) : ?>
				<tr>
		             <td>
		             	Performance</td>
		             <td>
		             	<?php echo $performance['performance_title']; ?></td>
		             <td>
		             	<?php echo $performance['artist_name']; ?></td>
		             <td style="text-align:right;">
		             	<?php echo $performance['name']; ?></td>
				</tr>
			<?php endforeach; ?>
		<?php endif; ?>	



			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" style="font-weight:bold">
					Total rate</td>
				<td style="text-align:right;font-weight:bold">
					<?php echo number_format($this->event['total_rate'], 2); ?></td>
			</tr>		
					
			
					
		</tbody>
	</table>	
	
</page>