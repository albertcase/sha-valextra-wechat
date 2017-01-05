<?php
namespace SelfCommand;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\Config\FileLocator;
use Symfony\Component\Filesystem\Filesystem;

class BuildWechatData extends Command{

  protected function configure(){
    $this->setName('me:update.wechatdata')
        ->setDescription('Update Wechat Data. path:web/upload/wechatcache');
  }

  protected function execute(InputInterface $input, OutputInterface $output)
  {
    $fs = new Filesystem();
    $path = dirname(__FILE__).'/../../web/upload/wechatcache';
    if(!$fs->exists($path));
      $fs->mkdir($path);
    $_db = $this->getApplication()->getKernel()->getContainer()->get('my.dataSql');
    $lsa = $_db->searchData(array() ,array(), 'wechat_feedbacks');
    $lsb = $_db->searchData(array() ,array(), 'wechat_events');
    $feedbacks = array();
    $keywords = array();
    $events = array();
    foreach ($lsa as $value) {
      if($value['menuId'])
        $feedbacks[$value['menuId']] = array(
          'menuId' => $value['menuId'],
          'MsgType' => $value['MsgType'],
          'MsgData' => $value['MsgData'],
        );
    }
    // print_r($list);
    ob_start();
    print "<?php\nreturn ";
    var_export($feedbacks);
    $string = ob_get_contents();
    ob_end_clean();
    $fs->dumpFile($path."/feedbacks.php", $string.";");

    foreach ($lsb as $value) {
      if($value['getContent'])
        $keywords[$value['getContent']] = array(
          'menuId' => $value['menuId'],
          'MsgType' => $value['MsgType']
        );
    }
    ob_start();
    print "<?php\nreturn ";
    var_export($keywords);
    $string = ob_get_contents();
    ob_end_clean();
    $fs->dumpFile($path."/keywords.php", $string.";");

    foreach ($lsb as $value) {
      if($value['getEventKey'])
        $events[$value['getEventKey']] = array(
          'menuId' => $value['menuId'],
          'MsgType' => $value['MsgType']
        );
      if($value['getEvent'] && ($value['getEvent'] == 'subscribe' || $value['getEvent'] == 'defaultback'))
        $events[$value['getEvent']] = array(
          'menuId' => $value['menuId'],
          'MsgType' => $value['MsgType']
        );
    }
    ob_start();
    print "<?php\nreturn ";
    var_export($events);
    $string = ob_get_contents();
    ob_end_clean();
    $fs->dumpFile($path."/events.php", $string.";");

    $lsc = $_db->searchData(array() ,array(), 'wechat_qrcode');
    $qrcode = array();
    foreach ($lsc as $value) {
      if($value['qrTicket'])
        $qrcode[$value['qrTicket']] = array(
          'feedbackid' => $value['feedbackid']
        );
    }
    ob_start();
    print "<?php\nreturn ";
    var_export($qrcode);
    $string = ob_get_contents();
    ob_end_clean();
    $fs->dumpFile($path."/qrcodes.php", $string.";");
// lbs
    $lsd = $_db->searchData(array() ,array(), 'stores');
    $stores = array();
      if($lsd)
        $stores = $lsd;
    ob_start();
    print "<?php\nreturn ";
    var_export($stores);
    $string = ob_get_contents();
    ob_end_clean();
    $fs->dumpFile($path."/stores.php", $string.";");
// jssdkids
    $jssdk = $this->getApplication()->getKernel()->getContainer()->getParameter('wechat_jssdkids');
    $stores = array();
      if($jssdk)
        $stores = $jssdk;
    ob_start();
    print "<?php\nreturn ";
    var_export($stores);
    $string = ob_get_contents();
    ob_end_clean();
    $fs->dumpFile($path."/jssdkids.php", $string.";");
    $output->writeln('<info>update wechat data success, Path:web/upload/wechatcache</info>');
  }

}
