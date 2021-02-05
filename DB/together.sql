create or replace procedure give_money (
    -- 총 참가금
    people number,
    together_no varchar2,
    id varchar
    
)
is 
    cnt number :=0;    
begin
    -- 100퍼센트 완료하지 못한 사람
    select max(rownum)as fail from sign_together where together_no = together_no and total_achv <> achv
    
    cnt :=(fail* 10000)/ (peole-fail);
    dbms_output.put_line('test' = ' || cnt);
end;



select max(rownum) as fail from sign_together where together_no = '100-1' and total_achv <> achv;

select * from sign_together;

insert into sign_together values(4, '100-1', 'youngyoung01', 6, 6,1);
insert into sign_together values(5, '100-1', 'aran', 6,6,1);

create or replace procedure give_money
(
    total_achv in number,
    achv in number,
    together_sign_no number,
    id varchar(20)
)
is
begin
 if total_achv = achv then
    update sign_together set status = 2 where together_sign = together_sign_no;
    update 
end if;
end;

select max(rownum) from sign_together where together_no = '100-1' group by together_no;
select total_achv, achv from sign_together where together_no = '100-1'
declar 
begin 
if total_achv <> achv then
    ;