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


@EBUS.route("/HISTORYS")
def HISTORYS():
    return render_template("TRAVELS HISTORY.html")

@EBUS.route("/UPDATEPROFILES")
def UPDATEPROFILE():
    return render_template("UPDATE PROFILE.html")

@EBUS.route("/UPDATETRAVELS")
def UPDATETRAVELSS():
    return render_template("UPDATE TRAVELS.html")

@EBUS.route("/FEEDBACK")
def FEEDBACK():
    return render_template("FEEDBACK.html")

@EBUS.route("/BLOCK")
def BLOCK():
    query = "SELECT bus.*,LOGIN.TYPE FROM  bus JOIN login ON login.id=bus.LOGIN_ID where LOGIN.TYPE='bus' OR LOGIN.TYPE='BLOCKED'"
    val = select(query)
    return render_template("BLO UNBLO.html",s=val)


@EBUS.route("/BLOD")
def BLOD():
    lid = request.args.get('lid')
    query = "update login set type='BLOCKED' where id=%s"
    value = lid
    iud(query, value)

    return '''<script>alert("BLOCKED");window.location="/BLOCK"</script>'''


@EBUS.route("/UBLOD")
def UBLOD():
    lid = request.args.get('lid')
    query = "update login set type='bus' where id=%s"
    value = lid
    iud(query, value)

    return '''<script>alert("UNBLOCK");window.location="/BLOCK"</script>'''
@EBUS.route("/EDITROUTE")
def EDITROUTE():
    lid = request.args.get('lid')
    session['id']=lid

    qry='select* from route where id=%s'
    val=lid
    res=selectone(qry,val)
    return render_template("EDIT ROUTE.html",val=res)

@EBUS.route("/UPROUTE",methods=['post'])
def UPROUTE():
    id=session['id']
    fromm=request.form['froms']
    to=request.form['tos']
    qry="update route set froms=%s , tos=%s where ID=%s"
    value=(fromm,to,str(id))
    iud(qry,value)
    return '''<script>alert("updated");window.location="/MANAGEROUTE"</script>'''


@EBUS.route("/DELROUTE",methods=['get'])
def DELROUTE():
    id=request.args.get('lid')

    qry="DELETE FROM route WHERE ID=%s"
    val=(str(id))
    iud(qry,val)
    return '''<script>alert("DELETION SUCCESSFULL");window.location="/MANAGEROUTE"</script>'''

@EBUS.route("/MANAGEROUTE")
def MANAGGEROUTE():
    qry="SELECT * FROM route"
    res=select(qry)
    return render_template("MANAGE ROUTE.html",val=res)
@EBUS.route("/MANAGESTOP")
def MANAGESTOP():
    q = "select* from route"
    res = select(q)
    return render_template("MANAGE STOP.html",val=res)
@EBUS.route("/TRACK BUS")
def TRACKBUS():
    q = "select* from bus"
    res = select(q)
    return render_template("TRACK BUS.html",val=res)

@EBUS.route("/TRACK BUSUSER")
def TRACKBUSUSER():
    q = "select* from bus"
    res = select(q)
    return render_template("TRACK BUS USER.html",val=res)

@EBUS.route("/TRACK BUSDRIVER")
def TRACKBUSDRIVER():
    q = "select* from bus"
    res = select(q)
    return render_template("TRACK BUS DRIVER.html",val=res)

@EBUS.route("/TRACKBUSnew",methods=['post'])
def TRACKBUSnew():
    reno=request.form['textfield']
    q = "SELECT bus.*,`time schedule`.*,`stop`.`LATITUDE`,`stop`,`LONGITUDE` FROM STOP JOIN `time schedule` ON `time schedule`.`STOP_ID`=`stop`.`STOP_ID` JOIN `bus`ON `bus`.`LOGIN_ID`=`time schedule`.`BUS_ID` where  `bus`.`REG_NO`=%s"
    res = selectall(q,reno)
    return render_template("TRACK BUS.html",val=res)

@EBUS.route("/VIEWBUSDRIVER")
def VIEWBUSTMEDRIVER():
    qry = "SELECT `BUS_NAME`, `STOP`, `TIME` FROM `bustime`"
    res = select(qry)
    return render_template("VIEW BUS  DRIVER.html")





@EBUS.route("/SERBUS",methods=['post'])
def SERBUS():
    reg = request.form['textfield']

    q = "SELECT `time schedule`.`TIME`,`stop`.`STOP`,`bus`.`BUS_NAME` FROM `bus` JOIN `time schedule` ON `time schedule`.`BUS_ID`=`bus`.`LOGIN_ID` JOIN `stop` ON `stop`.`STOP_ID`=`time schedule`.`STOP_ID` WHERE `bus`.`REG_NO`=%s"
    val = selectall(q,reg)
    return render_template("VIEW BUS TIME.html", vals=val)


