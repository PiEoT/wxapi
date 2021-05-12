<?php
namespace app\index\controller;
use think\Controller;
class Api extends Controller
{
    
    //学术交流 列表
    public function academicList(){
    	$where = array('status'=>1);
    	
    	$query = input(); 
    	$page = empty($query['page'])?1:$query['page'];
    	$pageSize = empty($query['pageSize'])?10:$query['pageSize'];
    	
		$rs = \think\Db::name('m_academic') 
				->where($where)
				->page($page)
				->order('weight','desc')
				->limit($pageSize)
				->select();
				
		$ct = \think\Db::name('m_academic')
				->where($where)
				->count();
		
		$pageParm = array(
			'total'	=>	$ct,
			'page'	=>	$page,
			'pageSize'	=>	$pageSize,
			'totalPage'	=>	ceil($ct/$pageSize),
		);
		
		$this->_A(true,'success',array(
			'list'	=>	$rs,
			'page'	=>	$pageParm,
		));
	}
	
	//学术交流 详情
	public function academicDetial(){
		$id = input('id');
		if(empty($id)){
			$this->_A(false,'parms error');
		}
		$rs = \think\Db::name('m_academic') 
				->where(array('id'=>$id))
				->find();
		if(!empty($rs)){
			$this->_A(true,'success',$rs);
		}else{
			$this->_A(false,'data empty');
		}
	}
	
	
    //试剂盒 列表
    public function kitsList(){
    	$where = array('status'=>1);
    	
    	$query = input(); 
    	$page = empty($query['page'])?1:$query['page'];
    	$pageSize = empty($query['pageSize'])?10:$query['pageSize'];
    	
		$rs = \think\Db::name('m_kits') 
				->where($where)
				->page($page)
				->order('weight','desc')
				->limit($pageSize)
				->select();
				
		$ct = \think\Db::name('m_kits')
				->where($where)
				->count();
		
		$pageParm = array(
			'total'	=>	$ct,
			'page'	=>	$page,
			'pageSize'	=>	$pageSize,
			'totalPage'	=>	ceil($ct/$pageSize),
		);
		
		$this->_A(true,'success',array(
			'list'	=>	$rs,
			'page'	=>	$pageParm,
		));
	}
	
	//试剂盒 详情
	public function kitsDetial(){
		$id = input('id');
		if(empty($id)){
			$this->_A(false,'parms error');
		}
		$rs = \think\Db::name('m_kits') 
				->where(array('id'=>$id))
				->find();
		if(!empty($rs)){
			$this->_A(true,'success',$rs);
		}else{
			$this->_A(false,'data empty');
		}
	}
	
	
    //招聘 列表
    public function zhaopinList(){
    	$where = array('status'=>1);
    	
    	$query = input(); 
    	$page = empty($query['page'])?1:$query['page'];
    	$pageSize = empty($query['pageSize'])?10:$query['pageSize'];
    	
		$rs = \think\Db::name('m_zhaopin') 
				->where($where)
				->page($page)
				->order('weight','desc')
				->limit($pageSize)
				->select();
				
		$ct = \think\Db::name('m_zhaopin')
				->where($where)
				->count();
		
		$pageParm = array(
			'total'	=>	$ct,
			'page'	=>	$page,
			'pageSize'	=>	$pageSize,
			'totalPage'	=>	ceil($ct/$pageSize),
		);
		
		$this->_A(true,'success',array(
			'list'	=>	$rs,
			'page'	=>	$pageParm,
		));
	}
	
	//招聘 详情
	public function zhaopinDetial(){
		$id = input('id');
		if(empty($id)){
			$this->_A(false,'parms error');
		}
		$rs = \think\Db::name('m_zhaopin') 
				->where(array('id'=>$id))
				->find();
		if(!empty($rs)){
			$this->_A(true,'success',$rs);
		}else{
			$this->_A(false,'data empty');
		}
	}
	
	
    //产品 列表
    public function machineList(){
    	$where = array('status'=>1);
    	
    	$query = input(); 
    	$page = empty($query['page'])?1:$query['page'];
    	$pageSize = empty($query['pageSize'])?10:$query['pageSize']; 
		$rs = \think\Db::name('m_machine') 
				->where($where)
				->page($page)
				->limit($pageSize)
				->order('weight','desc')
				->select();
				
		$ct = \think\Db::name('m_machine')
				->where($where)
				->count();
		
		$pageParm = array(
			'total'	=>	$ct,
			'page'	=>	$page,
			'pageSize'	=>	$pageSize,
			'totalPage'	=>	ceil($ct/$pageSize),
		);
		
		$this->_A(true,'success',array(
			'list'	=>	$rs,
			'page'	=>	$pageParm,
		));
	}
	
	//产品 详情
	public function machineDetial(){
		$id = input('id');
		if(empty($id)){
			$this->_A(false,'parms error');
		}
		$rs = \think\Db::name('m_machine') 
				->where(array('id'=>$id))
				->find();
		if(!empty($rs)){
			$this->_A(true,'success',$rs);
		}else{
			$this->_A(false,'data empty');
		}
	}
	
	
    //公司新闻 列表
    public function newsList(){
    	$where = array('status'=>1);
    	
    	$query = input(); 
    	$page = empty($query['page'])?1:$query['page'];
    	$pageSize = empty($query['pageSize'])?10:$query['pageSize']; 
		$rs = \think\Db::name('m_news') 
				->where($where)
				->page($page)
				->limit($pageSize)
				->order('weight','desc')
				->select();
				
		$ct = \think\Db::name('m_news')
				->where($where)
				->count();
		
		$pageParm = array(
			'total'	=>	$ct,
			'page'	=>	$page,
			'pageSize'	=>	$pageSize,
			'totalPage'	=>	ceil($ct/$pageSize),
		);
		
		$this->_A(true,'success',array(
			'list'	=>	$rs,
			'page'	=>	$pageParm,
		));
	}
	
	//公司新闻 详情
	public function newsDetial(){
		$id = input('id');
		if(empty($id)){
			$this->_A(false,'parms error');
		}
		$rs = \think\Db::name('m_news') 
				->where(array('id'=>$id))
				->find();
		if(!empty($rs)){
			$this->_A(true,'success',$rs);
		}else{
			$this->_A(false,'data empty');
		}
	}
	
	
	public function saveService(){
		if (!(request() -> isPost())){
			$this->_A(false,'request error');
		}
		$dat = input();
		$dat['type'] = empty($dat['type'])?1:$dat['type'];
		if(empty($dat['username'])){
			$this->_A(false,'username can not empty');
		}
		if(empty($dat['phone'])){
			$this->_A(false,'phone can not empty');
		}
		if(!preg_match("/^1[34578]{1}\d{9}$/",$dat['phone'])){  
		    $this->_A(false,'phone input error');
		}
		if(empty($dat['company'])){
			$this->_A(false,'company can not empty');
		} 
		if(empty($dat['question'])){
			$this->_A(false,'question can not empty');
		}
		$tm = date('Y-m-d',time());
		$dat['created'] = $tm;
		$dat['modified'] = $tm;
		$rs = \think\Db::name('m_service') -> insert($dat);
		if(!empty($rs)){
			$this->_A(true,'success',$rs);
		}else{
			$this->_A(false,'data empty');
		}
	}
	
	//JSON return 
	public function _A($s=true,$m="success",$d=array()){
		header("Access-Control-Allow-Origin:*");
    	header("Access-Control-Allow-Headers:X-Requested-With");
		header('Content-type: text/json');
		exit(json_encode(array(
			's'	=>	$s,
			'm'	=>	$m,
			'd'	=>	$d
		)));
	}

}