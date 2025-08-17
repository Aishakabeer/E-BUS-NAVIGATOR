from flask import*
from DBCONNECTION import *

EBUS=Flask(__name__)
EBUS.secret_key="qwert"
@EBUS.route("/")
def login():
    return render_template("INDEX.html")
@EBUS.route("/ADDROUTE",methods=['post'] )
def ADDROUTE():
    return render_template("ADD ROUTE.html")
@EBUS.route("/ADDSTOP")
def ADDSTOP():
    q = "select* from route"
    res = select(q)
    return render_template("ADD STOP.html",val=res)

@EBUS.route("/ADMINLOGIN")
def ADMINLOGIN():
    return render_template("ADMIN LOGIN.html")

@EBUS.route("/ADMINHOME")
def ADMINHOME():
    return render_template("ADMIN HOME.html")


@EBUS.route("/USERLOGIN")
def USERLOGIN():
    return render_template("USER LOGIN.html")

@EBUS.route("/USERHOME")
def USERHOME():
    return render_template("USER HOME.html")

@EBUS.route("/DRIVERLOGIN")
def DRIVERLOGIN():
    return render_template("DRIVER LOGIN.html")

@EBUS.route("/DRIVERHOME")
def DRIVERHOME():
    return render_template("DRIVER HOME.html")



@EBUS.route("/BUSINFO")
def BUSINFO():
    # Update the query to select the required fields
    qry = "SELECT `BUSNAME`, `CONTACT`, `ADDRESS` FROM `driver`"
    res = select(qry)  # Ensure your select function works correctly
    return render_template("BUS INFORMATION.html", val=res)  # Pass the results to the template


@EBUS.route("/DRIVERLOGIN", methods=['POST'])
def LOGINDRIVER():
    uname = request.form['usrname']
    upass = request.form['upass']
    
    # Query to check driver credentials
    qry = "SELECT * FROM login WHERE `USERNAME`=%s AND `PASSWORD`=%s"
    value = (uname, upass)
    res = selectone(qry, value)
    
    if res is None:
        return '''<script>alert("INVALID CREDENTIALS");window.location="/"</script>'''
    
    # Check if the user is not a driver
    elif res[3] != 'driver':
        return '''<script>alert("ACCESS DENIED. LOGIN FOR DRIVER ONLY");window.location="/"</script>'''
    
    # If the user is a driver, redirect to DRIVERHOME
    elif res[3] == 'driver':
        return '''<script>window.location="/DRIVERHOME"</script>'''



if __name__ == "__main__":
    EBUS.run(debug=True)
