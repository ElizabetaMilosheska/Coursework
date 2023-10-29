*** Settings ***
Library           DatabaseLibrary

*** Variables ***
${dbname}         literatura_mk
${dbuser}         root
${dbpasswd}       ${EMPTY}
${dbhost}         127.0.0.1
${dbport}         3306
@{queryResults}

*** Test Cases ***
tc_insert_books
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _insert_books('Sugar and Salt','Susan Wiggs',2022,699,362,2);

tc_insert_genre
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _insert_genre ('humor');

tc_select_books
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _select_books();

tc_select_genre
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _select_genre();

tc_delete_books
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _delete_books();

tc_delete_genre
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _delete_genre(8);

tc_update_books
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _update_books('Sugar and Salt','Susan Wiggs',2022,699,362,2,5);

tc_update_genre
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _update_genre('historical fiction',1);
