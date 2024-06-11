import sqlite3
batch = 1
seq_len = 128
file = '/home/chenyidong/quant/AutoAWQ/outputnsys/out_batch' + str(batch) + '_seq' + str(seq_len) + ".sqlite"
conn = sqlite3.connect(file)
cursor = conn.cursor()
cursor.execute("select name from sqlite_master where type='table' order by name")
students = cursor.fetchall()
print(students)


cursor.execute("SELECT end-start AS duration FROM CUPTI_ACTIVITY_KIND_KERNEL;")
students = cursor.fetchall()
print(students)