alter table accounts4 add bankName varchar(50);

update accounts4 set bankName = 'SpearBank' where id = 1 or id = 3;
update accounts4 set bankName = 'Tinkoff' where id = 2;

insert into accounts4(id, name, credit) values(4, 'Fees', 0);

begin;
  savepoint T0;
  update accounts4 set credit = credit - 500 where id = 1;
  update accounts4 set credit = credit + 500 where id = 3;
  savepoint T1;
  update accounts4 set credit = credit - 700 where id = 2;
  update accounts4 set credit = credit + 670 where id = 1;
  update accounts4 set credit = credit + 30 where id = 4;
  savepoint T2;
  update accounts4 set credit = credit - 100 where id = 2;
  update accounts4 set credit = credit + 70 where id = 3;
  update accounts4 set credit = credit + 30 where id = 4;
commit;

select id, credit from accounts4;
