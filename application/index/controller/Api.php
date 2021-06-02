<?php
namespace app\index\controller;
use think\Controller;
use wechat\Wechat;

class Api extends Controller
{
    private $wx = null;
    private $conf = null;
    
    public function _initialize(){
		$this->conf = config('wechat');
		$this->wx = new Wechat($this->conf);
	}
    
     
	function get_Token(){ 
		$this->wx->getMenu();
		$token = $this->wx->access_token; 
		if(empty($token)){
			_A(false,'getToken Error');
		}
		_A(true,'OK',$token);
	}
	
	function get_JSAPI_Config(){	
		$url =  $_POST['callback'];
		$jsSign = $this->wx->getJsSign($url);
		$jsSign['jsapi_ticket'] = $this->wx->jsapi_ticket;
		_A(true,'OK',$jsSign);
	}
	
	/**
	* 代理授权接口
	* 代理授权登陆 需要传递授权成功回调地址 callback 为 urlencode 编码
	* http://wx.zhijin101.com/api.php/wx/oauth?callback=url
	* url = urlencode(http://wx.zhijin101.com);
	* 授权成功后 会把得到的用户数据返回给 callback地址 
	* 返回格式 base64_encode(json_encode(array()));
	* callback页面可通过 $_POST['data'] 获取到用户数据
	* $userdata = json_decode(base64_decode($_POST['data']),true);
	* @return
	*/
	function oauth(){
		$callback = empty($_GET['callback'])?'':$_GET['callback']; 
		$type =  empty($_GET['type']) ? 'snsapi_base' : 'snsapi_userinfo' ;
		$url = 'http://wx.zhijin101.com/api.php/wx/oautback?callback='.$callback.'&type='.$type;
		$link = $this->wx->getOauthRedirect($url,'',$type);
		echo '<script language="javascript"> location.href=" '.$link.'";</script>';
		exit();
	}
	
	function oautback(){
		_P($_GET);
		$callback = urldecode($_GET['callback']);
		$AccessToken = $this->wx->getOauthAccessToken();
		if(empty($AccessToken)){
			_A(false,'get OauthAccessToken Error');
		}
		_P($AccessToken,0);
		if(empty($_GET['type'])||$_GET['type']!='snsapi_userinfo'){
			if(!empty($callback)){
				$data = array(
					'openid'	=>	$AccessToken['openid'],
					'type'		=>	'base',
				);
				$data =base64_encode(json_encode($data));
				$this->data = $data;
				$this->action = $callback;
				$this->display('wx/oauthback.html');
			}else{
				$this->_D($AccessToke);
			}
		}
		$userdata = $this->wx->getOauthUserinfo($AccessToken['access_token'],$AccessToken['openid']);
		if(empty($userdata)){
			_A(false,'get UserInfo Error');
		}  
		if(!empty($callback)){
			$data = $userdata;
			$data['type'] = 'userinfo';
			$data = base64_encode(json_encode($data));
			$this->data = $data;
			$this->action = $callback;
			$this->display('wx/oauthback.html');
		}else{
			$this->_D($userdata);
		}
	}
}