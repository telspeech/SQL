import psycopg2

# Устанавливаем соединение с PostgreSQL
conn = psycopg2.connect(database="clients_db", user="postgres", password="postgres")

# Функция, создающая структуру БД (таблицы)
def create_table():
    cur = conn.cursor()
    cur.execute("
	CREATE TABLE IF NOT EXISTS clients (
	    id SERIAL PRIMARY KEY,
	    first_name VARCHAR(40),
        last_name VARCHAR(40),
	    email VARCHAR(60),
	    phone VARCHAR[]
	);
    ")
    conn.commit()
    cur.close

# Функция, позволяющая добавить нового клиента
def add_client(first_name, last_name, email, phones=[]):
    cur = conn.cursor()
    cur.execite("
	INSERT INTO client (first_name, last_name, email, phones)
	VALUES (%s, %s, %s, %s)
    ", (first_name, last_name, email, phones))
    conn.commit()
    cur.close()

# Функция, позволяющая добавить телефон для существующего клиента
def add_phone(client_id, phone):
    cur = conn.cursor()
    cur.execute("
	UPDATE clients
	SET phones = array_append(phones, %s)
	WHERE id = %s;
    ", (phone, client_id))
    conn.commit()
    cur.close()

# Функция, позволяющая изменить данные о клиенте
def update_client(client_id, first_name=None, last_name=None, email=None):
    cur = conn.cursor()
    query = "UPDATE clients SET"
    params = []
    if first_name:
	query += " first_name = %s,"
    params.append(first_name)
    if last_name:
	query += " last_name = %s,"
	params.append(last_name)
    if email:
	query += " email = %s,"
	params.append(email)
    query = query[:-1] + " WHERE id = %s;"
    params.append(clients_id)
    cur.execute(query, tuple(params))
    conn.commit()
    cur.close()

# Функция, позволяющая удалить телефон для существующего клиента
def delete_phone(client_id, phone):
    cur = conn.cursor()
    cur.execute("
	UPDATE clients
	SET phones = array_remove(phones, %s)
	WHERE id = %s
    ", (phone, client_id))
    conn.commit()
    cur.close()

# Функция, позволяющая удалить существующего клиента
def delete_client(client_id):
    cur = conn.cursor()
    cur.execute("DELETE FROM clients WHERE id = %s", (client_id,))
    conn.commit()
    cur.close()

# Функция, позволяющая найти клиента по его данным: имени, фамилии, email или телефону
def find_client(search):
    cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    cur.execute("
	SELECT * FROM clients
    WHERE first_name ILIKE %s OR last_name ILIKE %s OR email ILIKE %s OR phones @> ARRAY[%s]
    ", (search, search, search, search))
    clients = cur.fetchall()
    cur.close()
    return clients

# Создадим таблицу, добавим нового клиента, добавим номер телефона
create_table()
add_client("Ivan", "Ivanov", "ivan.ivanov@yandex.ru", ["84951234567"])
add_phone(1, "89991234567")