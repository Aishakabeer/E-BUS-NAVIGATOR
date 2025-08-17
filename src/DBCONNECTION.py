# import pymysql
# def iud(q,val):
#     con=pymysql.connect(host='localhost',port=3307,user='root',passwd='',db="e-bus navigator")
#     cmd=con.cursor()
#     cmd.execute(q,val)
#     con.commit()

import pymysql

def iud(query, values):
    try:
        # Establish database connection
        con = pymysql.connect(host='localhost', port=3307, user='root', passwd='', db="e-bus navigator")
        cmd = con.cursor()
        
        # Execute the query with values
        cmd.execute(query, values)
        
        # Commit the transaction
        con.commit()
        print("Query executed successfully.")

    except Exception as e:
        # Rollback in case of error
        con.rollback()
        print("Error executing query:", e)
    
    finally:
        # Close cursor and connection
        cmd.close()
        con.close()


# def select(a):
#     con = pymysql.connect(host='localhost', port=3307, user='root', passwd='', db="e-bus navigator")
#     cmd = con.cursor()
#     cmd.execute(a)
#     s=cmd.fetchall()
#     return s
import pymysql

def select(a):
    try:
        # Establish database connection
        con = pymysql.connect(host='localhost', port=3307, user='root', passwd='', db="e-bus navigator")
        cmd = con.cursor()
        
        # Execute the query
        cmd.execute(a)
        
        # Fetch all results
        s = cmd.fetchall()
        
    except Exception as e:
        print("Error executing query:", e)
        s = None
    
    finally:
        # Close cursor and connection
        cmd.close()
        con.close()
    
    return s


def selectall(q,val):
    con = pymysql.connect(host='localhost', port=3307, user='root', passwd='', db="e-bus navigator")
    cmd = con.cursor()
    cmd.execute(q, val)
    s = cmd.fetchall()
    return s

def selectone(q,val):
    con = pymysql.connect(host='localhost', port=3307, user='root', passwd='', db="e-bus navigator")
    cmd = con.cursor()
    cmd.execute(q, val)
    s = cmd.fetchone()
    return s
