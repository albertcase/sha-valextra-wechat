<?php

namespace Wechat\ApiBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\Cookie;

class OauthController extends Controller
{
  public function oauth2Action(Request $request){
    $callback = urldecode($request->query->get('callback'));
    $oauths = $request->query->get('oauths', 1);
    $code = $request->query->get('code');
    $openid = $request->cookies->get('woauths');
    if(intval($oauths) > 1){
        $functions = $this->container->get('my.functions');
        if($functions->updataWechatUser($code) || $functions->openidDecode($openid)){
          return $this->redirect($callback);
        }
        if(intval($oauths) > 4){ //the more oauth error times;
          return  new Response('oauth error');
        }
    }
    $oauths = intval($oauths) + 1;
    $goto = $this->getRequest()->getSchemeAndHttpHost().$this->getRequest()->getBaseUrl().$this->getRequest()->getPathInfo().'?oauths='.$oauths.'&callback='.urlencode($callback);
    return $this->redirect($this->container->get('my.Wechat')->getoauth2url(urlencode($goto)));
  }

  public function vendorAction($fid, Request $request){
    $filename = "upload/oauth/".$fid.".php";
    $fs = new Filesystem();
    if(!$fs->exists($filename))
      return $respose->setContent("this oauth not exists")->send();
    $oinfo = require_once($filename);
    $redirect_url = isset($oinfo['redirect_url'])?$oinfo['redirect_url']:'';
    $callback_url = isset($oinfo['callback_url'])?$oinfo['callback_url']:'';
    $scope = isset($oinfo['scope'])?$oinfo['scope']:'';
    $oauths = $request->query->get('oauths', 1);
    $code = $request->query->get('code');
    if(intval($oauths) > 1){
        $functions = $this->container->get('my.functions');
        if($openid = $functions->vendorWechatUser($code, $callback_url)){
          $rct_rul = explode("?", $redirect_url);
          return $this->redirect($rct_rul[0]."?openid=".$openid.(isset($rct_rul[1])?('&'.$rct_rul[1]):''));
        }
        if(intval($oauths) > 4){ //the more oauth error times;
          return  new Response('oauth error');
        }
    }
    $oauths = intval($oauths) + 1;
    $goto = $this->getRequest()->getSchemeAndHttpHost().$this->getRequest()->getBaseUrl().$this->getRequest()->getPathInfo().'?oauths='.$oauths;
    return $this->redirect($this->container->get('my.Wechat')->getoauth2url(urlencode($goto), $scope));
  }

  public function addAction()
  {
    $form = $this->container->get('form.oauthadd');
    $data = $form->DoData();
    return  new Response(json_encode($data, JSON_UNESCAPED_UNICODE));
  }

  public function listAction()
  {
    $form = $this->container->get('form.oauthlist');
    $data = $form->DoData();
    return  new Response(json_encode($data, JSON_UNESCAPED_UNICODE));
  }

  public function infoAction()
  {
    $form = $this->container->get('form.oauthinfo');
    $data = $form->DoData();
    return  new Response(json_encode($data, JSON_UNESCAPED_UNICODE));
  }

  public function updateAction()
  {
    $form = $this->container->get('form.oauthupdate');
    $data = $form->DoData();
    return  new Response(json_encode($data, JSON_UNESCAPED_UNICODE));
  }

  public function deleteAction()
  {
    $form = $this->container->get('form.oauthdelete');
    $data = $form->DoData();
    return  new Response(json_encode($data, JSON_UNESCAPED_UNICODE));
  }
}
