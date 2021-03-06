
create table accounts(
	id integer primary key,
	name varchar(50) not null,
	credit numeric not null
);

insert into accounts(id, name, credit) values (1, 'Jake Hill', 1000);
insert into accounts(id, name, credit) values (2, 'Zach Diamond', 1000);
insert into accounts(id, name, credit) values (3, 'Conan Grey', 1000);

begin;
	savepoint T0;
	update accounts set credit = credit - 500 where id = 1;
	update accounts set credit = credit + 500 where id = 3;
	savepoint T1;
	update accounts set credit = credit - 700 where id = 2;
	update accounts set credit = credit + 700 where id = 1;
	savepoint T2;
	update accounts set credit = credit - 100 where id = 2;
	update accounts set credit = credit + 100 where id = 3;
	select id, credit from accounts; 
	rollback to T0;
commit;
