<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
a:link {
    text-decoration: none;
    color: #000000;
}
      #sidebar-menu,
      #sidebar-menu ul,
      #sidebar-menu li,
      #sidebar-menu a {
          border: 0;
          font-weight: normal;
          line-height: 1;
          list-style: none;
          margin: 0;
          padding: 0;
          position: relative;
          text-decoration: none;
      }

      #sidebar-menu>ul>li a {
          color: #fff;
          font-size: 13px;
          display: block;
          padding: 14px 0px;
          margin: 0px 0px 0px 8px;
          border-top: 1px solid rgba(0, 0, 0, 0.1);
          border-bottom: 1px solid rgba(255, 255, 255, 0.05);
          width: 28px;
          cursor: pointer;
      }

      #sidebar-menu .fas {
          padding-left: 6px;
      }

      /* 사이드 메뉴 */

      .left_sub_menu {
          position: fixed;
          top: 40px;
          width: 200px;
          z-index: 10;
          /* left: 45px; */
          background: #EBEDF5;
          border-right: 1px solid rgba(0, 0, 0, 0.07);
          bottom: 50px;
          height: 100%;
          margin-bottom: -70px;
          margin-top: 0px;
          padding-bottom: 0px;
          box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
          color: black;
      }

      .sub_menu {
          margin-top: 30px;
      }

      .left_sub_menu>.sub_menu li:hover {
          color: #2C3E50;
          /* background-color: #f5f5f5; */
      }

      .left_sub_menu>.sub_menu li {
          color: #2C3E50;
          font-size: 13px;
          font-weight: 600;
          padding: 10px 0px 10px 24px;
          border-bottom: 1px solid #ffffff;
      }

      .sub_menu>h2 {
          padding-bottom: 4px;
          border-bottom: 3px solid #797979;
          margin-top: 15px;
          font-size: 17px;
          font-weight: 600;
          margin-left: 10px;
          margin-right: 10px;
          font-family: 'NotoKrB';
          line-height: 35px;
      }

      .sub_menu .fas {
      	color: #000000;
          font-size: 15px;
          line-height: 20px;
          float: right;
          margin-right: 20px;
      }

      .sub_menu>.big_menu>.small_menu li {
          font-size: 13px;
          font-weight: 600;
          background-color: #F4F4F4;
          border-bottom: 1px solid #fff;
          padding-left: 50px;
          padding-top: 8px;
      }

      .big_menu {
          cursor: pointer;
      }

      ul {
          padding-inline-start: 0px;
      }

      a {
          color: #000000;
          text-decoration: none;
          background-color: transparent;
      }

      ul {
          list-style: none;
      }

      ol,
      ul {
          margin-top: 0;
          margin-bottom: 10px;
      }
</style>
<script type="text/javascript">
$(function () {
    // 왼쪽메뉴 드롭다운
    $(".sub_menu ul.big_menu").click(function () {
        $("ul", this).slideToggle(300);
    });
});
</script>

<div class="topbar" style="position: absolute; top:0;">
    <div class="left_sub_menu">
        <div class="sub_menu">
            <ul class="big_menu">
                <li>사용자 관리 <i class="arrow fas fa-angle-right">▼</i></li>
                <ul class="small_menu">
                    <a href="/admin_userinfo_list"><li>사용자 관리</li></a>
                    <a href="/admin_org_list"><li>기관 관리</li></a>
                </ul>
            </ul>
            <ul class="big_menu">
                <li>운영자 관리 <i class="arrow fas fa-angle-right">▼</i></li>
                <ul class="small_menu">
                    <a href="/admin_notice_list"><li>공지 사항</li></a>
                </ul>
            </ul>
            <ul class="big_menu">
                <li>시스템 관리 <i class="arrow fas fa-angle-right">▼</i></li>
                <ul class="small_menu">
                    <a href="/system_log_list?year_month=${year_month}"><li>접속 통계</li></a>
                    <a href="/access_log_list"><li>접속 이력</li></a>
                    <a href="/login_log_list"><li>로그인 이력</li></a>
                </ul>
            </ul>
        </div>
    </div>
</div>
