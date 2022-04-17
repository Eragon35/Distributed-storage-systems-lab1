create or replace function antipin_task(sch varchar default '') returns void as
$$
    begin

    if sch = ''
    then raise exception 'Уважаемый пользователь, Вы не правильно вызвали функцию - пример вызова  psql -h pg -d studs -f script3.sql -v v1="''dima''";';
    end if;

    declare
        count int := 1;
        null_counter int;
        -- get list of tables in schema
        tables cursor for (select tablename from pg_catalog.pg_tables where schemaname = sch);
    begin
        if (select count(*) from information_schema.tables where table_schema = sch) < 1
        then raise exception 'Таблиц нет в данной схеме';
        end if;

        raise notice 'Схема: %',sch;
        raise notice '    ведущие пробелы';
        raise notice 'No. Имя таблицы';
        raise notice '--- -------------------------------';

        for row in tables
            loop
                execute format('SELECT * from %I
                            except
                            SELECT * from %I where %I is not null',
                               row.tablename, row.tablename, row.tablename)
                    into null_counter;
                if null_counter > 0
                then
                    raise notice '% %', lpad(count::text, 3, ' '), row.tablename;
                    count = count + 1;
                end if;
            end loop;
    end;
end;
$$ language plpgsql;
