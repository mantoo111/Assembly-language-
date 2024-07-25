;lab 8 task 3
org 100h
include emu8086.inc

.data
    input dw ?

.code
    print "Please Input an integer (11-19):"
    call scan_num
    print 0AH,0DH
    cmp cx,11
    je eleven
    cmp cx,12
    je twelve
    cmp cx,13
    je thirteen
    cmp cx,14
    je fourteen
    cmp cx,15
    je fifteen
    cmp cx,16
    je sixteen
    cmp cx,17
    je seventeen
    cmp cx,18
    je eighteen
    cmp cx,19
    je nineteen
    jmp invalid
eleven:
print "eleven"
jmp end
twelve:
print "twelve"
jmp end
thirteen:       
print "thirteen"
jmp end
fourteen:
print "fourteen"
jmp end
fifteen:
print "fifteen"
jmp end
sixteen:
print "sixteen"
jmp end
seventeen:
print "seventeen"
jmp end
eighteen:
print "eighteen"
jmp end
nineteen:
print "nineteen"
jmp end
invalid:
print "invalid input"
jmp end
end: hlt  

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS