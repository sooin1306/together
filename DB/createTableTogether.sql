create table members(
    member_id varchar2(20),
    member_pwd varchar2(30) not null,
    name varchar2(15) not null,
    birthday date,
    nickname varchar2(30) not  null,
    phone_num varchar2(11) not null,
    balance number(7),
    profile_img varchar(100),
    status_message varchar2(100),
    status number(1),
    constraint members_pk primary key (member_id)
);

create table category(
    category_no number(2),
    category_name varchar2(15),
    constraint category_pk primary key(category_no)
);

create table together_info(
    together_info_no number(4),
    category_no number(2),
    member_id varchar2(20),
    together_name varchar2(100) not null,
    confirm varchar2(2000) not null,
    confirm_cnt varchar2(30) not null,
    application_fee varchar2(30) not null,
    together_img varchar2(100) not null,
    together_intro varchar2(2000) not null,
    upload_date date default sysdate not null,
    status number(1) default 1,
    constraint together_info_pk primary key (together_info_no),
    constraint category_no_fk foreign key(category_no) references category(category_no),
    constraint member_id_fk foreign key (member_id) references members(member_id)
);

create table together(
    together_no varchar2(8),
    together_info_no number(4),
    version number(3),
    sum number(8),
    people number(4) default 1,
    start_date date not null,
    end_date date not null,
    status number(1) default 1,
    constraint together_no_pk primary key (together_no),
    constraint together_info_no_fk foreign key (together_info_no) references together_info(together_info_no)
);

create table sign_together(
    together_sign number(5),
    together_no varchar2(8),
    member_id varchar2(20),
    total_achv number(3),
    achv number(3),
    status number(1),
    constraint together_sign_pk primary key (together_sign  ),
    constraint sign_together_fk foreign key (together_no) references together(together_no),
    constraint sign_member_fk foreign key (member_id) references members(member_id)
);

create table photo_shoot(
    photo_no number(4),
    member_id varchar2(20),
    together_no varchar2(8),
    photo_good varchar2(100) not null,
    impression varchar2(100) not null,
    like_cnt number(4) default 0,
    status number(1) default 1,
    constraint photo_pk primary key (photo_no),
    constraint photo_member_fk foreign key (member_id) references members(member_id),
    constraint photo_together_fk foreign key(together_no) references together (together_no)
    
);

create table like_photo(
    member_id varchar2(20),
    photo_no number(4),
    constraint like_member_fk foreign key (member_id) references members(member_id),
    constraint like_photo_fk foreign key (photo_no) references photo_shoot(photo_no)
);