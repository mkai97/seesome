/*
 * @Author: your name
 * @Date: 2020-10-25 14:08:24
 * @LastEditTime: 2020-10-30 10:37:42
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\LivePage\index_page.dart
 */
import 'package:flutter/material.dart';
import 'package:seesome/mixins/index.dart';
import 'package:seesome/views/LivePage/components/liveCard.dart';

class IndexPage extends StatefulWidget {
  static const String routeName = '/index';

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var alldata = [
    {
      'channelName': 'CCTV 1',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv1',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 2',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv2',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 3',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv3',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 4',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv4',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 5',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv5',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 6',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv6',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 7',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv7',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 8',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv8',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 9',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv9',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 10',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv10',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 11',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv11',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 12',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv12',
      "Status": '正常',
      "Id": '0'
    },    {
      'channelName': 'CCTV 13',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv13',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 14',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv14',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': 'CCTV 15',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cctv15',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '安徽卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/ahtv',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '重庆卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/cqtv',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '东方卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/dftv',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '东南卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/dntv',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '广东卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/gdtv',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '广西卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/gxtv',
      "Status": '正常',
      "Id": '0'
    },
{
      'channelName': '甘肃卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/gstv',
      "Status": '正常',
      "Id": '0'
    },
    {
      'channelName': '贵州卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/gztv',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '湖北卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/hbtv',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '湖南卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/hunantv',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '河北卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/hebtv',
      "Status": '正常',
      "Id": '0'
    },
        {
      'channelName': '河南卫视',
      "sourceHttp": 'rtmp://58.200.131.2:1935/livetv/hntv',
      "Status": '正常',
      "Id": '0'
    },
    // {
    //   'channelName': '直播',
    //   "sourceHttp": 'rtmp://pull.2dian.com/AAA/text?auth_key=1603966803-0-0-052947eef1e45e6f2f5defcbf4f06520',
    //   "Status": '正常',
    //   "Id": '0'
    // },
    

  ];

  ScrollController controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Navigation(
      automaticallyImplyLeading: true,
      title: '列表',
      backgroundColor: Colors.blue[200],
      body: Container(
        child: SingleChildScrollView(
          controller: controller,
          child: Container(
            child: Column(
                children: alldata.asMap().keys.map((index) {
              return Center(
                child: LiveCard(
                  alldata: alldata[index],
                ),
              );
            }).toList()),
          ),
        ),
      ),
    );
  }
}