@EBUS.route("/VIEWFEEDBACKDRIVER")
def VIEWFEEDBACKDRIVER():
    qry = "SELECT `USER-ID`, `FEEDBACK`, `DATE` FROM `feedback`"
    res = select(qry)
    return render_template("VIEW FEEDBACK DRIVER.html", val=res)

# @EBUS.route("/VIEWBUSTIME")
# def VIEWBUSTIME():
#     qry = "SELECT `BUS_NAME`, `STOP`,`TIME` FROM `bustime`"
#     res = select(qry)
#     return render_template("VIEW BUS TIME.html", vals=res)

@EBUS.route("/VIEWBUSTIME")
def VIEWBUSTIME():
    qry = "SELECT `BUS_NAME`, `STOP`, `TIME` FROM `bustime`"
    res = select(qry)  # Make sure this returns a list of tuples
    return render_template("VIEW BUS TIME.html", vals=res)  # Make sure to pass 'vals'


@EBUS.route("/VIEWBUSTIMEUSER") 
def VIEWBUSTIMEUSER(): 
    qry = "SELECT `BUS_NAME`, `STOP`,`TIME` FROM `bustime`"
    res = select(qry)
    return render_template("VIEW BUS USER.html", vals=res)

@EBUS.route("/VIEWBUSDRIVER") 
def VIEWBUSDRIVER(): 
    qry = "SELECT `BUS_NAME`, `STOP`,`TIME` FROM `bustime`"
    res = select(qry)
    return render_template("VIEW BUS DRIVER.html", vals=res)
   
@EBUS.route("/VIEWFEEDBACK")
def VIEWFEEDBACK():
    qry = "SELECT `USER-ID`, `FEEDBACK`, `DATE` FROM `feedback`"
    res = select(qry)
    return render_template("VIEW FEEDBACK.html", val=res)
@EBUS.route("/VIEWPASSENGER")
def VIEWPASSENGER():
    qry = "SELECT * FROM passenger "
    res = select(qry)
    return render_template("VIEW PASSENGER.html",val=res)
@EBUS.route("/BUSAPPROVAL")
def BUSAPPROVAL():
    query="SELECT* FROM  bus JOIN login ON login.id=bus.LOGIN_ID AND LOGIN.TYPE='bus' "
    val=select(query)
    return render_template("BUS APPROVAL.html",a=val)

@EBUS.route("/BUSREGT")
def BUSREGT():
    lid = request.args.get('lid')
    query = "update login set type='regected' where id=%s"
    value = lid
    iud(query, value)

    return '''<script>alert("REGECTED");window.location="/BUSAPPROVAL"</script>'''
@EBUS.route("/BUSAPPRU")
def BUSAPPRU():
    lid=request.args.get('lid')
    query="update login set type='bus' where id=%s"
    value=lid
    iud(query,value)
    return '''<script>alert("APPROVED");window.location="/BUSAPPROVAL"</script>'''


@EBUS.route("/LOGINCODE",methods=['post'])
def LOGINCODE():
    uname=request.form['usrname']
    upass=request.form['upass']
    qry="SELECT * FROM login WHERE `USERNAME`=%s AND `PASSWORD`=%s"
    value=(uname,upass)
    res=selectone(qry,value)
    if res is None:
        return '''<script>alert("INVALID CREDENTIALS");window.location="/"</script>'''
    elif res[3]=='user' or res[3]=='bus':
        return '''<script>alert(" ACCESS DENIED. LOGIN FOR ADMIN ONLY");window.location="/"</script>'''
    elif res[3]=='admin':
        return '''<script>window.location="/ADMINHOME"</script>'''
@EBUS.route("/ADRUTCOD",methods=['post'])
def ADRUTCOD():
    bstop=request.form['STRSTP']
    estop=request.form['ENDSTP']
    qry="INSERT INTO `route` VALUES(null,%s,%s)"
    value=(bstop,estop)
    iud(qry,value)
    return '''<script>alert("ADDED SUCCESSFULLY");window.location="/MANAGEROUTE"</script>'''
@EBUS.route("/ADSTPCOD",methods=['post'])
def ADSTPCOD():
    ROUT=request.form['RUTSLT']
    STOP=request.form['STOP']
    LATTI=request.form['LATTI']
    LONGI=request.form['LONGI']
    qry="INSERT INTO `STOP` VALUES(null,%s,%s,%s,%s)"
    value=(ROUT,STOP,LATTI,LONGI)
    iud(qry,value)
    return '''<script>alert("ADDED SUCCESSFULLY");window.location="/ADDSTOP"</script>'''
