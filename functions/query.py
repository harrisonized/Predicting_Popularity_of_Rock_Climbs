import os
from os.path import expanduser
import json
import pandas as pd
import pandas.io.sql as pd_sql
from sqlalchemy import create_engine
import psycopg2 as pg


# Functions included in this file:
# # connection_fetch_close


def connection_fetch_close(query, cred, dbname):
    """opens a new connection, fetches the data, then closes the connection
    """
    connection = pg.connect(**cred, dbname=dbname) # Connect
    cursor = connection.cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    connection.close()
    
    return results
