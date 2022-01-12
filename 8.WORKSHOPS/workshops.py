def new_func():
    x = "hello world"
    y = x.split(" ")
    a = ""
    for i in y:
        for j in i:
            if not j==i and not  j ==i[-1] :
                i =i.replace(j,"-")
        a+=i+"."
        print(a.strip())

new_func()


def donuts(a):
    b = a.split(",")
    new = ""
    for i in b:
        x = len(i)
        c = i.replace(i[1:(x-1):1], "-" *(x-2))
        new += c + " "
    return new.strip()
donuts("Raise-Hock-King")

# "yüksekliği verilen yılbaşı ağacını oluşturan fonksiyon yazın.""

def agc(yuksekligii):
    for i in range(1, 2*yuksekligii, 2):
        print(i*'#').center(2*yuksekligii-1)
agc(7)


def agac(yukseklik):
    i = 1
    while i <= 2*yukseklik -1:
        print(i*'#').center(2*yukseklik-1)
        i+=1
agac(7)












