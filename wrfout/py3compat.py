import sys
PY3 = (sys.version_info[0] >= 3)

if PY3:
    utf8 = lambda s: s
else:
    utf8 = lambda s: s.decode('utf-8')
