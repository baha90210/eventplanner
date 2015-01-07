<div>
    <?php if($this->error_msg != ''){ ?>
        <div class="sixteen columns error"><?php echo $this->error_msg; ?></div>	
    <?php } ?>>
    <form class="offset-by-five login-form"method="post" action="index.php?route=login/login">
        <table class="five columns list">
                <tr>
                    <td>Email: <input type="text" name="username" value="" /></td>
                </tr>
                <tr>
                    <td>Password: <input type="password" name="password" value="" /></td>
                </tr>
                <tr>
                    <td>
                            <input type="submit" name="submit" value="Inloggen" />
                    </td>
                </tr>
        </table>
    </form>
</div>
