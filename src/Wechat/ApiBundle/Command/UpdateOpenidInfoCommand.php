<?php
namespace Wechat\ApiBundle\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\Config\FileLocator;

class UpdateOpenidInfoCommand extends Command{

  protected function configure(){
    $this->setName('me:update.openidinfo')
        ->setDescription('Update Openid Infomation')
        ->addArgument('start_id',
          InputArgument::OPTIONAL,
          'the start id'
        );
  }

  protected function execute(InputInterface $input, OutputInterface $output)
  {
    $start_id = $input->getArgument('start_id');
    if(!$start_id)
      $start_id = 0;
    $this->UpdateOpenid($start_id);
    $output->writeln('<info>update openid success</info>');
  }

  protected function UpdateOpenid($start = 0){
    $start = intval($start);
    $sql = "SELECT `id`,`openid` FROM `wechat_users` WHERE id>{$start} and headimgurl='' LIMIT 1";
    $db = $this->getApplication()->getKernel()->getContainer()->get('my.dataSql');
    $result = $db->querysql($sql);
    if($result && isset($result['0']) && isset($result['0']['openid']) && $result['0']['openid']){
      $info = $this->getApplication()->getKernel()->getContainer()->get('my.Wechat')->getOpenidInfo($result['0']['openid']);
      if($info && $info['code'] == '10'){
        $this->InsertInfo($result['0']['openid'], $info['info']);
      }else{
        print $result['0']['openid']."\n";
        print_r($info);
        print "______________________";
      }
      $this->UpdateOpenid($result['0']['id']);
    }
  }

  protected function InsertInfo($openid, $change){
    $data = array(
      'nickname' => isset($change['nickname'])?$change['nickname']:'',
      'headimgurl' => isset($change['headimgurl'])?$change['headimgurl']:'',
      'sex' => isset($change['sex'])?$change['sex']:'',
      'country' => isset($change['country'])?$change['country']:'',
      'province' => isset($change['province'])?$change['province']:'',
      'city' => isset($change['city'])?$change['city']:''
    );
    $db = $this->getApplication()->getKernel()->getContainer()->get('my.dataSql');
    $db->updateData(array('openid' => $openid), $data, 'wechat_users');
  }

}