@EBUS.route("/MGSTP",methods=['post'])
def MGSTP():
    ROUT = request.form['RUTSLT']
    qry="select * from stop where route_id=%s"
    val=ROUT
    res=selectall(qry,val)
    q = "select* from route"
    reslt = select(q)
    return render_template("MANAGE STOP.html", vals=res,val=reslt)

@EBUS.route("/DELSTOP",methods=['get'])
def DELSTOP():
    id = request.args.get('id')
    qry="DELETE FROM stop WHERE `STOP_ID`=%s"
    val=(str(id))
    iud(qry,val)
    return '''<script>alert("DELETION SUCCESSFULL");window.location="/MANAGESTOP"</script>'''

@EBUS.route("/EDTSTOP",methods=['get'])
def EDTSTOP():
    id = request.args.get('id')
    session['id']=id
    qry="SELECT* FROM STOP WHERE STOP_ID=%s"
    val=(str(id))
    res=selectone(qry,val)
    return render_template("EDIT STOP.html",val=res)


@EBUS.route("/UPDSTOP",methods=['post'])
def UPDSTOP():
    id = session['id']
    stop=request.form['tos']
    lattittude = request.form['LAT']
    longitude = request.form['LOG']
    qry="UPDATE STOP set STOP=%s,LATITUDE=%s,LONGITUDE=%s WHERE `STOP_ID`=%s"
    val=(stop,lattittude,longitude,str(id))
    iud(qry,val)
    return '''<script>alert("UPDATION SUCCESSFULL");window.location="/MANAGESTOP"</script>'''



@EBUS.route('/admin_home')
def admin_home():
    return render_template('ADMIN HOME.html')

@EBUS.route('/user_home')
def user_home():
    return render_template('USER HOME.html')

@EBUS.route('/driver_home')
def driver_home():
    return render_template('DRIVER HOME.html')

# @EBUS.route("/USREG", methods=['post'])
# def USERREG():
#     fname = request.form['fname']
#     lname = request.form['lname']
#     gender = request.form['gender']
#     place = request.form['place']
#     post = request.form['post']
#     pin = request.form['pin']
#     email = request.form['email']
#     contact = request.form['contact']
#     username = request.form['username']
#     password = request.form['password']

#     # Insert into login table
#     login_query = "INSERT INTO login (USERNAME, PASSWORD, TYPE) VALUES (%s, %s, 'user')"
#     login_values = (username, password)
#     iud(login_query, login_values)

#     # Get the last inserted LOGIN_ID
#     login_id = selectone("SELECT LAST_INSERT_ID() as login_id")['login_id']

#     # Insert into passenger table
#     passenger_query = """INSERT INTO passenger 
#                          (LOGIN_ID, FNAME, LNAME, GENDER, PLACE, POST, PIN, EMAIL, CONTACT) 
#                          VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
#     passenger_values = (login_id, fname, lname, gender, place, post, pin, email, contact)
#     iud(passenger_query, passenger_values)

#     return '''<script>alert("User Registered Successfully");window.location="/USERHOME"</script>'''

# @EBUS.route("/USREG")
# def USERREG():
#     return render_template("USER REG.html")

