from flask import Flask 
app = Flask(__name__) 
  
# routing the decorator function hello_name 
@app.route('/')   
def hello_name(): 
   return 'Hello Toystack123!!' 
  

