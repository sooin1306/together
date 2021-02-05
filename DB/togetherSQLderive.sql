select * from members;

-- 회원가입 sql
iNSERT INTO members(member_id,member_pwd,NAME,BIRTHDAY,NICKNAME,PHONE_NUM,BALANCE,PROFILE_IMG,STATUS_MESSAGE,STATUS)
values ('aran','aran','박아란','1994-03-15','박아란','01071011416',0,'aran\pro.img','귀여워 온수인',1);

-- 로그인 sql
select member_id, member_pwd from members where member_id = member_id and mebmer_pwd = member_pwd;
select member_id, member_pwd from members where member_id = 'youngyoung01' and member_pwd = 'kty990122';

-- 아이디 찾기
select member_id from members where name = name and phone_num = phone_num and birthday=birthday;
select member_id from members where name = '영영이' and phone_num = '01020612496' and birthday = '1999-01-22';

-- 비밀번호 찾기
select member_id from members where member_id=member_id  and name = name and phone_num= phone_num;
select member_id from members where member_id = 'youngyoung01' and name = '영영이' and phone_num = '01020612496';

--마이페이지
--마이페이지에 많은 내용을 담고있어서 view가 필요하다고 판단.
create or replace view all_of_together_vw as
select t.together_no,sign_t.member_id, t_info.together_name, t_info.together_img,t_info.application_fee, t_info.together_intro, t.sum, t.people, t.start_date, t.end_date, sign_t.total_achv, sign_t.achv , t.status from 
together_info t_info
join together t on t.together_info_no = t_info.together_info_no
join sign_together sign_t on sign_t.together_no = t.together_no ;
-- view를 활용해서 이름으로 마이페이지 구성
select member_id, together_name, together_img, sum, people, start_date, end_date, total_achv, achv, status from  all_of_together_vw where member_id='youngyoung';

select *from sign_together;

select* from  members where member_id = 'youngyoung01';
-- 회원정보 수정

update members set  member_pwd= member_pwd, name=name, birthday = birthday, nickname = nickname, profile_img=profile_img,status_message=status_message where member_id = 'youngyoung01';
update members set  member_pwd= 'kty', name ='영영이', birthday='1999-01-22',nickname='영영',profile_img='default', status_message='오늘 다 끝낸다!' where member_id = 'youngyoung01';

-- 인증모아보기 첫 화면 ( 최근 업로드한 날짜기준으로 select )
select* from photo_shoot order by upload_date desc;

-- 인증모아보기에서 회원 검색
select * from members where member_id like '%검색할 아이디%';
select * from members where member_id like '%youngyoung%';

select* from together_info;

-- 인증모아보기에서 챌린지 이름으로 검색
-- 인증모아보기에서 사용할 view 생성
create or replace view photo_shoot_search_vw as
select m.profile_img, m.nickname, t_info.together_name, c.category_name,ps.photo_good,ps.impression,ps.like_cnt, ps.upload_date from together_info t_info
join category c on t_info.category_no = c.category_no
join together t on t_info.together_info_no = t.together_info_no
join photo_shoot ps on ps.together_no = t.together_no
join members m on m.member_id = ps.member_id where ps.status =1 and t.status in(1,2);


-- 인증모아보기에서 카테고리로 검색 ( 정확하게 입력)
select * from photo_shoot_search_vw where category_name = '카테고리 이름 입력';
select * from photo_shoot_search_vw where category_name = 'health';

-- 인증모아보기에서 챌린지 이름으로 검색
select * from photo_shoot_search_vw where together_name like '%챌린지 이름%';
select * from photo_shoot_search_vw where together_name like '%공부%';

-- 챌린지 상세 페이지
select * from together_info where together_info_no = 'together_info_no';
select * from together_info where together_info_no =100;



-- 챌린지 신청하기
insert into sign_together values(시퀀스, together_no, member_id, achv, 0 , 1);
insert into sign_together values(4, '100-1','youngyoung01', 6,0,1);


-- sign_together추가하면 챌린지 사람숫자와 참가비가 올라가는 trigger
create or replace trigger trg_together_people_plus
after insert on sign_together
for each row
begin
update together set people = people+1 where together_no = :new.together_no;
update together set sum = sum+10000 where together_no = :new.together_no;
end;

select * from sign_together;
-- sign_together삭제 하면 발생 ( 신청했다가 신청을 취소한 경우 발생)
create or replace trigger trg_together_people_minus
after delete on sign_together
for each row
begin
update together set people = people-1 where together_no = :old.together_no;
update together set sum = sum-10000 where together_no = :old.together_no;
end;

-- 챌린지 신청 취소하기
delete from sign_together where together_sign = 4;


-- 좋아요 
insert into like_photo values(아이디, '인증샷 번호');
insert into like_photo values('youngyoung01',1); 


-- 인증샷 좋아요에 대한 trigger
create or replace trigger trg_photo_shoot_like 
after insert on like_photo
for each row
begin
update photo_shoot set like_cnt = like_cnt + 1 where  photo_no = :new.photo_no;
end;

-- 인증샷 좋아요 취소에 대한 trigger
create or replace trigger trg_photo_shoot_like_cancel
after delete on like_photo
for each row
begin
update photo_shoot set like_cnt = like_cnt -1 where photo_no = :old.photo_no;
end;

-- 좋아요 취소하기
select * from photo_shoot;
delete from like_photo where photo_no='인증샷 번호';
delete from like_photo where photo_no = 1;


--인증샷 업로드하면 sign_together에 진행률 +1 trigger
create or replace trigger trg_sign_together_achv
after insert on photo_shoot
for each row
begin
update sign_together set achv = achv+1 where member_id = :new.member_id and together_no = :new.together_no;
end;

--인증샷 업로드
insert into photo_shoot values(6, 'soyoung','100-1', '이미지링크', '첫날에는 힘들었지만 오늘은 저보다는 한결 가벼워져서 1만보보다 조금더 걸었다.', 0,1,sysdate);
select*from photo_shoot;
select*from sign_together;

--인증샷 삭제로 인해서 진행률 감소 trigger
create or replace trigger trg_sign_together_achv_minus
after delete on photo_shoot
for each row
begin 
update sign_together set achv = achv-1 where member_id = :old.member_id and together_no = :old.together_no;
end;
-- 인증샷 삭제
delete from photo_shoot where photo_no =  번호;
delete from photo_shoot where photo_no =  6;

-- 메인 ( 내가 참여한 챌린지 )
select member_id, together_name, together_img, sum, people, start_date, end_date, total_achv, achv, status from all_of_together_vw where member_id='youngyoung';
-- 메인 ( 임박한 챌린지 )
select t_info.together_img, t_info.together_name, t.start_date from together t
join together_info t_info on t_info.together_info_no = t.together_info_no
where sysdate< t.start_date order by t.start_date asc;

--메인 ( 이번달 챌린지 킹)
select profile_img, nickname,photo_good,impression,upload_date from photo_shoot_search_vw 
where extract(month from upload_date) = 1;


select extract (month from sysdate) from dual;

select* from all_of_together_vw;
select * from together_info;
-- 충전하기
update members set balance = balance+10000 where member_id='youngyoung';
select* from sign_together;

-- 돈 배분에 대한 프로시저 생성
-- 실패한 사람
select max(rownum)as fail from sign_together where together_no = together_no and total_achv <> achv;
 -- cnt :=(fail* 10000)/ (peole-fail); -> n분의 한 가격
update members set balance = balance+cnt where member_id = 'youngyoung01';

select* from together_info;


