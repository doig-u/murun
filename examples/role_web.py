#!/usr/bin/python
import os, sys
os.chdir(os.path.dirname(os.path.realpath(__file__)))

result = os.system("""
common/first-configure.sh && 
nginx/install.sh
""")

sys.exit (result)