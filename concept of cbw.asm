;CBW convert signed byte into sined word
org 100h

.data


.code
main proc
     
     mov al,-5
     cbw   ;when it convert to signed word it will not be completed in al so ah is also used