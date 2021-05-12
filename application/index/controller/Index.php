<?php
namespace app\index\controller;
class Index extends \app\index\controller\Common
{

    public function index()
    {
		exit('<center><h2>开发中...</h2></center>');

        return $this->fetch();
    }

}