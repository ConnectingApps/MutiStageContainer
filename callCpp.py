from ctypes import *
import os.path

print('Welcome to multistage')

lib_path = '/app/liblib.so'

itExist = os.path.exists(lib_path)
print(itExist)
if itExist:
    lib = cdll.LoadLibrary(lib_path)
    print('so file loaded loaded')
    returned_value = lib.GetValue()
    print(returned_value)
else:
    print('So file not found!!')
print('End')