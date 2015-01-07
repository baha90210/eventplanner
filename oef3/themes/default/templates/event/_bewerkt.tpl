<div class="sixteen columns">Event Bewerkt!</div>
<div id="spinner" class="spinner" style="display:none;">
    <img id="img-spinner" src="./themes/default/ajax-loader.gif" alt="Loading"/>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('#spinner').show();
        window.location.replace("index.php?route=event/overview");
        
    })
</script>