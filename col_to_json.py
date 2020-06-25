#!/usr/bin/env python3
#-*- coding: utf-8 -*-
from pymongo import MongoClient
import json

mongo_client = MongoClient('localhost', 27017)
db = mongo_client['activity-server']
col = db.registros

if __name__ == '__main__':
    cursor = col.find({})
    with open('registros.json', 'w') as file:
        #file.write('[')
        for doc in cursor:
            doc["_id"] = str(doc["_id"])
            file.write(json.dumps(doc))
            file.write('\n')
        #file.write(']')
        file.close()
