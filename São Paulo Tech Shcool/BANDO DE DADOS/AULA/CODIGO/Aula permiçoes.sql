
-- CRIANDO O USUARIO SUPERVISOR
create user 'supervisor'@'localhost' identified by 'urubu100';

-- DANDO PERMIÇÂO PARA O SUPERVISAOR 
grant select, update, delete, insert on sprint2.*
	to 'supervisor'@'localhost';

-- CONFIRMANDA A PERMISAO 
flush privileges;

-- REMOVENDO PERMICOES DO USUARIO SUPERVISOR
revoke select, update, delete, insert on sprint2.*
	from 'supervisor'@'localhost';


-- CONFIRMANDA A PERMISAO 
flush privileges;


-- ADICIONAR TODAS PERMICOES AO SUPERVISOR
grant all privileges on sprint2.*
	to 'supervisor'@'localhost';
    
    
 -- CONFIRMANDA A PERMISAO 
flush privileges; 