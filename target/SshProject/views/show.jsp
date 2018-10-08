<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2018/9/28
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="../js/jquery-3.3.1.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>分页显示</title>
    <script>
        /** * 显示每页开始数据到结束数据编号 * @param currentPage 当前页数（第一次查询最好是【1】） */
        var fileData;
        function showDataNumber(currentPage){
            var endNumber =currentPage * $("#selectPage").val();
            $("#endPageNumber").text(" "+endNumber);
            var startNumber = (currentPage-1)*$("#selectPage").val()+1;
            $("#startPageNumber").text(" "+startNumber);
            if(fileData == null ){ $("#taTalDataNumber").text(" "+0);
            }else{
                $("#taTalDataNumber").text(" "+fileData.length);
            }
        }
        function htmlData(fileDataS) {
            $(".main").html("");
            if (fileDataS == null) {
                $(".main").html("");
                $('.M-box').hide();
            } else {
                $('.M-box').show();
                $.each(fileDataS, function (index, file) {
                    var html = '<div class="gis_downloadmian"><span class="gis_word">' + file.fileName + '</span>' +
                        ' 所属项目：' + file.projectId +
                        ' 下载次数：【下载<a class="gis_color" id="down' + file.id + '">' + file.downloadNumber + '</a>次】' +
                        ' 所属文件库：建设批复文件' +
                        ' 项目年份：2016' +
                        ' 更新时间：' + dateHandle(file.createtime) +
                        '<a onclick="downloadFile(' + file.id + ')" class="gis_downbtn" >下载</a></div>'
                    $(".main").append(html);
                });
            }
        }
        function page() {
            if (typeof (fileData) != "undefined" && fileData != null) {
                var totalData = fileData.length;
                var showData = $("#selectPage").val();
                if (showData > totalData) {
                    showData = totalData;
                }
                $('.M-box').pagination({
                    totalData: totalData,
                    showData: showData,
                    coping: true,
                    callback: function (index) {
                        //改变显示开始和结束数据编号
                        showDataNumber(index.getCurrent());
                        getPageData(index.getCurrent());
                    }
                });
            }
        }
        function select(){
            $("#endPageNumber").text(" "+$("#selectPage").val())
            initSelect();
        }
        /** * 初始化选择每页显示数据 */
        function initSelect() {
            showDataNumber(1);
            getPageData(1);
            page();
        }

        $.ajax({
            url: '',
            type: 'POST',
            data: '',
            dataType: "json",
            success: function (data) {
                fileData = data;
                console.log(fileData);
                showDataNumber(1);
                //初始化每页到开始到结束数据编号
                getPageData(1);
                //初始化第一页的数据
                page();
                //初始化分页
            }
        });
    </script>
</head>
<body>
<%--显示查询数据div--%>
<div class="main"></div>
<%--分页div--%>
<div id="page">
    <div style="float: left;width: 50%;margin: 0 0 10px 25px">
        显示第 <span id= "startPageNumber"> 1</span> 到第<span id= "endPageNumber"> 10</span> 条记录，总共 <span id="taTalDataNumber"></span> 条记录
        每页显示 <select id ="selectPage" onchange="select()" style="width: 9%">
        <option value="3" selected>3</option>
        <option value="6">6</option>
        <option value="14">14</option>
        <option value="100">100</option>
    </select> 条记录
    </div>
    <%--分页控件div--%>
    <div class="M-box" style="float: right"></div> </div>
</body>
</html>


