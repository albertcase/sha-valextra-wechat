<?php
namespace Wechat\ApiBundle\Forms;

use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\Session\Session;

class qrcodeupdate extends FormRequest{

  public function rule(){
    return array(
      // 'id' => new Assert\NotBlank(),
      // 'qrName' => new Assert\NotBlank(),
      // 'MsgType' => new Assert\NotBlank(),
      // 'Content' => new Assert\NotBlank(),
    );
  }

  public function FormName(){
    return 'POST';
  }

  public function DoData(){
    if($this->Confirm()){
      return array('code' => '11' ,'msg' => 'your input error');
    }
    return $this->dealData();
  }

  public function dealData(){
      $qrcodeinfo = $this->container->get('my.dataSql')->qrcodeinfo($this->getdata['id']);
      if($qrcodeinfo && isset($qrcodeinfo['0'])){
        $this->container->get('my.dataSql')->qrcodeUpdate(array('id' => $this->getdata['id']), array('qrName' => $this->getdata['qrName']));
        if($event = $this->getevents($qrcodeinfo['0']['feedbackid'])){
          $this->container->get('my.dataSql')->updateData(array('menuId' => $qrcodeinfo['0']['feedbackid']), $event, 'wechat_feedbacks');
        }else{
          $this->container->get('my.dataSql')->deleteData(array('menuId' => $qrcodeinfo['0']['feedbackid']), 'wechat_feedbacks');
          $this->container->get('my.dataSql')->qrcodeUpdate(array('id' => $this->getdata['id']), array('feedbackid' => NULL));
        }
        return array('code' => '10', 'msg' => 'update success');
      }
      return array('code' => '9', 'msg' => 'this qrcode not exists');
  }

  public function getevents(){
    $events = array();
    if(!isset($this->getdata['MsgType']))
      return $events;
    if($this->getdata['MsgType'] == 'text'){
      $MsgData = array(
        'Content' => $this->getdata['Content'],
      );
      $events = array(
        'MsgType' => 'text',
        'MsgData' => json_encode($MsgData, JSON_UNESCAPED_UNICODE),
      );
      return $events;
    }
    if($this->getdata['MsgType'] == 'news'){
      $MsgData = array(
        'Articles' => json_decode($this->getdata['newslist'] ,true),
      );
      $events = array(
        'MsgType' => 'news',
        'MsgData' => json_encode($MsgData, JSON_UNESCAPED_UNICODE),
      );
      return $events;
    }
    return $events;
  }
}
