import ctypes


S_LIMIT = 16

def coord(x,y):
    return x * S_LIMIT + y

def p_matrix(t,n,m):
    for i in range(n):
        stack = ""
        for j in range(m):
            stack += f"{t[coord(i,j)]}  "
        print(stack)

def load():
    lib = ctypes.cdll.LoadLibrary("./build/levenshtein/levenshtein.so")
    
    long_ptr_sig = ctypes.POINTER(ctypes.c_long)
    char_ptr_sig = ctypes.POINTER(ctypes.c_char)

    long_sig = ctypes.c_long

    sig = [long_ptr_sig, char_ptr_sig,char_ptr_sig,long_sig,long_sig]

    lib.levenshtein.argtypes = sig

    return lib


def next(pos:int,buffer):
    pos += 1
    if pos >= len(buffer):
        pos = 0
    return pos

def prev(pos,buffer):
    pos -= 1
    if pos < 0:
        pos = len(buffer) - 1
    return pos

def min3(a,b,c):
    return min(a,min(b,c))

def levenstein_line(s1,i,s2,buffer,pos):

    for j in range(len(s2)):
        x10 = buffer[prev(pos,buffer)] + 1
        x01 = buffer[next(pos,buffer)] + 1
        x11 = buffer[pos]

        if s1[i] != s2[j]:
            x11 += 1

        buffer[pos] = min3(x10,x01,x11)

        pos = next(pos,buffer)


    return pos,buffer




def lev(s1,s2):

    buffer_size = len(s2) + 2
    wt = [0 for _ in range(buffer_size)]

    for i in range(buffer_size):
        wt[i] = i

    wt[-1] = 1
    pos = 0

    # print(wt[:-1])
    for i in range(len(s1)):
        pos,wt = levenstein_line(s1,i,s2,wt,pos)
        if i<len(s1)-1:
            wt[pos]=i+2
            pos = next(pos,wt)
        # print(wt[pos:]+wt[:pos-1])
            
    pos = next(pos,wt)
    # print(wt[pos:]+wt[:pos-1])
    # print(wt[pos])

    return wt[pos]

            
            
    

def levenshtein_distance_optimised(s1,s2):


    buffer_size = len(s2) + 2

    s1_t = ctypes.create_string_buffer(bytes(s1,"ascii"),len(s1))
    s2_t = ctypes.create_string_buffer(bytes(s2,"ascii"),len(s2))
    s1_s = len(s1)
    s2_s = len(s2)

    arr = [0 for _ in range(buffer_size)]
    type_lev = ctypes.c_long * (buffer_size)

    t = type_lev(*arr)
    s1_cs = ctypes.c_long(s1_s)
    s2_cs = ctypes.c_long(s2_s)

    lib = load()
    lev_distance = lib.levenshtein(t,s1_t,s2_t,s1_cs,s2_cs)
    return lev_distance


if __name__ == "__main__":
    s1 = "niche"
    s2 = "chiens"

    d = levenshtein_distance_optimised(s1,s2)
    d_ref = lev(s1,s2)

    print(f"Jasmin implementation :\t\t {d}\nReference implementation :\t {d_ref}")

    #TODO : Add multiple tests cases to check the correctness of the implementation
