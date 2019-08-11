--view �����

-- 관리자 게시글전체 조회
CREATE OR REPLACE VIEW post_All
as
select p.* , b.BOARDNAME,b.USAGE "bUSAGE",b.TYPE_CODE, b.COMMENTAGE,
    b.UPAGE ,b.UPNUMAGE,b.UPSIZEAGE,bk.TYPE,bk.USAGE as BKUSAGE
  , m.MEMBERID,m.MEMBERNAME ,mg.ADMINID
from post p
join board b
on p.board_code=b.BOARD_CODE1
join board_kind bk
on bk.TYPE_CODE =b.TYPE_CODE
left JOIN MEMBER m
on p.MEMBER_CODE = m.MEMBER_CODE 
join manager mg 
on p.admin_code=mg.ADMIN_CODE
;





select *   from   ( 
      select A.*, rownum as RNUM        from       (    
             select notify_Code, notifytitle, notifycontent, readcount,notifydate,     
              (sysdate-notifydate)*24 as new_Img_Term     from notice    
              order by notify_Code desc     
	) A  
)   
where RNUM>?     and RNUM<=? + ?;

--결제완료된 채용공고 메인화면에 광고
CREATE OR REPLACE VIEW vvipMain
as
select m.company_code,m.member_code, m.membername, p.progress, p.payend_date, p.service_code, p.paydate,(sysdate-p.paydate) as cancellimit
from member m join payment p
on p.MEMBER_CODE = m.MEMBER_CODE
and p.progress='결제완료'
and paystart_date>=sysdate and payend_Date>=sysdate;

CREATE OR REPLACE VIEW companyJobOpen 
as
select c.company_Code,c.image, c.companyname, j.jobtitle, j.end_date, j.jobopening
from company c join jobopening j 
on j.COMPANY_CODE = c.COMPANY_CODE
where end_date>=sysdate;



--관리자 이력서 조회 view
CREATE OR REPLACE VIEW resume_view AS
select r.*, 
    m.ADDRESS, m.ADDRESSDETAIL, m.MEMBERGENDER, m.MEMBERID, m.MEMBERNAME,
     NVL(TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(BIRTH, 1, 4), 'YYYY'))/12), 0) AS BIRTH,
    h.BTYPE_CODE3, h.THIRD_CODE, h.LOCAL_CODE,
    c.CHARGEWORK, c.COMPANYNAME, c.JOBGRADE, c.WORKCHECK,
    to_char(to_date(c.workterm2),'yyyy')-to_char(to_date(c.workterm),'yyyy') as WORKTERM,
    e.DEGREE, e.GRADUATETYPE, e.MAJOR, e.SCHOOLNAME, e.SCHOOLLOCAL
from resume r 
join member m on m.MEMBER_CODE = r.MEMBER_CODE
left join hope_working h on r.HOPEWORK_CODE=h.HOPEWORK_CODE
left join career c on r.DV_CODE = c.DV_CODE
left join education e on e.ACADEMIC_CODE = r.ACADEMIC_CODE
                          