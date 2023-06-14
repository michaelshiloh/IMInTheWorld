import os

PATH=os.getcwd()
PAGE=["1-1","1-2","1-3","2-1","2-2","3-1","3-2"]

currentPage="1-1"
tic=6
ticEnd=False
currentIm=1

def update():
    global currentPage
    #Page 1-1
    if currentPage=="1-1":
        if 87*2<=mouseX<=372*2:
            if 262*2<=mouseY<=312*2:
                currentPage="1-2"
            elif 368*2<=mouseY<=418*2:
                currentPage="1-3"
    #Page 1-2
    elif currentPage=="1-2":
        if 87*2<=mouseX<=372*2:
            if 368*2<=mouseY<=418*2:
                currentPage="1-3"
            elif mouseY<262*2 or mouseY>312*2:
                currentPage="1-1"
        else:
            currentPage="1-1"
        if mousePressed:
            currentPage="2-1"
    #Page 1-3
    elif currentPage=="1-3":
        if 87*2<=mouseX<=372*2:
            if mouseY<368*2 or mouseY>418*2:
                currentPage="1-1"
            elif 262*2<=mouseY<=312*2:
                currentPage="1-2"
        else:
            currentPage="1-1"
        if mousePressed:
            currentPage="3-1"

def mouseClicked():
    global currentPage
    global ticEnd
    #Page 2-1
    if currentPage=="2-1":
        if 35*2<=mouseX<=75*2 and 29*2<=mouseY<=69*2:
            currentPage="1-1"
            ticEnd=False
        elif 177*2<=mouseX<=177*2+120 and 614*2<=mouseY<=614*2+120:
            currentPage="2-2"
            ticEnd=False
    #Page 2-2
    elif currentPage=="2-2":
        if 35*2<=mouseX<=75*2 and 29*2<=mouseY<=69*2:
            currentPage="1-1"
        elif 177*2<=mouseX<=177*2+120 and 579*2<=mouseY<=579*2+120:
            currentPage="1-1"
    #Page 3-1
    elif currentPage=="3-1":
        if 35*2<=mouseX<=75*2 and 29*2<=mouseY<=69*2:
            currentPage="1-1"
        elif 177*2<=mouseX<=177*2+120 and 579*2<=mouseY<=579*2+120:
            currentPage="3-2"
    #Page 3-2
    elif currentPage=="3-2":
        if 35*2<=mouseX<=75*2 and 29*2<=mouseY<=69*2:
            currentPage="1-1"
        elif 177*2<=mouseX<=177*2+120 and 579*2<=mouseY<=579*2+120:
            currentPage="1-1"
            
def display():
    global currentPage
    global tic
    global ticEnd
    global currentIm
    bg=loadImage(PATH+"/images/frame"+currentPage+".jpg")
    image(bg,0,0,414*2,736*2)
    if currentPage=="2-1":
        if not ticEnd and tic>0:
            pic=loadImage(PATH+"/images/2-1.jpg")
            image(pic,57*2,116*2,600,760)
            tic-=1
        else:
            pic=loadImage(PATH+"/images/2-5.jpg")
            image(pic,57*2,116*2,600,760)
            tic=6
            ticEnd=True
    elif currentPage=="2-2":
        if tic>0:
            pic=loadImage(PATH+"/images/2-"+str(currentIm)+".jpg")
            image(pic,57*2,116*2,600,760)
            tic-=1
        else:
            tic=6
            currentIm+=1
            if currentIm>4:
                currentIm=1
    if currentPage=="3-1":
        if not ticEnd and tic>0:
            pic=loadImage(PATH+"/images/3-1.jpg")
            image(pic,57*2,116*2,600,760)
            tic-=1
        else:
            pic=loadImage(PATH+"/images/3-2.jpg")
            image(pic,57*2,116*2,600,760)
            tic=6
            ticEnd=True
    if currentPage=="3-2":
        pic=loadImage(PATH+"/images/3-3.jpg")
        image(pic,57*2,116*2,600,760)

def setup():
    size(414*2,736*2)
    bg=loadImage(PATH+"/images/frame1-1.jpg")
    image(bg,0,0,414*2,736*2)

def draw():
    update()
    display()
