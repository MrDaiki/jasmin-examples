import ctypes
import random

def load():
    lib = ctypes.cdll.LoadLibrary("./build/quicksort/quicksort.so")
    
    long_ptr_sig = ctypes.POINTER(ctypes.c_long)
    long_sig = ctypes.c_long

    sig = [long_ptr_sig,long_ptr_sig,long_sig]
    lib.quicksort.argtypes = sig

    return lib

def shuffle(arr):

    for i in range(len(arr)-1):
        j = random.randint(0,len(arr)-1)
        arr[i],arr[j] = arr[j],arr[i]
    

def quicksort(arr):

    shuffle(arr)
    n = len(arr)
    arr_type = ctypes.c_long * (n)
    arr = arr_type(*arr)

    buff_type = ctypes.c_long * (n*2)
    buff = buff_type(*[0 for _ in range(n*2)])
    n = ctypes.c_long(n)

    lib = load()
    lib.quicksort(buff,arr,n)
    return list(arr)

def check_sorted(arr):
    for i in range(1,len(arr)):
        if arr[i] < arr[i-1]:
            return False
    return True


if __name__ == "__main__":
    arg = [i for i in range(100)]
    print(f"Test array sort : {check_sorted(quicksort(arg))}")