@EBUS.route("/USREG", methods=['POST', 'GET'], endpoint='user_registration')
def user_registration():
    if request.method == 'POST':
        # Retrieve form data
        fname = request.form['fname']
        lname = request.form['lname']
        contact = request.form['contact']
        gender = request.form['gender']
        place = request.form['place']
        post = request.form['post']
        pin = request.form['pin']
        email = request.form['email']
        username = request.form['username']
        password = request.form['password']

        # Insert into login table
        login_query = "INSERT INTO login (USERNAME, PASSWORD, TYPE) VALUES (%s, %s, 'user')"
        login_values = (username, password)
        iud(login_query, login_values)

        # Get the last inserted LOGIN_ID
        login_id_tuple = selectone("SELECT LAST_INSERT_ID()", None)  # This returns a tuple
        login_id = login_id_tuple[0] if login_id_tuple else None  # Access the first element of the tuple

        # Insert into passenger table
        passenger_query = """INSERT INTO passenger 
                     (`LOGIN-ID`, `FNAME`, `LNAME`, `GENDER`, `PLACE`, `POST`, `PIN`, `EMAIL`, `CONTACT`) 
                     VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
        passenger_values = (login_id, fname, lname, gender, place, post, pin, email, contact)  # Include login_id if it's required
        iud(passenger_query, passenger_values)


        return '''<script>alert("User Registered Successfully");window.location="/USERHOME"</script>'''

    return render_template("USER REG.html")

@EBUS.route("/LOGINUSER",methods=['post'])
def LOGINUSER():
    uname=request.form['usrname']
    upass=request.form['upass']
    qry="SELECT * FROM login WHERE `USERNAME`=%s AND `PASSWORD`=%s"
    value=(uname,upass)
    res=selectone(qry,value)
    if res is None:
        return '''<script>alert("INVALID CREDENTIALS");window.location="/"</script>'''
    elif res[3]=='admin' or res[3]=='bus':
        return '''<script>alert(" ACCESS DENIED. LOGIN FOR USER ONLY");window.location="/"</script>'''
    elif res[3]=='user':
        return '''<script>window.location="/USERHOME"</script>'''
@EBUS.route("/HISTORY", methods=['GET', 'POST'])
def HISTORY():
    res = []  # Initialize an empty list to hold results
    if request.method == 'POST':
        phone_number = request.form.get('textfield')  # Get the phone number from the form
        print(f"Searching for phone number: {phone_number}")  # Debugging line
        qry = f"SELECT * FROM `history travel` WHERE PHONE_NUMBER = '{phone_number}'"
        print(f"Executing query: {qry}")  # Debugging line
        res = select(qry)  # Call with only the query string
    return render_template("TRAVELS HISTORY.html", val=res)



@EBUS.route("/UPDATETRAVELS", methods=['POST'])
def UPDATETRAVELS():
    ROUTE = request.form['ROUTE']
    STOP = request.form['STOP']
    DATE = request.form['DATE']
    BUSID = request.form['busid']
    PHNNO = request.form['phnno']
    
    # Updated SQL query to match the form data
    qry = "INSERT INTO `history travel` (`FROMS`, `TOS`, `DATE`, `BUS_ID`, `PHONE_NUMBER`) VALUES (%s, %s, %s, %s, %s)"
    value = (ROUTE, STOP, DATE, BUSID, PHNNO)  # Include all five values
    
    iud(qry, value)  # Pass the query and all five values to the database function
    return '''<script>alert("ADDED SUCCESSFULLY");window.location="/HISTORY"</script>'''

@EBUS.route("/SUBMITPROFILE", methods=['POST'])
def SUBMITPROFILE():
    try:
        driver_name = request.form['driver_name']
        phone = request.form['phone']
        bus_name = request.form['bus_name']
        address = request.form['address']
        
        qry = "INSERT INTO `bus` (`DRIVER_NAME`, `PHONE`, `BUS_NAME`, `ADDRESS`) VALUES (%s, %s, %s, %s)"
        value = (driver_name, phone, bus_name, address)
        
        iud(qry, value)
        return '''<script>alert("PROFILE UPDATED SUCCESSFULLY");window.location="/PROFILE"</script>'''
    except KeyError as e:
        return f"Missing form field: {str(e)}", 400


@EBUS.route("/SUBMITFEEDBACK", methods=['POST'])
def SUBMITFEEDBACK():
    userid = request.form['userid']
    feedback = request.form['feedback']
    DATE = request.form['date']
    
    # Assuming the correct column names are 'FROM' and 'TO'
    qry = "INSERT INTO `feedback` (`USER-ID`, `FEEDBACK`, `DATE`) VALUES (%s, %s, %s)"
    value = (userid, feedback, DATE)
    
    iud(qry, value)
    return '''<script>alert("ADDED SUCCESSFULLY");window.location="/FEEDBACK"</script>'''

@EBUS.route("/DRIVERREG")
def DRIVERREG():
    return render_template("DRIVER REG.html")


@EBUS.route("/DRIVERREG", methods=['POST', 'GET'], endpoint='driver_registration')
def driver_registration():
    if request.method == 'POST':
        # Retrieve form data
        name = request.form['name']
        contact = request.form['contact']
        busname = request.form['busname']
        address = request.form['address']
        email = request.form['email']
        username = request.form['username']
        password = request.form['password']

        # Insert into login table (login for driver)
        login_query = "INSERT INTO login (USERNAME, PASSWORD, TYPE) VALUES (%s, %s, 'driver')"
        login_values = (username, password)
        iud(login_query, login_values)

        # Get the last inserted LOGIN_ID
        login_id_tuple = selectone("SELECT LAST_INSERT_ID()", None)  # Fetch the last inserted login ID
        login_id = login_id_tuple[0] if login_id_tuple else None  # Access the first element of the tuple

        # Insert into driver table
        driver_query = """INSERT INTO driver 
                     (`LOGIN-ID`, `NAME`, `CONTACT`, `BUSNAME`, `ADDRESS`, `EMAIL`) 
                     VALUES (%s, %s, %s, %s, %s, %s)"""
        driver_values = (login_id, name, contact, busname, address, email)  # Include login_id for the driver
        iud(driver_query, driver_values)

        # Success message and redirect
        return '''<script>alert("Driver Registered Successfully");window.location="/DRIVERHOME"</script>'''

    return render_template("DRIVER_REG.html")

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