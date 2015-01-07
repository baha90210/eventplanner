<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Controller
 *
 * @author Desktop
 */
class mainController extends controller {
        // main screen
	public function buildMainscreen(){
		$this->setTitle('Main screen');
		$this->loadModel('main');
		$this->mainmenu_items = $this->model->buildMainmenu();
		$this->render('main/_screen.tpl');
	}
}
