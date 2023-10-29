*** Settings ***
Library           DatabaseLibrary

*** Variables ***
${dbname}         onlineshop
${dbuser}         root
${dbpasswd}       ${EMPTY}
${dbhost}         127.0.0.1
${dbport}         3306
@{queryResults}

*** Test Cases ***
tc_insert_categories
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _insert_categories('gaming');

tc_insert_products
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _insert_products('Mouse',649,25,6);

tc_select_categories
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _select_categories();

tc_select_products
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _select_products();

tc_update_products
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _update_products('Samsung',350,5,3);

tc_update_categories
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _update_categories('gaming',3);

tc_delete_products
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _delete_products(2);

tc_delete_categories
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Execute Sql String    CALL _delete_categories(5);
        S
