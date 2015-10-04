#!/usr/bin/python
'''
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

@date June 2012
@brief Python administration tool
@author: mwn
'''

import mysql.connector
import sys

print("start")
if len(sys.argv) > 1:
	server=sys.argv[1]
else:
	server="localhost"
db=mysql.connector.connect(host=server,user="yafraadmin",password="yafra",database="yafra")
print ("got connecton")


cursor = db.cursor()
sql="SELECT * from Person"
cursor.execute(sql)
# Fetch all the rows in a list of lists.
results = cursor.fetchall()
for row in results:
    adr = row[0]
    ctry = row[1]
    name = row[2]
    # Now print fetched result
    print ("Name: {}, Address: {}, Country: {}\n".format(name, adr, ctry))
cursor.close()
db.close()
print ("system: ", sys.platform)

print("stop")
#raw_input()
