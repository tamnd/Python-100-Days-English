"""
-- Create a database named `address`
create database address default charset utf8;

-- Switch to the `address` database
use address;

-- Create the contact table `tb_contacter`
create table tb_contacter
(
conid int auto_increment comment 'id',
conname varchar(31) not null comment 'name',
contel varchar(15) default '' comment 'telephone',
conemail varchar(255) default'' comment 'email',
primary key (conid)
);
"""
import pymysql

INSERT_CONTACTER = """
insert into tb_contacter (conname, contel, conemail) 
values (%s, %s, %s)
"""
DELETE_CONTACTER = """
delete from tb_contacter where conid=%s
"""
UPDATE_CONTACTER = """
update tb_contacter set conname=%s, contel=%s, conemail=%s 
where conid=%s
"""
SELECT_CONTACTERS = """
select conid as id, conname as name, contel as tel, conemail as email 
from tb_contacter limit %s offset %s
"""
SELECT_CONTACTERS_BY_NAME = """
select conid as id, conname as name, contel as tel, conemail as email 
from tb_contacter where conname like %s
"""
COUNT_CONTACTERS = """
select count(conid) as total from tb_contacter
"""


class Contacter(object):

    def __init__(self, id, name, tel, email):
        self.id = id
        self.name = name
        self.tel = tel
        self.email = email


def input_contacter_info():
    name = input('Name: ')
    tel = input('Mobile: ')
    email = input('Email: ')
    return name, tel, email


def add_new_contacter(con):
    name, tel, email = input_contacter_info()
    try:
        with con.cursor() as cursor:
            if cursor.execute(INSERT_CONTACTER,
                              (name, tel, email)) == 1:
                print('Contact added successfully!')
    except pymysql.MySQLError as err:
        print(err)
        print('Failed to add contact!')


def delete_contacter(con, contacter):
    try:
        with con.cursor() as cursor:
            if cursor.execute(DELETE_CONTACTER, (contacter.id, )) == 1:
                print('Contact deleted!')
    except pymysql.MySQLError as err:
        print(err)
        print('Failed to delete contact!')


def edit_contacter_info(con, contacter):
    name, tel, email = input_contacter_info()
    contacter.name = name or contacter.name
    contacter.tel = tel or contacter.tel
    contacter.email = email or contacter.email
    try:
        with con.cursor() as cursor:
            if cursor.execute(UPDATE_CONTACTER,
                              (contacter.name, contacter.tel,
                               contacter.email, contacter.id)) == 1:
                print('Contact updated!')
    except pymysql.MySQLError as err:
        print(err)
        print('Failed to update contact!')


def show_contacter_detail(con, contacter):
    print('Name:', contacter.name)
    print('Mobile:', contacter.tel)
    print('Email:', contacter.email)
    choice = input('Edit this contact? (yes|no) ')
    if choice == 'yes':
        edit_contacter_info(con, contacter)
    else:
        choice = input('Delete this contact? (yes|no) ')
        if choice == 'yes':
            delete_contacter(con, contacter)


def show_search_result(con, cursor):
    contacters_list = []
    for index, row in enumerate(cursor.fetchall()):
        contacter = Contacter(**row)
        contacters_list.append(contacter)
        print('[%d]: %s' % (index, contacter.name))
    if len(contacters_list) > 0:
        choice = input('View contact details? (yes|no) ')
        if choice.lower() == 'yes':
            index = int(input('Enter the index: '))
            if 0 <= index < cursor.rowcount:
                show_contacter_detail(con, contacters_list[index])


def find_all_contacters(con):
    page, size = 1, 5
    try:
        with con.cursor() as cursor:
            cursor.execute(COUNT_CONTACTERS)
            total = cursor.fetchone()['total']
            while True:
                cursor.execute(SELECT_CONTACTERS,
                               (size, (page - 1) * size))
                show_search_result(con, cursor)
                if page * size < total:
                    choice = input('Continue to the next page? (yes|no) ')
                    if choice.lower() == 'yes':
                        page += 1
                    else:
                        break
                else:
                    print('No more pages.')
                    break
    except pymysql.MySQLError as err:
        print(err)


def find_contacters_by_name(con):
    name = input('Contact name: ')
    try:
        with con.cursor() as cursor:
            cursor.execute(SELECT_CONTACTERS_BY_NAME,
                           ('%' + name + '%', ))
            show_search_result(con, cursor)
    except pymysql.MySQLError as err:
        print(err)


def find_contacters(con):
    while True:
        print('1. View all contacts')
        print('2. Search contacts')
        print('3. Exit search')
        choice = int(input('Enter your choice: '))
        if choice == 1:
            find_all_contacters(con)
        elif choice == 2:
            find_contacters_by_name(con)
        elif choice == 3:
            break


def main():
    con = pymysql.connect(host='1.2.3.4', port=3306,
                          user='yourname', passwd='yourpass',
                          db='address', charset='utf8',
                          autocommit=True,
                          cursorclass=pymysql.cursors.DictCursor)
    while True:
        print('===== Address Book =====')
        print('1. Create a contact')
        print('2. Find contacts')
        print('3. Exit')
        print('===============')
        choice = int(input('Choose: '))
        if choice == 1:
            add_new_contacter(con)
        elif choice == 2:
            find_contacters(con)
        elif choice == 3:
            con.close()
            print('Thanks for using the address book. Bye!')
            break


if __name__ == '__main__':
    main()
